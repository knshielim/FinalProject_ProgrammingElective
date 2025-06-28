document.addEventListener("DOMContentLoaded", function () {
    const destinationSelect = document.getElementById("select-destination");
    const packageSelect = document.getElementById("select-package");
    const bookingDestinationIdInput = document.getElementById("booking-destination-id");
    const bookingPackageIdInput = document.getElementById("booking-package-id");

    const nameInput = document.getElementById("name");
    const emailInput = document.getElementById("email");
    const phoneInput = document.getElementById("phone");
    const autofillPrompt = document.getElementById("autofillPrompt"); // This element only exists if isLoggedIn

    let allDestinationsData = [];

    // Function to fetch data from the server (api_data.jsp)
    async function fetchDestinationsAndPackages() {
        try {
            const response = await fetch('api_data.jsp');
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            allDestinationsData = await response.json();
            populateDestinations();
        } catch (error) {
            console.error("Error fetching data:", error);
            destinationSelect.innerHTML = '<option value="">-- Error loading destinations --</option>';
            alert("Failed to load tour data. Please try again later.");
        }
    }

    // Function to populate the destination dropdown
    function populateDestinations() {
        destinationSelect.innerHTML = '<option value="">-- Choose Destination --</option>';
        allDestinationsData.forEach(destination => {
            const option = document.createElement("option");
            option.value = destination.id;
            option.textContent = destination.name;
            destinationSelect.appendChild(option);
        });

        // After populating, attempt to pre-select if IDs are present in URL
        if (preselectedDestinationId && preselectedDestinationId !== "null") {
            destinationSelect.value = preselectedDestinationId;
            populatePackages(preselectedDestinationId);

            setTimeout(() => {
                if (preselectedPackageId && preselectedPackageId !== "null") {
                    packageSelect.value = preselectedPackageId;
                    bookingPackageIdInput.value = preselectedPackageId;
                }
            }, 50);
        }
    }

    // Function to populate the package dropdown based on selected destination ID
    function populatePackages(selectedDestinationId) {
        packageSelect.innerHTML = '<option value="">-- Choose Package --</option>';
        packageSelect.disabled = true;
        bookingPackageIdInput.value = '';

        const selectedDestination = allDestinationsData.find(d => d.id == selectedDestinationId);
        if (selectedDestination && selectedDestination.packages.length > 0) {
            selectedDestination.packages.forEach(pkg => {
                const option = document.createElement("option");
                option.value = pkg.id;
                option.textContent = pkg.name;
                packageSelect.appendChild(option);
            });
            packageSelect.disabled = false;
        } else {
            packageSelect.innerHTML = '<option value="">No packages available for this destination</option>';
        }
    }

    // Event listener for destination dropdown change
    destinationSelect.addEventListener("change", function () {
        populatePackages(this.value);
        bookingDestinationIdInput.value = this.value;
    });

    // Event listener for package dropdown change
    packageSelect.addEventListener("change", function() {
        bookingPackageIdInput.value = this.value;
    });

    // --- Auto-fill logic starts here ---
    if (isLoggedIn && autofillPrompt) { // Check if user is logged in AND the prompt element exists
        const autofillButton = document.getElementById("autofillButton");
        const skipAutofillButton = document.getElementById("skipAutofillButton");

        autofillButton.addEventListener("click", function() {
            nameInput.value = loggedInUser.fullName;
            emailInput.value = loggedInUser.email;
            phoneInput.value = loggedInUser.phoneNumber;
            autofillPrompt.style.display = 'none'; // Hide the prompt after auto-filling
        });

        skipAutofillButton.addEventListener("click", function() {
            autofillPrompt.style.display = 'none'; // Hide the prompt if user skips
        });
    }

    // --- Auto-fill logic ends here ---

    // Initial fetch when the page loads
    fetchDestinationsAndPackages();
});
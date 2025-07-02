document.addEventListener("DOMContentLoaded", function () {
    const destinationSelect = document.getElementById("select-destination");
    const packageSelect = document.getElementById("select-package");
    const bookingDestinationIdInput = document.getElementById("booking-destination-id");
    const bookingPackageIdInput = document.getElementById("booking-package-id");

    const urlParams = new URLSearchParams(window.location.search);
    const preselectedDestinationId = urlParams.get("destinationId");
    const preselectedPackageId = urlParams.get("packageId");

    let allDestinationsData = [];

    async function fetchDestinationsAndPackages() {
        try {
            const response = await fetch("/FinalProject_ProgrammingElective/api/data");
            if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
            allDestinationsData = await response.json();
            populateDestinations();
        } catch (error) {
            console.error("Error fetching data:", error);
            destinationSelect.innerHTML = '<option value="">-- Error loading destinations --</option>';
            alert("Failed to load tour data. Please try again later.");
        }
    }

    function populateDestinations() {
        destinationSelect.innerHTML = '<option value="">-- Choose Destination --</option>';
        allDestinationsData.forEach(destination => {
            const option = document.createElement("option");
            option.value = destination.id;
            option.textContent = destination.name;
            destinationSelect.appendChild(option);
        });

        if (preselectedDestinationId) {
            destinationSelect.value = preselectedDestinationId;
            populatePackages(preselectedDestinationId);

            setTimeout(() => {
                if (preselectedPackageId) {
                    packageSelect.value = preselectedPackageId;
                    bookingPackageIdInput.value = preselectedPackageId;
                }
            }, 100);
        }
    }

    function populatePackages(destId) {
        packageSelect.innerHTML = '<option value="">-- Choose Package --</option>';
        packageSelect.disabled = true;

        const dest = allDestinationsData.find(d => d.id == destId);
        if (dest && dest.packages.length > 0) {
            dest.packages.forEach(pkg => {
                const option = document.createElement("option");
                option.value = pkg.id;
                option.textContent = pkg.name;
                packageSelect.appendChild(option);
            });
            packageSelect.disabled = false;
        } else {
            packageSelect.innerHTML = '<option value="">No packages available</option>';
        }
    }

    destinationSelect.addEventListener("change", function () {
        populatePackages(this.value);
        bookingDestinationIdInput.value = this.value;
    });

    packageSelect.addEventListener("change", function () {
        bookingPackageIdInput.value = this.value;
    });

    fetchDestinationsAndPackages();
});

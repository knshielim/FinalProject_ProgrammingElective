document.addEventListener("DOMContentLoaded", function () {
    const destinationSelect = document.getElementById("select-destination");
    const packageSelect = document.getElementById("select-package");

    const packageOptions = {
        "Borobudur Temple": ["Family Journey", "Adventure Trail", "Cultural Luxury"],
        "Bali Island": ["Beach Getaway", "Adventure Retreat", "Beachside Romance"],
        "Raja Ampat": ["Marine Discovery", "Eco Explorer", "Luxury Dive Cruise"],
        "Mount Bromo": ["Sunrise Experience", "Scenic Discovery", "Crater Adventure"],
        "Lake Toba": ["Cultural Retreat", "Adventure Discovery", "Honeymoon Escape"],
        "Pulau Seribu": ["Island Escape", "Couple's Getaway", "Water Adventure"],
        "Monas National Monument": ["Historical Exploration", "Heritage Tour", "Night City Escape"],
        "Komodo Island": ["Explorer Package", "Wildlife Trek", "Explorer's Escape"],
        "Labuan Bajo": ["Quick Adventure", "Island Discovery", "Romantic Escape"],
        "Prambanan Temple": ["Cultural Discovery", "Romantic Heritage Escape", "Budget Explorer"]
    };

    // Populate package dropdown based on selected destination
    destinationSelect.addEventListener("change", function () {
        const selectedDestination = this.value;
        packageSelect.innerHTML = '<option value="">-- Choose Package --</option>';

        if (packageOptions[selectedDestination]) {
            packageOptions[selectedDestination].forEach(pkg => {
                const option = document.createElement("option");
                option.value = pkg;
                option.textContent = pkg;
                packageSelect.appendChild(option);
            });
        }
    });
});

document.querySelector("form").addEventListener("submit", function (e) {
    // Optional: If you want to build a dynamic URL manually
    // e.preventDefault();

    const destination = document.getElementById("select-destination").value;
    const pkg = document.getElementById("select-package").value;

    // Auto-fill hidden/readonly fields if needed
    document.getElementById("booking-destination").value = destination;
    document.getElementById("booking-package").value = pkg;
});

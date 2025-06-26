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

    function populatePackages(destination) {
        packageSelect.innerHTML = '<option value="">-- Choose Package --</option>';
        if (packageOptions[destination]) {
            packageOptions[destination].forEach(pkg => {
                const option = document.createElement("option");
                option.value = pkg;
                option.textContent = pkg;
                packageSelect.appendChild(option);
            });
        }
    }

    destinationSelect.addEventListener("change", function () {
        populatePackages(this.value);
    });

    // Auto-select from ?package=
    const urlParams = new URLSearchParams(window.location.search);
    const preselectedPackage = urlParams.get('package');

    if (preselectedPackage) {
        for (const [destination, packages] of Object.entries(packageOptions)) {
            if (packages.includes(preselectedPackage)) {
                destinationSelect.value = destination;
                populatePackages(destination);
                setTimeout(() => {
                    packageSelect.value = preselectedPackage;
                }, 100);
                break;
            }
        }
    }
});

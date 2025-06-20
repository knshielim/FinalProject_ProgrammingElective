document.addEventListener("DOMContentLoaded", function () {
    const destinationSelect = document.getElementById("destination");
    const packageSelect = document.getElementById("package");

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

    destinationSelect.addEventListener("change", function () {
        const selectedDestination = this.value;
        packageSelect.innerHTML = '<option value="">-- Select Package --</option>';

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

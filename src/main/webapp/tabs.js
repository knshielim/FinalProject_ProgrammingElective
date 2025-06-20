document.addEventListener("DOMContentLoaded", function () {
    const tabButtons = document.querySelectorAll(".tab-btn");
    const tabContents = document.querySelectorAll(".tab-content");

    tabButtons.forEach((button, index) => {
        button.addEventListener("click", () => {
            tabButtons.forEach(btn => btn.classList.remove("active"));
            tabContents.forEach(tab => tab.classList.remove("active"));

            button.classList.add("active");
            tabContents[index].classList.add("active");
        });
    });

    // Save the current page as last visited
    sessionStorage.setItem("lastVisitedTab", window.location.href);
});

function goBackToPreviousTab() {
    const lastViewed = sessionStorage.getItem("lastVisitedTab");
    if (lastViewed) {
        window.location.href = lastViewed;
    } else {
        alert("No previous tab history found.");
    }
}

const methodButtons = document.querySelectorAll(".method-btn");
const sections = {
    card: document.getElementById("payment-card"),
    online: document.getElementById("payment-online"),
    ewallet: document.getElementById("payment-ewallet")
};
const selectedMethodInput = document.getElementById("selected-method");

methodButtons.forEach(button => {
    button.addEventListener("click", () => {
        methodButtons.forEach(btn => btn.classList.remove("active"));
        button.classList.add("active");

        const method = button.dataset.method;
        selectedMethodInput.value = method;

        for (let key in sections) {
            sections[key].classList.remove("active");
        }
        sections[method].classList.add("active");
    });
});
document.addEventListener("DOMContentLoaded", () => {
    const methodButtons = document.querySelectorAll(".method-btn");
    const sections = document.querySelectorAll(".payment-section");
    const selectedMethodInput = document.getElementById("selected-method");

    const methodFields = {
        card: ["card-number", "card-expiry", "card-cvv", "card-name"],
        online: ["bank"],
        ewallet: ["ewallet"]
    };

    methodButtons.forEach(btn => {
        btn.addEventListener("click", () => {
            // Remove active class from all buttons
            methodButtons.forEach(b => b.classList.remove("active"));
            btn.classList.add("active");

            const method = btn.dataset.method;
            selectedMethodInput.value = method;

            // Show only selected section
            sections.forEach(sec => sec.classList.remove("active"));
            document.getElementById(`payment-${method}`).classList.add("active");

            // Clear required attributes
            Object.values(methodFields).flat().forEach(id => {
                const el = document.getElementById(id);
                if (el) el.removeAttribute("required");
            });

            // Set required only for the current method's fields
            methodFields[method].forEach(id => {
                const el = document.getElementById(id);
                if (el) el.setAttribute("required", "required");
            });
        });
    });

    // Trigger default method on load
    document.querySelector(".method-btn.active")?.click();
});

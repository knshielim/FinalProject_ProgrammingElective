function handleRegistration(event) {
    event.preventDefault(); // Stops the form from auto-submitting

    const password = document.getElementById("reg-password").value;
    const confirmPassword = document.getElementById("reg-confirm-password").value;

    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return false; // Cancel submission
    }

    // If passwords match, go ahead and submit
    event.target.submit();
}

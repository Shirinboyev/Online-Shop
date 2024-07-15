// File: js/logoutConfirmation.js

function showLogoutConfirmation() {
    document.getElementById("logoutConfirmation").style.display = "block";
}

function hideLogoutConfirmation() {
    document.getElementById("logoutConfirmation").style.display = "none";
}

function confirmLogout() {
    window.location.href = "/logout";
}

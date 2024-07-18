function showLogoutConfirmation() {
    document.getElementById('logoutConfirmation').style.display = 'block';
}

function hideLogoutConfirmation() {
    document.getElementById('logoutConfirmation').style.display = 'none';
}

function confirmLogout() {
    window.location.href = '/logout'; // Adjust the URL as per your logout endpoint
}

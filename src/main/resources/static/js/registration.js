document.getElementById('togglePassword').addEventListener('click', function () {
    togglePasswordVisibility('password', this);
});

document.getElementById('toggleConfirmPassword').addEventListener('click', function () {
    togglePasswordVisibility('confirmPassword', this);
});

function togglePasswordVisibility(inputId, button) {
    var passwordInput = document.getElementById(inputId);
    var icon = button.querySelector('i');

    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        passwordInput.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
}

document.getElementById('registrationForm').addEventListener('submit', function (event) {
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirmPassword').value;

    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        event.preventDefault();
    }
});
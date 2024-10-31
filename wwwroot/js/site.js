document.addEventListener("DOMContentLoaded", function () {
    const registroForm = document.getElementById("registroForm");

    if (registroForm) {
        registroForm.addEventListener("submit", function (event) {
            const contraseña = document.getElementById("contraseña").value;
            const confirmarContraseña = document.getElementById("confirmarContraseña").value;

            // Reglas de validación: Al menos un carácter especial, una letra mayúscula y mínimo 8 caracteres
            const regex = /^(?=.*[!@#$%^&*])(?=.*[A-Z]).{8,}$/;

            if (!regex.test(contraseña)) {
                alert("La contraseña debe tener al menos un carácter especial, una letra en mayúscula y al menos 8 caracteres.");
                event.preventDefault();
            } else if (contraseña !== confirmarContraseña) {
                alert("Las contraseñas no coinciden.");
                event.preventDefault();
            }
        });
    }
});

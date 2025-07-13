document.addEventListener('DOMContentLoaded', () => {
    const empresaForm = document.getElementById('empresa-form');

    empresaForm.addEventListener('submit', async (event) => {
        event.preventDefault(); // Evitar el envío por defecto del formulario

        const razonSocial = document.getElementById('razon-social').value;
        const ruc = document.getElementById('ruc').value;
        const emailEmpresa = document.getElementById('email-empresa').value;
        const telefonoEmpresa = document.getElementById('telefono-empresa').value;
        const direccionEmpresa = document.getElementById('direccion-empresa').value;
        const passwordEmpresa = document.getElementById('password-empresa').value;
        const confirmPasswordEmpresa = document.getElementById('confirm-password-empresa').value;

        if (passwordEmpresa !== confirmPasswordEmpresa) {
            alert('Las contraseñas no coinciden.');
            return;
        }

        const formData = {
            Razon_Social: razonSocial,
            RUC: ruc,
            Email_Empresa: emailEmpresa,
            Telefono_Empresa: telefonoEmpresa,
            Direccion_Empresa: direccionEmpresa,
            password: passwordEmpresa // Asegúrate de que tu backend hashee esto
        };

        try {
            // **IMPORTANTE:** Ajusta esta URL al endpoint de registro de empresas en tu backend
            const response = await fetch('http://localhost:3000/api/empresas/registro', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            });

            const result = await response.json();

            if (response.ok) {
                alert('¡Empresa registrada exitosamente! Ya puedes iniciar sesión.');
                window.location.href = 'login.html'; // Redirigir a la página de login
            } else {
                alert('Error al registrar la empresa: ' + (result.message || 'Hubo un problema.'));
            }
        } catch (error) {
            console.error('Error en la conexión:', error);
            alert('Error de conexión. Inténtalo de nuevo más tarde.');
        }
    });
});
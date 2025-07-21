console.log("Hola desde login.js");

document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('login-form');

    loginForm.addEventListener('submit', async (event) => {
        event.preventDefault(); // Evita que se recargue la página

        const email = document.getElementById('email-login').value;
        const password = document.getElementById('password-login').value;

        const formData = {
            email: email,
            password: password
        };

        try {
            const response = await fetch('http://localhost/bolsa_trabajo/backend/login.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            });

            const result = await response.json();
            console.log("Respuesta del backend:", result); // ✅ Aquí sí es válido

            if (response.ok) {
                localStorage.setItem('userRole', result.role);

                alert('¡Inicio de sesión exitoso!');

                // Redirección según rol
            // Redirección según rol
            if (result.role.trim() === 'admin') {
                window.location.href = 'admin_dashboard.html';
            } else if (result.role.trim() === 'postulante') {
                window.location.href = 'postulante_dashboard.html';
            } else {
                alert('Rol no válido');
                window.location.href = 'index.html';
            }


            } else {
                alert('Error al iniciar sesión: ' + (result.message || 'Credenciales incorrectas.'));
            }

        } catch (error) {
            console.error('Error en la conexión:', error);
            alert('Error de conexión. Inténtalo de nuevo más tarde.');
        }
    });
});

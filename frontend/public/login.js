document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('login-form');

    loginForm.addEventListener('submit', async (event) => {
        event.preventDefault(); // Evitar el envío por defecto del formulario

        const email = document.getElementById('email-login').value;
        const password = document.getElementById('password-login').value;

        const formData = {
            email: email,
            password: password
        };

        try {
            // **IMPORTANTE:** Ajusta esta URL al endpoint de login en tu backend
            const response = await fetch('http://localhost:3000/api/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            });

            const result = await response.json();

            if (response.ok) {
                // Suponemos que el backend devuelve un token y un rol (ej. 'postulante', 'empresa')
                // Guarda el token en localStorage para futuras peticiones
                localStorage.setItem('token', result.token);
                localStorage.setItem('userRole', result.role); // Asume que el backend devuelve el rol

                alert('¡Inicio de sesión exitoso!');

                // Redirigir según el rol
                if (result.role === 'postulante') {
                    // Crea estas páginas más adelante
                    window.location.href = 'postulante-dashboard.html';
                } else if (result.role === 'empresa') {
                    // Crea estas páginas más adelante
                    window.location.href = 'empresa-dashboard.html';
                } else {
                    // Por si acaso, una página por defecto o error
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
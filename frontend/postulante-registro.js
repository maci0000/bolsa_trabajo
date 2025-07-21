document.addEventListener('DOMContentLoaded', () => {
    const universidadSelect = document.getElementById('universidad');

    async function loadUniversidades() {
        try {
            const response = await fetch('http://localhost/bolsa_trabajo/backend/universidades.php'); // ✅ asegúrate de que esta ruta sea correcta

            if (!response.ok) {
                throw new Error('Error al cargar las universidades');
            }

            const universidades = await response.json();

            // Limpiar y agregar opciones
            universidadSelect.innerHTML = '<option value="">Selecciona tu Universidad</option>';
            universidades.forEach(uni => {
                const option = document.createElement('option');
                option.value = uni.ID_Universidad;
                option.textContent = uni.Nombre_Universidad;
                universidadSelect.appendChild(option);
            });
        } catch (error) {
            console.error('Error:', error);
            alert('No se pudieron cargar las universidades. Inténtalo de nuevo más tarde.');
        }
    }

    // Cargar al abrir la página
    loadUniversidades();
});

    // Manejar el envío del formulario
    postulanteForm.addEventListener('submit', async (event) => {
        event.preventDefault(); // Evitar el envío por defecto del formulario

        const nombre = document.getElementById('nombre').value;
        const apellido = document.getElementById('apellido').value;
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirm-password').value;
        const carrera = document.getElementById('carrera').value;
        const añoIngreso = document.getElementById('año-ingreso').value;
        const telefono = document.getElementById('telefono').value;
        const idUniversidad = universidadSelect.value;

        if (password !== confirmPassword) {
            alert('Las contraseñas no coinciden.');
            return;
        }

        if (!idUniversidad) {
            alert('Por favor, selecciona tu universidad.');
            return;
        }

        const formData = {
            Nombre: nombre,
            Apellido: apellido,
            Email_Estudiante: email,
            password: password, // Asegúrate de que tu backend hashee esto
            Carrera: carrera,
            Año_Ingreso: parseInt(añoIngreso),
            Teléfono_Estudiante: telefono,
            ID_Universidad: parseInt(idUniversidad)
        };

        try {
            const response = await fetch('http://localhost:3000/api/postulantes/registro', { // Ajusta la URL de tu backend
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            });

            const result = await response.json();

            if (response.ok) {
                alert('¡Registro exitoso! Ya puedes iniciar sesión.');
                window.location.href = 'login.html'; // Redirigir a la página de login
            } else {
                alert('Error al registrar: ' + (result.message || 'Hubo un problema.'));
            }
        } catch (error) {
            console.error('Error en la conexión:', error);
            alert('Error de conexión. Inténtalo de nuevo más tarde.');
        }
    });

document.addEventListener('DOMContentLoaded', () => {
    const universidadSelect = document.getElementById('universidad');
    const postulanteForm = document.getElementById('postulante-form');

    // Cargar universidades desde el backend
    async function loadUniversidades() {
        try {
            const response = await fetch('http://localhost/bolsa_trabajo/backend/universidades.php');
            if (!response.ok) throw new Error('No se pudo cargar universidades');

            const universidades = await response.json();

            universidadSelect.innerHTML = '<option value="">Selecciona tu Universidad</option>';
            universidades.forEach(uni => {
                const option = document.createElement('option');
                option.value = uni.ID_Universidad;
                option.textContent = uni.Nombre_Universidad;
                universidadSelect.appendChild(option);
            });
        } catch (error) {
            console.error('Error al cargar universidades:', error);
            alert('No se pudieron cargar las universidades. Intenta más tarde.');
        }
    }

    loadUniversidades(); // Llamar al cargar la página

    // Manejar el envío del formulario
    postulanteForm.addEventListener('submit', async (event) => {
        event.preventDefault();

        // Asegúrate de que todos los IDs existen en tu HTML
        const formData = {
            Nombre: document.getElementById('nombre').value.trim(),
            Apellido: document.getElementById('apellido').value.trim(),
            Email_Estudiante: document.getElementById('email').value.trim(),
            password: document.getElementById('password').value,
            Carrera: document.getElementById('carrera').value.trim(),
            Año_Ingreso: parseInt(document.getElementById('año-ingreso').value),
            Teléfono_Estudiante: document.getElementById('telefono').value.trim(),
            ID_Universidad: parseInt(universidadSelect.value)
        };

        const confirmPassword = document.getElementById('confirm-password').value;
        if (formData.password !== confirmPassword) {
            alert('Las contraseñas no coinciden.');
            return;
        }

        // Validación básica
        for (const campo in formData) {
            if (!formData[campo]) {
                alert(`Por favor completa el campo: ${campo}`);
                return;
            }
        }

        console.log('📤 Enviando al backend:', formData);

        try {
            const response = await fetch('http://localhost/bolsa_trabajo/backend/registro_postulante.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            });

            const resultText = await response.text();
            console.log('📥 Respuesta cruda del servidor:', resultText);

            let result;
            try {
                result = JSON.parse(resultText);
            } catch (e) {
                throw new Error('⚠️ El backend no devolvió un JSON válido. Respuesta: ' + resultText);
            }

            if (response.ok) {
                alert('✅ ¡Registro exitoso! Ya puedes iniciar sesión.');
                window.location.href = 'login.html'; // Redirige si quieres
            } else {
                alert('❌ Error al registrar: ' + (result.message || 'Error desconocido'));
            }

        } catch (error) {
            console.error('🚨 Error en la conexión:', error);
            alert('Error de conexión. Inténtalo de nuevo más tarde.');
        }
    });
});

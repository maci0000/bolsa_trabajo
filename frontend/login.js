
document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('login-form');
    const emailInput = document.getElementById('email-login');
    const passwordInput = document.getElementById('password-login');
    const errorMessage = document.createElement('div');
    errorMessage.className = 'error-message';
    loginForm.appendChild(errorMessage);

    loginForm.addEventListener('submit', async (event) => {
        event.preventDefault();
        errorMessage.textContent = ''; // Limpiamos mensajes anteriores

        // Simulación de respuesta del servidor (para pruebas)
        const mockUsers = {
            'admin@example.com': { password: 'admin123', role: 'admin' },
            'user@example.com': { password: 'user123', role: 'postulante' }
        };

        try {
            const mockResponse = {
                ok: true,
                json: async () => {
                    // Verificamos credenciales simuladas
                    const user = mockUsers[emailInput.value];
                    if (user && user.password === passwordInput.value) {
                        return { success: true, role: user.role };
                    }
                    return { success: false, message: 'Credenciales incorrectas' };
                }
            };

            // En lugar de fetch, usamos nuestra simulación
            const response = mockResponse; // Cambiar por fetch real cuando sea necesario
            const result = await response.json();
            console.log("Respuesta simulada:", result);

            if (response.ok && result.success) {
                localStorage.setItem('userRole', result.role);
                
                // Redirección según rol
                if (result.role.trim() === 'admin') {
                    window.location.href = 'admin_dashboard.html';
                } else if (result.role.trim() === 'postulante') {
                    window.location.href = 'postulante-registro.html';
                } else {
                    errorMessage.textContent = 'Rol no reconocido. Serás redirigido.';
                    setTimeout(() => window.location.href = 'index.html', 2000);
                }
            } else {
                errorMessage.textContent = result.message || 'Credenciales incorrectas. Por favor, inténtalo de nuevo.';
                emailInput.focus();
            }

        } catch (error) {
            console.error('Error:', error);
            errorMessage.textContent = 'Error de conexión. Inténtalo de nuevo más tarde.';
        }
    });
});
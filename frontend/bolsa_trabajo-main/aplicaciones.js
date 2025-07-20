// frontend/js/aplicaciones.js
async function enviarAplicacion(formData) {
  try {
    const response = await fetch('../backend/aplicar_puesto.php', {
      method: 'POST', // ← Asegúrate que sea POST
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(formData)
    });
    
    const result = await response.json();
    return result;
    
  } catch (error) {
    console.error('Error:', error);
    return { success: false, error: error.message };
  }
}
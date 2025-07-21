// Función para abrir el modal
function openApplyModal(jobId, jobTitle) {
  document.getElementById('job-id').value = jobId;
  document.getElementById('modal-job-title').textContent = jobTitle;
  document.getElementById('apply-modal').classList.remove('hidden');
}

// Cerrar modal
document.querySelector('.close-modal').addEventListener('click', () => {
  document.getElementById('apply-modal').classList.add('hidden');
});

// Manejar envío del formulario
document.getElementById('application-form').addEventListener('submit', async (e) => {
  e.preventDefault();
  
  const submitBtn = e.target.querySelector('button[type="submit"]');
  submitBtn.disabled = true;
  submitBtn.textContent = 'Enviando...';

  try {
    const formData = {
      job_id: document.getElementById('job-id').value,
      nombre: document.getElementById('applicant-name').value,
      email: document.getElementById('applicant-email').value,
      telefono: document.getElementById('applicant-phone').value,
      universidad: document.getElementById('applicant-university').value,
      cv_url: document.getElementById('applicant-cv').value,
      mensaje: document.getElementById('applicant-message').value || null
    };

    const response = await fetch('../backend/registrar_postulante.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(formData)
    });

    const result = await response.json();

    if (!response.ok) throw new Error(result.error || 'Error en el servidor');

    alert('¡Aplicación enviada con éxito!');
    document.getElementById('apply-modal').classList.add('hidden');
    e.target.reset();

  } catch (error) {
    console.error('Error:', error);
    alert(`Error: ${error.message}`);
  } finally {
    submitBtn.disabled = false;
    submitBtn.textContent = 'Enviar aplicación';
  }
});

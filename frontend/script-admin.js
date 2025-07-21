document.addEventListener("DOMContentLoaded", () => {
  cargarEmpresas();
  cargarPuestos();

  document.getElementById("empresa-form").addEventListener("submit", async e => {
    e.preventDefault();
    const formData = new FormData(e.target);
    await fetch("../backend/guardar_empresa.php", { method: "POST", body: formData });
    e.target.reset();
    cargarEmpresas();
  });

  document.getElementById("puesto-form").addEventListener("submit", async e => {
    e.preventDefault();
    const formData = new FormData(e.target);
    await fetch("../backend/guardar_puesto.php", { method: "POST", body: formData });
    e.target.reset();
    cargarPuestos();
  });
});

async function cargarEmpresas() {
  const res = await fetch("../backend/obtener_empresas.php");
  const empresas = await res.json();
  const tbody = document.querySelector("#empresa-table tbody");
  tbody.innerHTML = "";
  empresas.forEach(emp => {
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td>${emp.ID_Empresa}</td>
      <td>${emp.Nombre_Empresa}</td>
      <td>${emp.Direccion_Empresa}</td>
      <td>${emp.Telefono_Contacto}</td>
      <td>${emp.Email_Contacto}</td>
      <td><button onclick="eliminarEmpresa(${emp.ID_Empresa})">Eliminar</button></td>
    `;
    tbody.appendChild(tr);
  });
}

async function cargarPuestos() {
  const res = await fetch("../backend/obtener_puestos.php");
  const puestos = await res.json();
  const tbody = document.querySelector("#puesto-table tbody");
  tbody.innerHTML = "";
  puestos.forEach(p => {
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td>${p.ID_Puesto}</td>
      <td>${p.Titulo_Puesto}</td>
      <td>${p.Descripción_Puesto}</td>
      <td>${p.Fecha_Publicación}</td>
      <td><button onclick="eliminarPuesto(${p.ID_Puesto})">Eliminar</button></td>
    `;
    tbody.appendChild(tr);
  });
}

async function eliminarEmpresa(id) {
  const formData = new FormData();
  formData.append("id", id);
  await fetch("../backend/eliminar_empresa.php", { method: "POST", body: formData });
  cargarEmpresas();
}

async function eliminarPuesto(id) {
  const formData = new FormData();
  formData.append("id", id);
  await fetch("../backend/eliminar_puesto.php", { method: "POST", body: formData });
  cargarPuestos();
}
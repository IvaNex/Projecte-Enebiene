async function mostrarCreadores() {
    const creadors = await consultar("SELECT c.id, c.nombre, c.pais, c.imagen, COUNT(v.id) AS total_juegos FROM creadores c LEFT JOIN videojuegos v ON v.id_creador = c.id GROUP BY c.id ORDER BY c.nombre ASC");
    //console.log(creadores); 
    const container = document.querySelector("#lista-creadors");

    if(!creadors) {
        alert("Error en Carregar els Creadors");
        return;
    }

    creadors.forEach(creador => {
        const contenedorCreador = document.createElement("div");
        contenedorCreador.classList.add("contenedorCreador");

        contenedorCreador.innerHTML = `
            <img src="img/${creador.imagen}" alt="Logo de ${creador.nombre}" class="img-creador">
            <div class="info">
                <h2>${creador.nombre}</h2>
                <p><strong>País:</strong> ${creador.pais}</p>
                <p><strong>Juegos creados:</strong> ${creador.total_juegos}</p>
            </div>
        `;

        const imagenCreador = document.querySelector(".img-creador");
        imagenCreador.addEventListener("click", creadorIndividual);

        function creadorIndividual() {
            window.location.href = `productes.html?id=${creador.id}`;
        }

        container.appendChild(contenedorCreador);
    });
}

mostrarCreadores();


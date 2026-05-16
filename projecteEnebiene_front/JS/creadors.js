async function mostrarCreadores(orden = "nom ASC") {

    let sql = "SELECT c.id, c.nombre, c.pais, c.imagen, COUNT(v.id) AS total_juegos FROM creadores c LEFT JOIN videojuegos v ON v.id_creador = c.id GROUP BY c.id"

    switch (orden) {

        case "total_jocs ASC":
            sql += " ORDER BY TOTAL_juegos ASC";
            break;
        case "total_jocs DESC":
            sql += " ORDER BY total_juegos DESC";
            break;
        case "nom DESC":
            sql += " ORDER BY c.nombre DESC";
            break;
        default:
            sql += " ORDER BY c.nombre ASC";

    }
    const creadors = await consultar(sql);
    //console.log(creadores); 
    const container = document.querySelector("#lista-creadors");

    if(!creadors) {
        alert("Error en Carregar els Creadors");
        return;
    }
    container.innerHTML = "";

    creadors.forEach(creador => {
        const contenedorCreador = document.createElement("div");
        contenedorCreador.classList.add("contenedorCreador");

        contenedorCreador.innerHTML = `
            <a>
            <img src="imagenes/imagen-creadores.png" alt="Logo de ${creador.nombre}" class="img-creador" onclick="mostrarCreador(${creador.id})">
            </a>
            <div class="info">
                <h2 class="nombre-creador" >${creador.nombre}</h2>
                <p><strong>País:</strong> ${creador.pais}</p>
                <p><strong>Juegos creados:</strong> ${creador.total_juegos}</p>
            </div>
        `;

        container.appendChild(contenedorCreador);
    });
}
function mostrarCreador(id) {
    localStorage.setItem("creador", id);
    location.href = "productes.html";
}
mostrarCreadores();


const selector = document.querySelector("#ordenar-creadors");

if (selector) {
    selector.addEventListener("change", (e) => {
        const valorElegido = e.target.value;
        //console.log("Cambiando orden a: " + valorElegido);
        mostrarCreadores(valorElegido);
    });
}



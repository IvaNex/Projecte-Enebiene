async function mostrarCreadores(orden = "nom ASC") {

    let sql = "SELECT v.id, v.titulo, v.descripcion, v.precio, v.puntuacion, v.fecha_lanzamiento, v.pegi, v.es_multijugador, v.id_genero, v.id_creador From videojuegos"

    switch (orden) {

        case "nota ASC":
            sql += " ORDER BY ASC";
            break;
        case "nota DESC":
            sql += " ORDER BY DESC";
            break;
        case "preu ASC":
            sql += " ORDER BY ASC";
        case "preu DESC":
            sql += " ORDER BY DESC";
            break;
        case "nom DESC":
            sql += " ORDER BY DESC";
        default:
            sql += " ORDER BY ASC";

    }
    const productes = await consultar(sql);
    //console.log(creadores);
    const container = document.querySelector("#contenedor-juegos");

    if(!productes) {
        alert("Error en Carregar els Creadors");
        return;
    }
    container.innerHTML = "";

    productes.forEach(productes => {
        const contenedorProductes = document.createElement("div");
        contenedorProductes.classList.add("contenedorProductes");

        contenedorProductes.innerHTML = `
            
            <img src="imagenes/imagen-creadores.png" alt="Logo de ${creador.nombre}" class="img-creador">
            
            <div class="info">
                <h2>${videojuegos.titulo}</h2>
                <p><strong>País:</strong> ${creador.pais}</p>
                <p><strong>Juegos creados:</strong> ${creador.total_juegos}</p>
            </div>
        `;

        container.appendChild(contenedorCreador);
    });
}
mostrarCreadores();


const selector = document.querySelector("#ordenar-videojuegos");

if (selector) {
    selector.addEventListener("change", (e) => {
        const valorElegido = e.target.value;
        //console.log("Cambiando orden a: " + valorElegido);
        mostrarCreadores(valorElegido);
    });
}
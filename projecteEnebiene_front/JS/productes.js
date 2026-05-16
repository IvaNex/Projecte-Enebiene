async function mostrarProductes(orden = "nom ASC") {

    let sql = "SELECT v.id, v.titulo, v.descripcion, v.precio, v.puntuacion, v.fecha_lanzamiento, v.pegi, v.es_multijugador, v.id_genero, v.id_creador From videojuegos v LEFT JOIN creadores c ON v.id_creador = c.id GROUP BY v.id"

    switch (orden) {

        case "nota ASC":
            sql += " ORDER BY v.puntuacion ASC";
            break;
        case "nota DESC":
            sql += " ORDER BY v.puntuacion DESC";
            break;
        case "preu ASC":
            sql += " ORDER BY v.precio ASC";
            break;
        case "preu DESC":
            sql += " ORDER BY v.precio DESC";
            break;
        case "nom DESC":
            sql += " ORDER BY v.titulo DESC";
            break;
        default:
            sql += " ORDER BY v.titulo ASC";

    }
    const productes = await consultar(sql);
    //console.log(productes);
    const container = document.querySelector("#contenedor-juegos");

    if(!productes) {
        alert("Error en Carregar els Creadors");
        return;
    }
    container.innerHTML = "";

    productes.forEach(juego => {
        const contenedorProducte = document.createElement("div");
        contenedorProducte.classList.add("contenedorProducte");

        contenedorProducte.innerHTML = `
            
            <img src="imagenes/portada-juego.png" alt="Logo de ${juego.titulo}" class="img-juego">
            
            <div class="info">
                <h2>${juego.titulo}</h2>
                <p><strong>Preu</strong> ${juego.precio}</p>
                <p><strong>Puntuacio del joc:</strong> ${juego.puntuacion}</p>
            </div>
        `;

        container.appendChild(contenedorProducte);
    });
}
mostrarProductes();


const selector = document.querySelector("#ordenar-videojuegos");

if (selector) {
    selector.addEventListener("change", (e) => {
        const valorElegido = e.target.value;
        console.log("Cambiando orden a: " + valorElegido);
        mostrarProductes(valorElegido);
    });
}


const btnVista = document.getElementById('btn-vista');
const listProductos = document.getElementById('contenedor-juegos');
 if (btnVista && listProductos) {
    btnVista.addEventListener('click', () => {
        listProductos.classList.toggle('llistaProductes');

        if (listProductos.classList.contains('llistaProductes')){
            btnVista.textContent = 'Canviar a Cuadricula'
        } else {
            btnVista.textContent = 'Canviar a Llista'
        }
    })
 }
async function mostrarProductes(orden = "nom ASC") {

    const idCreador=localStorage.getItem('creador');
    localStorage.removeItem('creador');


    let sql = "SELECT v.id, v.titulo, v.descripcion, v.precio, v.puntuacion, v.fecha_lanzamiento, v.pegi, v.es_multijugador, v.id_genero, v.id_creador From videojuegos v LEFT JOIN creadores c ON v.id_creador = c.id"

    if (idCreador){
        sql += ` WHERE id_creador = ${idCreador}`;
    }

    sql += " GROUP BY v.id";
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
    console.log("¡ATENCIÓN! La query final que voy a enviar es:");
    console.log(sql);
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
                <p class="preu"><strong>Preu</strong> ${juego.precio}</p>
                <p class="puntuacio"><strong>Puntuacio del joc:</strong> ${juego.puntuacion}</p>
                <p class="descripcio"><strong>Descripcio:</strong> ${juego.descripcion}</p>
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


const btnVista = document.querySelector('#btn-vista');
const listProductos = document.querySelector('#contenedor-juegos');
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



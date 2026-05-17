// 1. Variable global para recordar el género seleccionado
let generoSeleccionado = "todos";

async function mostrarCreadores(orden = "nom ASC") {

    // Consulta base modificada para poder inyectar un WHERE si hace falta
    let sql = "SELECT c.id, c.nombre, c.pais, c.imagen, COUNT(v.id) AS total_juegos FROM creadores c LEFT JOIN videojuegos v ON v.id_creador = c.id";

    // 2. FILTRADO: Si hay un género seleccionado, añadimos el WHERE antes del GROUP BY
    if (generoSeleccionado !== "todos") {
        sql += ` WHERE v.id_genero = ${generoSeleccionado}`;
    }

    // Cerramos la agrupación obligatoria
    sql += " GROUP BY c.id";

    // TU SWITCH ORIGINAL (Corregido 'TOTAL_juegos' a minúsculas para evitar fallos de Docker)
    switch (orden) {
        case "total_jocs ASC":
            sql += " ORDER BY total_juegos ASC";
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
            <a href="productes.html?creador=${creador.id}">
            <img src="imagenes/imagen-creadores.png" alt="Logo de ${creador.nombre}" class="img-creador">
        </a>
            <div class="info">
                <h2 class="nombre-creador" >${creador.nombre}</h2>
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
function mostrarCreador(id) {
    localStorage.setItem("creador", id);
    location.href = "productes.html";
}
mostrarCreadores();


const selector = document.querySelector("#ordenar-creadors");
if (selector) {
    selector.addEventListener("change", (e) => {
        const valorElegido = e.target.value;
        mostrarCreadores(valorElegido);
    });
}

// 3. NUEVO: Escuchar el cambio en el selector de filtrar por género
const filtroGenere = document.querySelector("#filtre-genere");
if (filtroGenere) {
    filtroGenere.addEventListener("change", (e) => {
        generoSeleccionado = e.target.value; 
        
        let ordenActual = "nom ASC";
        
        const desplegableOrdenar = document.querySelector("#ordenar-creadors");
        
        if (desplegableOrdenar) {
            ordenActual = desplegableOrdenar.value;
        }
        
        mostrarCreadores(ordenActual);
    });
}
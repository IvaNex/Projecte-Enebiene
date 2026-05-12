async function mostrarCreadores() {
    // Ejemplo para obtener los videojuegos
    const creadores = await consultar("SELECT c.id, c.nombre, c.pais, c.imagen, COUNT(v.id) AS total_juegos FROM creadores c LEFT JOIN videojuegos v ON v.id_creador = c.id GROUP BY c.id ORDER BY c.nombre ASC");
    console.log(creadores); // Aquí verás la lista en la consola del navegador
}

mostrarCreadores();
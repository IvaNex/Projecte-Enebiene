async function consultar(sql) {
    const url = "http://localhost:3000/daw/" + encodeURIComponent(sql);

    try {
        const resp = await fetch(url);
        const json = await resp.json();
        return json.data;
    } catch (error) {
        console.error("Error en la consulta:", error);
        return null;
    }
}
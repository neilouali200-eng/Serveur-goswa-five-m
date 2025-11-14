window.addEventListener('message', function(event){
    const data = event.data;
    if(data.action === "openTablet") {
        document.getElementById('tablet').style.display = 'block';
    }
    if(data.action === "updateTable") {
        const tbody = document.querySelector("#employeeTable tbody");
        tbody.innerHTML = "";
        for(const id in data.employees) {
            const emp = data.employees[id];
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${id}</td>
                <td>${emp.nom || "Employé"}</td>
                <td>${emp.heures_totales.toFixed(2)}</td>
                <td>${emp.enService ? "Oui" : "Non"}</td>
                <td><input type="number" id="hours_${id}" placeholder="heures"><button onclick="addHours('${id}')">Ajouter</button></td>
            `;
            tbody.appendChild(row);
        }
    }
});

document.getElementById('close').addEventListener('click', function(){
    fetch(`https://${GetParentResourceName()}/close`, { method: 'POST' });
    document.getElementById('tablet').style.display = 'none';
});

function addHours(id){
    const value = document.getElementById(`hours_${id}`).value;
    fetch(`https://${GetParentResourceName()}/addHours`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ employeeId: id, hours: value })
    });
}

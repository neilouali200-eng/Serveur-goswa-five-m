window.addEventListener("message", function(e){

    if(e.data.type === "openCatalogue"){
        document.getElementById("catalogue").style.display = "block";
        document.getElementById("vendeur").style.display = "none";

        let html = "";
        e.data.vehicles.forEach(v => {
            html += `<div class="item"><b>${v.label}</b> - ${v.price}$</div>`;
        });

        document.getElementById("catalogueList").innerHTML = html;
    }

    if(e.data.type === "openVendeur"){
        document.getElementById("vendeur").style.display = "block";
        document.getElementById("catalogue").style.display = "none";

        let options = "";
        e.data.vehicles.forEach(v => {
            options += `<option value="${v.model}" data-price="${v.price}">${v.label} - ${v.price}$</option>`;
        });

        document.getElementById("vehicleSelect").innerHTML = options;
    }
});

function startSale(){
    let s = document.getElementById("vehicleSelect");
    let model = s.value;
    let price = s.options[s.selectedIndex].dataset.price;

    fetch(`https://${GetParentResourceName()}/startSale`, {
        method: "POST",
        body: JSON.stringify({model: model, price: price})
    });
}

function closeUI(){
    fetch(`https://${GetParentResourceName()}/close`, {
        method: "POST"
    });
}

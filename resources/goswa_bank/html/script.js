function deposit() {
    let amount = parseInt(document.getElementById('amount').value);
    if(amount > 0){
        fetch(`https://${GetParentResourceName()}/deposit`, {
            method: 'POST',
            body: JSON.stringify({ amount })
        });
    }
}

function withdraw() {
    let amount = parseInt(document.getElementById('amount').value);
    if(amount > 0){
        fetch(`https://${GetParentResourceName()}/withdraw`, {
            method: 'POST',
            body: JSON.stringify({ amount })
        });
    }
}

function closeBank() {
    document.getElementById('bankUI').style.display = 'none';
    fetch(`https://${GetParentResourceName()}/closeBank`, { method: 'POST' });
}

window.addEventListener('message', function(event){
    if(event.data.money !== undefined){
        document.getElementById('money').innerText = event.data.money;
    }
});

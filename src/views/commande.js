let HttpClient = function() {
    this.get = function(aUrl, aCallback) {
        var anHttpRequest = new XMLHttpRequest();
        anHttpRequest.onreadystatechange = function() {
            if (anHttpRequest.readyState == 4 && anHttpRequest.status == 200)
                aCallback(anHttpRequest.responseText);
        };
        anHttpRequest.open( "GET", aUrl, true );
        anHttpRequest.send( null );
    }
};


function cmdeDetails(id, url){
    let newUrl = url + id;
    window.location.href =  newUrl;
}

function prodDetails(id, url){
    console.log(id);
}

// function listeville(){
//     let theurl= 'http://localhost:3000/ville/';
//     let ville = new HttpClient();
//     ville.get(theurl, function(response){
//         let data = JSON.parse(response);
//         data.forEach (function(element){
//             let option = document.createElement("option");
//             let value = element.id_ville
//             option.setAttribute("value", value);
//             option.innerHTML = element.nom;
//             document.getElementById("listville").appendChild(option);
//             console.log(document.getElementById("listville").appendChild(option));
//         })
//     });
// }
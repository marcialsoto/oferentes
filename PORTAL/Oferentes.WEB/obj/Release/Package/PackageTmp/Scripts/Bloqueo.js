
function numeros(e) {
    var unicode = e.charCode ? e.charCode : e.keyCode
    if (unicode != 8 && unicode != 44) {
        if (unicode < 48 || unicode > 57) //if not a number
        { return false } //disable key press    
    }
}


function texto(e) {
    var unicode = e.charCode ? e.charCode : e.keyCode
    if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122) && (event.keyCode != 209) && (event.keyCode != 241) && (event.keyCode != 225) && (event.keyCode != 233) && (event.keyCode != 237) && (event.keyCode != 243) && (event.keyCode != 250))
        event.returnValue = false;   
    
}
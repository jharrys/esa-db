/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function httpGet(theUrl){
    var xmlHttp = null;

    xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false );
    xmlHttp.send( null );
    return xmlHttp.responseText;
}

function buildLegend(legend){
    var legendString = "";
    for( var i in legend ){
        legendString += "<div class=\"legendColor\" style=\"background-color:"+legend[i].rgbaColor+";\"></div>";
        legendString += "<div class=\"legendElement\"> - "+legend[i].architectName+"</div><p></p>";
    }
    return( legendString );
}

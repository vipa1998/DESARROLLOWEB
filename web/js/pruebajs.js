  /* global url, str */

var xmlHttp;

$(document).ready(function (){
    showState(str);
    showCity(str);
});

            function showState(str) {
                if (XMLHttpRequest !== "undefined") {
                    xmlHttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp === null){
                alert("Browser does not support XMLHTTP Request");
                }
               // var url "pruebasubcategoria.jsp";
                url += "?count" + str;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", null, true);
                xmlHttp.send(null);
            }

            function stateChange() {
                if (xmlHttp.readyState === 4 || xmlHttp.readyState === "complete") {
                    document.getElementById("state").innerHTML = xmlHttp.responseText;
                }
            }

            function showCity(str) {
                if (typeof XMLHttpRequest !== "undefined") {
                    xmlHttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp === null){
                alert("Browser does not support XMLHTTP Request");
                }
              //  var url "pruebamarca.jsp";
                url += "?count" + str;
                xmlHttp.onreadystatechange = stateChange1;
                xmlHttp.open("GET", null, true);
                xmlHttp.send(null);
            }

            function stateChange1() {
                if (xmlHttp.readyState === 4 || xmlHttp.readyState === "complete") {
                    document.getElementById("city").innerHTML = xmlHttp.responseText;
                }
            }


$( document ).ready(function() {

  function getUpdates() {
    var xmlhttp = new XMLHttpRequest()
    var url = 'http://jordankamin.com/robots_api/robots.json'
    alert("Getting updates")

    xmlhttp.onreadystatechange = function() {
      if (xmlhttp.readyState == XMLHttpRequest.DONE) {
          alert(xmlhttp.responseText);
      }
    }

    xmlhttp.open("GET", url, true);
    xmlhttp.send();
  };

  setInterval(getUpdates, 10000)

});




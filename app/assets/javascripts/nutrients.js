// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){

  var button = $("button");

  button.on("click", getNutrients);

  function getNutrients(){

    var url = "http://api.nal.usda.gov/ndb/list?format=json&lt=n&offset=0&sort=n&api_key=rW2xruSnlvei2Gb9N8C0wDunX49aTnZsrKkSFRbl";

    request(url, "get").done(function(response){
      var data = {nutrients: response.list.item};
      var url = "/nutrients";
      var method = "post";
      request(url, method, data).done(function(){
        console.log("db updated");
      })
    })
  }

  function request(url, method, data){
    return $.ajax({
      url: url,
      method: method,
      dataType: "json",
      data: data
    })
  }

})

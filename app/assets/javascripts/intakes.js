// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){

  var button = $(".search-dish");

  button.on("click", getNewDish);

  function getNewDish(e){
    console.log("i'm clicked");

    e.preventDefault();

    var url = "/dishes/new";
    var data = {
      name: $("#q").val()
    };

    request(url, "get", data).done(function(response){
      console.log("I've got a response");
      debugger;
      $.each(response.hits, function(index, dish){
        debugger;
        appendDish(dish);
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

  function appendDish(dish){
    $("<li>"+dish.recipe.label+"</li>").appendTo(".results")
    debugger;
  }

})
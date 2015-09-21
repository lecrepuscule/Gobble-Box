// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){

  var button = $(".search-dish");

  button.on("click", getNewDish);

  // $("body").on("click", $(".dish-result"), createNewDish);

  function getNewDish(e){
    console.log("i'm clicked");

    e.preventDefault();

    var url = "/dishes/new";
    var data = {
      name: $("#q").val()
    };

    request(url, "get", data).done(function(response){
      console.log("I've got a response");
      $(".results").empty();
      $.each(response[0].hits, function(index, dish){
        appendDish(dish, response[1]);
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

  function appendDish(dish, user_id){
    newDishTemplate = "<li class='dish-result'><a href='/users/"+ user_id +"/intakes/new'>"+dish.recipe.label+"</a></li>"
    newDish = $(newDishTemplate);
    newDish.data("dish", dish);
    newDish.appendTo(".results");
  }

  // function createNewDish(e){
  //   e.preventDefault;
  //   var url = "/intakes/new"
  //   var method = "get"
  //   var data = this.data("dish")
  //   request(url, method, data).done(function(response){
  //     console.log("new dish is created");
  //   })
  // }

})
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){

  var button = $(".search-dish");

  button.on("click", getNewDish);

  // $(".results").on("click", $(".dish-result"), createNewDish);

  function getNewDish(e){
    console.log("i'm clicked");

    e.preventDefault();

    var url = "/dishes";
    var data = {
      name: $("#q").val()
    };

    request(url, "post", data).done(function(response){
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
    newDishTemplate = "<li class='dish-result'><a href='/users/" + user_id + "/intakes/new'>"+dish.recipe.label+"</a></li>"
    newDish = $(newDishTemplate);
    newDish.data("dish", dish.recipe.label);
    newDish.data("user_id", user_id);
    newDish.appendTo(".results");
  }

  // function createNewDish(e){
  //   e.preventDefault;
  //   console.log("link is clicked");
  //   var method = "get";
  //   var $this = $(e.target.parentElement);
  //   var data = {
  //     dishName: $this.data("dish")
  //   };
  //   var url = "/users/" + $this.data("user_id") + "/intakes/new";
  //   request(url, method, data)
  // }

})
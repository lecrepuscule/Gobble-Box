// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){

  $(".results").on("click", $(".dish-result"), newIntake);


  $("#search-form").on("ajax:success", function(e, response){
      $(".results").empty();
      $.each(response[0], function(index, dish){
        appendDish(dish, response[1]);
      })
  })

  function request(url, method, data){
    return $.ajax({
      url: url,
      method: method,
      dataType: "json",
      data: data
    })
  }

  function appendDish(dish, user_id){

    newDishTemplate = "<li class='dish-result'><a href='#'>"+dish.name+"</a></li>"
    newDish = $(newDishTemplate);
    newDish.data("dish_id", dish.id);
    newDish.data("user_id", user_id);
    newDish.appendTo(".results");
  }

  function newIntake(e){
    e.preventDefault;
    console.log("link is clicked");

    var $this = $(e.target.parentElement);

    $("#intake-primary").removeClass("show").addClass("hide");
    $("#intake-secondary").removeClass("hide").addClass("show");

    $("#intake_dish_id").val($this.data("dish_id"));
  }
})
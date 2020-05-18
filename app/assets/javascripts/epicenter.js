// #Turbolinks:load is just rails way of saying to call this function when the page is loaded 
$(document).on("turbolinks:load", function(){

    $('#unfollow_btn').hover(function(){
    //One function when it is hovering one when it isnt
    // this is refering to the button
        $(this).html("Unfollow");
        $(this).removeClass('btn-primary');
        $(this).addClass('btn-danger');
    }, function(){
        $(this).html('Following');
        $(this).removeClass('btn-danger')
        $(this).addClass('btn-primary');
    })
})
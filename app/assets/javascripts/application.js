
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .

// $('.arrow-up').bind('ajax:success', function () {
//     var saveThis = $(this).closest('item').prev();
//     $(this).closest('item').prev().replaceWith(this);
//     $(this.closest('item').replaceWith(saveThis);
// })

var blocmetrics = {};
    blocmetrics.report = function(eventName){
       var event = {event: { name: eventName }};
       var request = new XMLHttpRequest();
       request.open("POST", "https://blocmetrics-lewvine.c9users.io/api/events", true);
       request.setRequestHeader('Content-Type', 'application/json');
       request.send(JSON.stringify(event));    
    };

$(document).ready(function() {

    // $('body').on('click', '.fa.fa-angle-up', function () {
    //     var thisItem = $(this).closest('.item').find('.item-info').html();
    //     var previousItem = $(this).closest('.item').prev().find('.item-info').html();

    //     if(previousItem) {
    //         $(this).closest('.item').find('.item-info').html(previousItem);            
    //         $(this).closest('.item').prev().find('.item-info').html(thisItem);
    //     };
    //     var thisItemID = $(this).closest('.item').find(".number").data("item-id");  
    //     var nextItemID = $(this).closest('.item').prev().find(".number").data("item-id");  
        
    // });

    $('body').on('click', '.fa.fa-angle-down', function () {
    
        var thisItem = $(this).closest('.item').find('.item-info').html();
        var nextItem = $(this).closest('.item').next().find('.item-info').html();
        if(nextItem) {
            $(this).closest('.item').find('.item-info').html(nextItem); 
            $(this).closest('.item').next().find('.item-info').html(thisItem);
        };

        var current_user = $(this).closest('.item').find(".number").data("current-user");   
        
        var thisItemID = $(this).closest('.item').find(".number").data("item-id");
        var thisItemRailsID = $(this).closest('.item').find(".name").data("rails-id");

        var nextItemID = $(this).closest('.item').next().find(".number").data("item-id");  
        var nextItemRailsID = $(this).closest('.item').next().find(".name").data("rails-id");  
    
        console.log(thisItemRailsID)

        $.ajax({
            type: "PUT",
            url: 'users/' + current_user + '/items/' + thisItemRailsID,
            dataType: "json",
            data: { 
                "item": {
                    "order": thisItemID
                }
            },
        });

        $.ajax({
            type: "PUT",
            url: 'users/' + current_user + '/items/' + nextItemRailsID,
            dataType: "json",
            data: { 
                "item": {
                    "order": nextItemID
                }
            },
        });

        console.log(nextItemRailsID);
    });
            
});   



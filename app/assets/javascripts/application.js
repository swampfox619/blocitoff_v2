
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

$(document).ready(function() {

    $('body').on('click', '.fa.fa-angle-up', function () {
        var formerPrevious = $(this).closest('.item').prev().html();
        var formerNext = $(this).closest('.item').html();
        debugger;
        $(this).closest('.item').prev().html(formerNext);
        $(this).closest('.item').html(formerPrevious);
    });
    
    $('body').on('click', '.fa.fa-angle-down', function () {
        $.ajax({
            url: "/items/" + id,
            method: "PUT",
            success: function() {
                var formerNext = $(this).closest('.item').next().html();
                var formerPrevious = $(this).closest('.item').html();
                $(this).closest('.item').next().html(formerPrevious);
                $(this).closest('.item').html(formerNext);
            }
        })
    });

});
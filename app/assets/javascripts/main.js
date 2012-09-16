/*
 * Copyright (c) Ben Constable
 * http://www.benconstable.co.uk
 *
 * Core scripts.
 */
(function ($) {

    var und = $('<div />'),
        navs = $('.header .nav li'),
        bodyClass = $('body').attr('class'),
        curNav = navs.filter('.' + bodyClass),
        position = curNav.position();
    
    // Setup underline visuals
    und
        .addClass("nav-underline")
        .width(curNav.width())
        .css('left', position.left + 500);
        
    // Move underline on mouse over
    navs.children('a').bind('mouseover', function () {
        navs.data('hover', true);

        var width = $(this).parent().width(),
            offset = $(this).parent().position().left;
        
        und.animate({
            left: 500 + offset,
            width: width
        }, 300);
    });
    
    // move underline on mouse out
    navs.children('a').bind('mouseout', function () {
        navs.data('hover', false);
        
        setTimeout(function () {  
            // If we've moved to a new nav element
            if (!navs.data('hover')) {
                var width = curNav.width(),
                    offset = curNav.position().left;
                
                und.animate({
                    left: 500 + offset,
                    width: width
                }, 200);
            }
        }, 500);
    });
      
    $('.header').append(und);
    
}(jQuery));
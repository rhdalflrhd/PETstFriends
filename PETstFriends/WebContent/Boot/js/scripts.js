/* ---------------------------------------------
 common scripts
 --------------------------------------------- */
;(function ($) {
    'use strict'; // use strict to start

    /* === Stickit === */

    (function () {
        $("[data-sticky_column]").stickit({
            scope: StickScope.Parent,
            top: 0
        });
    }());


    /*=== home slider carousel =====*/
    (function () {
        $('.home-carousel').owlCarousel({
            singleItem: true,
            navigation: true,
            navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
            autoPlay: true,
            pagination: true,
            transitionStyle: "fade"
        });
    }());
    /*=== single blog carousel =====*/
    (function () {
        $('.items').owlCarousel({
            items: 3,
            navigation: true,
            navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
            autoPlay: true,
            pagination: false
        });
    }());

    /* === Instagram Widget === */

    (function () {
        $('#widget-instagram').owlCarousel({
            singleItem: true,
            navigation: true,
            navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
            autoPlay: true,
            pagination: false
        });
    }());

    /* === Footer Instagram === */

    (function () {
        $('#footer-instagram').owlCarousel({
            items: 8,
            navigation: false,
            autoPlay: false,
            pagination: false
        });
    }());


    /* === Back To Top === */

    (function () {
        $(' a.back-to-top').click(function () {
            $('html, body').animate({scrollTop: 0}, 800);
            return false;
        });
    }());


    /* === Fitvids js === */

    (function () {
        $(".entry-content").fitVids();
        $(".entry-video").fitVids();
        $(".entry-audio").fitVids();
    }());

    /*== Isotope js ==*/
    var $container = $('.portfolio');

    $container.imagesLoaded(function () {

        $container.isotope({
            filter: '*',
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }

        });
    });

    $('.portfolio-name a').click(function () {

        $(".portfolio-name a").removeClass("active");
        $(this).addClass("active");

        var selector = $(this).attr('data-filter');
        $(".portfolio").isotope({
            filter: selector,
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });
        return false;
    });

    $('.slider-section').imagesLoaded(function () {
        $( ".slider-section" ).css( "display", "block" );
        $( ".promo-box" ).css( "display", "block" );
        /* === Post Slider === */
        (function () {
            $('#post-slider').owlCarousel({
                singleItem: true,
                navigation: true,
                navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                autoPlay: true,
                pagination: false
            });
        }());


    });
    $(document).ready(function(){
        $('#menu').slicknav({
            prependTo:'#demo2'
        });

    });
    /* === Pre-loader === */

    $(window).load(function() {
        $('.preloader').fadeOut();
        $('.spinner').delay(350).fadeOut('slow');
    });

})(jQuery);



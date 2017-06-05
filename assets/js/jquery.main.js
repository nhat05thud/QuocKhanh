(function ($) {
    $(window).load(function () {
    });
    $(window).resize(function () {
    });
    $(function () {
        mymap();
        myfunload();
        
    });
})(jQuery);
$(document).ready(function () {
    setTimeout(function () {
        EqualSizer('.construction-cate .item,.news-cate .item');
    }, 500);
});
function addClassGrid() {
    $('.proService .grid .grid-item').first().addClass('grid-item-width2 grid-item-height2');
    $('.proService .grid .grid-item').last().addClass('grid-item-width2');
    $('.proService .grid .grid-item').last().prev().addClass('grid-item-width2');
}
//function===============================================================================================
/*=============================fun=========================================*/
function myfunload() {
    $(".panel-a").mobilepanel();
    $("#menu > li").not(".home").clone().appendTo($("#menuMobiles"));
    $("#menuMobiles input").remove();
    $("#menuMobiles > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    $("#menuMobiles li li a").append('<span class="fa fa-angle-right iconl"></span>');
    $("#menu > li:last-child").addClass("last");
    $("#menu > li:first-child").addClass("fisrt");

    $("#menu > li").find("ul").addClass("menu-level");

    $('#menu li').hover(function () {
        $(this).children('ul').stop(true, false, true).slideToggle(300);
    });
    $(document).on('click', '.cateContruc .item .content .button', function () {
        $(this).next('.content-hidden').stop(true, false, true).slideToggle(300);
    });
    /*=====  set data-img = background  =====*/
    addClassGrid();
    /*======= isotope =======*/
    setTimeout(function () {
        $('.grid').isotope({
            itemSelector: '.grid-item',
            masonry: {
                columnWidth: 270,
                gutter: 10
            }
        });
    }, 500);

    /*=========== owlCarousel ===========*/
    $('.cateContruc').owlCarousel({
        margin: 25,
        loop: true,
        nav: true,
        autoplay: false,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1
            },
            481: {
                items: 2
            },
            600: {
                items: 2
            },
            992: {
                items: 3
            }
        }
    });
    $('.slidePartner').owlCarousel({
        margin: 0,
        loop: true,
        nav: true,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 2
            },
            480: {
                items: 3
            },
            600: {
                items: 3
            },
            1000: {
                items: 7
            }
        }
    });

    /* slick */
    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        vertical:true,
        asNavFor: '.slider-for',
        focusOnSelect: true,
        responsive: [
           {
               breakpoint: 1199,
               settings: {
                   slidesToShow: 4,
                   slidesToScroll: 1,
               }
           },
           {
               breakpoint: 992,
               settings: {
                   slidesToShow: 5,
                   vertical: false,
               }
           }
        ]
    });

}

/*=========================================================================*/
//================== scroll top
$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.scroll-to-top').fadeIn();
    } else {
        $('.scroll-to-top').fadeOut();
    }
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 138) {
        $('.bot-head').addClass('bot-head-scroll');
    }
    else {
        $('.bot-head').removeClass('bot-head-scroll');
    }
});

$('.scroll-to-top').on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({ scrollTop: 0 }, 800);
    return false;
});

function sp_quantity() {
    $(".sp-btn").on("click", function () {
        var $button = $(this),
            $input = $button.closest('.sp-quantity').find("input.quntity-input");
        var oldValue = $input.val(),
            newVal;
        console.log(oldValue);

        if ($(this).attr('data-id') == 'sp-plus' ) {
            newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $input.val(newVal);
    });
}

function DoEqualSizer(myclass) {
    var heights = $(myclass).map(function() {
        $(this).height('auto');
        return $(this).height();
    }).get(),
    maxHeight = Math.max.apply(null, heights);
    $(myclass).height(maxHeight);
};
function EqualSizer_1(myclass) {
    $(document).ready(DoEqualSizer(myclass));
    window.addEventListener('resize', function () {
        DoEqualSizer(myclass);
    });
};
function EqualSizer(myclass) {
    $(document).ready(DoEqualSizer(myclass));
    window.addEventListener('resize', function() { 
        DoEqualSizer(myclass); 
    });
};
//==================
function mymap() {
    mympp();
    var timeout;
    $(window).resize(function () {
        clearTimeout(timeout);
        setTimeout(function () {
            mympp();
        }, 500);
    });
}
function mympp() {
    $('#mapwrap').remove();
    if ($(window).width() > 768) {
        $('#mapshow').append('<div id="mapwrap"><iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
    }
}


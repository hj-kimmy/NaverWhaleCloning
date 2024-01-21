const container = document.getElementById("myCarousel");
const options = {
    infinite: false,
    Navigation: false,
    Dots: {
        minCount: 2,
    }
};

new Carousel(container, options);


// init Isotope
var $grid = $('.grid').isotope({
    itemSelector: '.element-item',
    layoutMode: 'fitRows',
    getSortData: {
        name: '.name',
        symbol: '.symbol',
        number: '.number parseInt',
        category: '[data-category]',
        weight: function (itemElem) {
            var weight = $(itemElem).find('.weight').text();
            return parseFloat(weight.replace(/[\(\)]/g, ''));
        }
    },
    transitionDuration: 0
});

// filter functions
var filterFns = {
    // show if number is greater than 50
    numberGreaterThan50: function () {
        var number = $(this).find('.number').text();
        return parseInt(number, 10) > 50;
    },
    // show if name ends with -ium
    ium: function () {
        var name = $(this).find('.name').text();
        return name.match(/ium$/);
    },
    search: function () {
        var name = $(this).find('.name').text();
        var searchWord = searchTab.val();
        const searchRegEx = new RegExp(searchWord, 'i');
        return name.match(searchRegEx);
    }
};

// bind sort button click
$('#sorts').on('click', 'button', function () {
    var sortByValue = $(this).attr('data-sort-by');
    let asc = true;
    if (sortByValue == "number") {
        asc = false;
    }
    $grid.isotope({
        sortBy: sortByValue,
        sortAscending: asc
    });
});


// bind filter button click
$('#filters').on('click', 'button', function () {
    var filterValue = $(this).attr('data-filter');
    // use filterFn if matches value
    filterValue = filterFns[filterValue] || filterValue;
    $grid.isotope({filter: filterValue});
});

let searchTab = $("input[type=text]");
searchTab.on('keyup', function (key) {
    if (key.keyCode == 13) {
        let filterValue = 'search';
        filterValue = filterFns[filterValue];
        $grid.isotope({
            filter: filterValue,
            transitionDuration: 0
        });
    }
})

// change is-checked class on buttons
$('.button-group').each(function (i, buttonGroup) {
    var $buttonGroup = $(buttonGroup);
    $buttonGroup.on('click', 'button', function () {
        $buttonGroup.find('.is-checked').removeClass('is-checked');
        $(this).addClass('is-checked');
    });
});

$(function () {
    let searchTab = $("input[type=text]");
    let searchXbtn = $(".searchitems span");

    searchTab.keyup(function (key) {
        let searchKeyword = searchTab.val();

        if (searchKeyword == "") {
            searchXbtn.hide();
        } else {
            searchXbtn.show();
        }

        if (key.keyCode == 13) {
            searchBtn.removeClass("is-checked");
            searchBtn.eq(0).addClass('is-checked');
            searchXbtn.hide();
            if (searchKeyword == "") {
                searchXbtn.hide();
            } else {
                searchXbtn.show();
            }
        }
    })

    let searchBtn = $(".button-group .button")
    searchXbtn.click(function () {
        searchTab.val("");
        searchBtn.eq(0).trigger("click");
        searchXbtn.hide();
    })
    let openSort = $("#nowSorts");
    let sortList = $("#sorts");
    let current = 0;

    openSort.click(function () {
        current += 180;
        sortList.fadeToggle(100);
        openSort.find("span").eq(1).css({"transform": "rotateZ(" + current + "deg)"});
    })

    let sortBtn = $("#sorts button");
    let nowSorted = $("#nowSorts span:nth-child(1)");

    sortBtn.click(function () {
        let sortOrderText = $(this).find("span").eq(0).text();
        nowSorted.text(sortOrderText);
    })


})

RP = {
    setup: function() {
        // add invisible 'div' to end of page:
        $('<div id="movieInfo"></div>').
            hide().
            appendTo($('body'));
        $('#movies a').click(RP.getMovieInfo);
    },
    getMovieInfo: function() {
        $.ajax({type: 'GET',
                url: $(this).attr('href'),
                timeout: 5000,
                success: RP.showMovieInfo,
                error: function() { alert('Error!'); }
               });
        return(false);
    },
    showMovieInfo: function(data) {
        // center a floater 1/2 as wide and 1/4 as tall as screen
        var oneFourth = Math.ceil($(window).width() / 4);
        $('#movieInfo').
            html(data).
            css({'left': oneFourth,  'width': 2*oneFourth, 'top': 250}).
            show();
        // make the Close link in the hidden element work
        $('#closeLink').click(RP.hideMovieInfo);
        return(false);  // prevent default link action
    },
    hideMovieInfo: function() {
        $('#movieInfo').hide(); 
        return(false);
    },
}
$(RP.setup);

RP2 = {
    setup: function() {
        // construct new DOM elements
        $('<label for="filter" class="explanation">' +
          'Restrict to movies suitable for children' +
          '</label>' +
          '<input type="checkbox" id="filter"/>'
         ).insertBefore('#movies').change(RP2.filter_adult);
    },
    filter_adult: function () {
        // 'this' is element that received event (checkbox)
        if ($(this).is(':checked')) {
            $('#movies tr.adult').hide();
        } else {
            $('#movies tbody tr').show();
        };
    },
}
$(RP2.setup);       // when document ready, run setup code


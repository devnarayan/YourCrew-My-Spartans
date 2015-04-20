/* http://keith-wood.name/backgroundPos.html
   Background position animation for jQuery v1.1.1.
   Written by Keith Wood (kbwood{at}iinet.com.au) November 2010.
   Available under the MIT (https://github.com/jquery/jquery/blob/master/MIT-LICENSE.txt) license. 
   Please attribute the author if you use it. */
(function ($) {
    $(function () {
        // resent templates description animation

        $('.boxgrid').each(function () {
            var $caption = $(this).find('span.boxcaption');
            var pheight = $(this).height();
            $caption.css('top', pheight);

            $(this).hover(
				function () {
				    $caption.stop(1);
				    $caption.animate({ top: pheight - $caption.height() });
				},
				function () {
				    $caption.stop(1);
				    $caption.animate({ top: pheight })
				}
			)
        });



    });
})(jQuery);

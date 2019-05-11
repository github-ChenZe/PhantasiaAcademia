$( document ).ready(function() {
	$('.subsectionHead').after('<hr/>');
	$('.figure ~ .figure').after('<br style="display: inline-block;"/>');
    console.log( "readyii!" );
    $('body').append('<div id="figRight" style="margin-right: 0px; position: absolute; top: 0px; right: 0px; width: 280px;"></div>');
    var lastBottom;
    $('.subsectionHead, .subsubsectionHead').each(function() {
    	var content = $(this).text();
    	console.log(content);
    	$(this).attr('id', content.split()[0]);
    	var idOfThis = $(this).attr('id');
    	$('#figRight').append('<br/>' + ($(this).hasClass('subsubsectionHead') ? '&nbsp;&nbsp;&nbsp;&nbsp;' : '')  + '<a style="display: inline-block; margin-top: 5px;" href=\'' + '#' + idOfThis + '\'>' + content + '</a>');
    });
    var index = 1;
    $('body>div.figure').filter(function() { return $(this).outerWidth() < 300; }).
    	each(function() {
    		window.getComputedStyle(document.getElementById("figRight")); // forcing refreshing position
    		var top = $(this).position()["top"];
    		console.log("This top is " + top);
    		console.log("Last bottom is " + lastBottom);
    		if (top < lastBottom) {
    			top = lastBottom;
    			console.log("Thus adjusting this top to " + top);
    		}
    		console.log("This element has height " + $(this).outerHeight());
    		lastBottom = top + $(this).outerHeight(true);
    		console.log("Renewing last bottom to " + lastBottom);
    		$(this).css('position', 'absolute');
    		$(this).css('top', top);
    		$(this).css('right', 20);
    		$("#figRight").append($(this));
    		console.log("");
    	});
    $('p').each(function() {
    	if ($(this).children().length == 0) $(this).remove();
    })
});
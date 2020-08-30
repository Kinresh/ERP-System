$(window).scroll(function() {    
    var scroll = $(window).scrollTop();

    if (scroll >= 145) {
        $(".effect").addClass("affix");
    } else {
        $(".effect").removeClass("affix");
    }
});
$(document).ready(function () {
	$( ".togglemenu" ).click(function() {
	  $( ".sidebar" ).toggleClass( "sidebarhidden" );
	});
});
// Close and toggle buttons
$(document).ready(function () {
	$("div a.closethis").click(function(){
	  $(this).parent().hide();
	});
	$("a.togglethis").click(function(){
		$( this ).toggleClass( "clicked" );
	    $(this).parent().toggleClass("hidden-sec");
	});
});
// add scroll to div
$(document).ready(function() {
  $(".scroller").customScrollbar();
});
// Tabs
$(function () {
	$('#myTab a:first').tab('show')
	$('#myTabdark a:first').tab('show')
})

$(document).ready(function(){
    // tooltip demo
    $('.tooltip-demo').tooltip({
      selector: "[data-toggle=tooltip]",
      container: "body"
    })
	
	// popover demo
    $("[data-toggle=popover]")
      .popover()
	
	$(".alert").alert()
});
$(document).ready(function(){
	selectnav('nav1', {
	  label: 'Menu',
	  nested: true,
	  indent: '-'
	});
});
$(document).ready(function(){
	selectnav('nav2', {
	  label: 'Menu',
	  nested: true,
	  indent: '-'
	});
});
$(document).ready(function(){
	selectnav('nav3', {
	  label: 'Menu',
	  nested: true,
	  indent: '-'
	});
});
$(document).ready(function(){
	selectnav('nav4', {
	  label: 'Inbox Menu',
	  nested: true,
	  indent: '-'
	});
});
$(window).ready(function(){
  var width = $(window).width()
  if ((width <= 900)) {
	$( ".sidebar" ).addClass( "sidebarhidden" );
} else {
	$( ".sidebar" ).removeClass( "sidebarhidden" );
}
});


$( window ).resize(function() {
  var width = $(window).width()
  if ((width <= 900)) {
	$( ".sidebar" ).addClass( "sidebarhidden" );
} else {
	$( ".sidebar" ).removeClass( "sidebarhidden" );
}
});
$(document).ready(function () {
	$('#myModal').modal('hide')

});

$(document).ready(function () {
	$('ul.navi-acc').accordion();
});
$(document).ready(function () {
	$( ".collapsed" ).addClass( "sidebarhidden" );
});
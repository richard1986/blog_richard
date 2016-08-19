// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require smart_listing
//= require bootstrap.min
//= require bootstrap-colorpicker.min
//= require colorbox-rails/jquery.colorbox-min
//= require colorbox-rails/colorbox-links
//= require sidebar
$(document).on('ready',function(){ 
	//var first = $('.panel-default');
	//var second = $('.dropup');
	$('#up-down-1').on('click',function(){
		//$('#up-down').attr('class','panel panel-default dropup');
		$('#up-down-1').toggleClass('panel');
				if ($('#up-down-1').hasClass('dropup'))
				{
					/*$('#up-down').css('background', '#000');*/
					$('#up-down-1').attr('class','panel panel-default');
				}
				else
				{
					$('#up-down-1').attr('class','panel panel-default dropup');
				}
		//$('#up-down .panel').append($('.panel panel-default dropup'));	
	});
	$('#up-down-2').on('click',function(){
		//$('#up-down').attr('class','panel panel-default dropup');
		$('#up-down-2').toggleClass('panel');
				if ($('#up-down-2').hasClass('dropup'))
				{
					/*$('#up-down').css('background', '#000');*/
					$('#up-down-2').attr('class','panel panel-default');
				}
				else
				{
					$('#up-down-2').attr('class','panel panel-default dropup');
				}
		//$('#up-down .panel').append($('.panel panel-default dropup'));	
	});
});
 
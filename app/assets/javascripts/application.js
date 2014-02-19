// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery_ujs


$(function(){
	$('body').on('keypress', '.num', function(e){
		var arr = [];
	    var key = e.which;
	
	    for (i = 48; i < 58; i++){
	        arr.push(i);
        }
		arr.push(46); // for dot 
	    if (!(arr.indexOf(key)>=0))
	        e.preventDefault();
	});
})

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


function addTableRow(jQtable){
	jQtable.each(function(){
		var tds = '<tr>';
		jQuery.each($('tr:last td', this), function() {tds += '<td>'+$(this).html()+'</td>';});
	tds += '</tr>';
		if($('tbody', this).length > 0){$('tbody', this).append(tds);
		}else {$(this).append(tds);}
	});
}

function delTableRow(jQtable){
	jQtable.each(function(){
		if ($('tr', this).length <= 1) return false; 
		$('tr:last', this).remove();
	});
}

function insert(id, evalue)
{
	
	document.getElementById(id).value = evalue
}

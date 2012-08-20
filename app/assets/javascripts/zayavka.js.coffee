# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
 
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
   	$('#goods').append( $(this).data('fields').replace(regexp, time))
   	$('.modal:last').attr('id', 'myModal_'+time)
   	objs = $('.btn:last')
   	
   	alert('Len '+objs.length+ ' id '+ objs[0].id)
   	obj = objs[0]
   	obj.attr('data-target', 'myModal_'+time)
		event.preventDefault()





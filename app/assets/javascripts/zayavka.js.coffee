# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
   	$('#goods').append( $(this).data('fields').replace(regexp, time))
   	event.preventDefault()
   	$('div .modal hide fade').find("#myModal").prop( "id", time)
   	$('.modal:last').attr('id', 'myModal_'+time)
    $('.btn-mini:last').attr('data-target', '#myModal_'+time);

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.fieldset').hide()
    event.preventDefault()

jQuery ->
  $('form').on 'click', '#xxx_btn', ( event ) ->
    $value = $('input[id*=pos_stavka]').last().val()+";"+
                $('input[id*=pos_summa]').last().val()+";"+
                $('input[id*=nalog_stavka]').last().val()+";"+
                $('input[id*=nalog_summa]').last().val()+";"+
                $('input[id*=neft_stavka]').last().val()+";"+
                $('input[id*=neft_summa]').last().val()+";"+
                $('input[id*=nds_stavka]').last().val()+";"+
                $('input[id*=nds_summa]').last().val()+";"+
                $('select[id*=currency]').last().val()
    $('input[id*=opis_all]').last().val( $value )


$(document).on 'change', $('input.numbers_only'), ->
  $('input.numbers_only').each ->
    if $(this).val()!= '' && $.isNumeric($(this).val()) == false
      alert("Поле Количество должно содержать только цифры")

jQuery ->
  $('form').on 'change', $('select[id*=tamrez]'), ( event ) ->
    if $('select[id*=tamrez]').val() == "Временный ввоз"
      $('input[id*=zayavka_temp_period]').show()
      $('input[id*=zayavka_field_8_]').attr('disabled','disabled');
      $('input[id*=zayavka_field_1_]').attr('disabled','disabled');
      $('select[id*=zayavka_typetran]').attr('disabled','disabled');
      $('label[for*=zayavka_]').show()
    else
      $('input[id*=zayavka_temp_period]').hide()
      $('label[for*=zayavka_]').hide()
      $('select[id*=zayavka_typetran]').removeAttr("disabled");
      $('input[id*=zayavka_field_8_]').removeAttr("disabled");
      $('input[id*=zayavka_field_1_]').removeAttr("disabled");

jQuery ->
  if $('select[id*=tamrez]').val() == "Транзит"
    $('input[id*=zayavka_field_5_]').attr('disabled','disabled');
  $('form').on 'change', $('select[id*=tamrez]'), ( event ) ->
    if $('select[id*=tamrez]').val() == "Транзит"
      $('input[id*=zayavka_field_5_]').attr('disabled','disabled');
    else
      $('input[id*=zayavka_field_5_]').removeAttr("disabled");

jQuery ->
  $('input[id*=zayavka_field_7_4]').attr('disabled','disabled');
  $('form').on 'change', $('select[id*=tamrez]'), ( event ) ->
    if $('select[id*=zayavka_typetran]').val() == "ЖД"
      $('input[id*=zayavka_field_7_4]').removeAttr("disabled");
      $('input[id*=zayavka_field_8_1]').attr('disabled','disabled');
      $('input[id*=zayavka_field_8_2]').attr('disabled','disabled');
      $('input[id*=zayavka_field_8_3]').attr('disabled','disabled');
      $('input[id*=zayavka_field_8_5]').attr('disabled','disabled');
      $('input[id*=zayavka_field_8_6]').attr('disabled','disabled');
      $('input[id*=zayavka_field_8_7]').attr('disabled','disabled');
    else
      $('input[id*=zayavka_field_7_4]').attr('disabled','disabled');
      $('input[id*=zayavka_field_8_4_1]').attr('disabled','disabled');
      $('input[id*=zayavka_field_8_5]').removeAttr('data-validate');
  if $('select[id*=zayavka_typetran]').val() == "Авто"
      $('input[id*=zayavka_field_8_4_1]').attr('disabled','disabled');
      $('input[id*=zayavka_field_8_4_2]').attr('disabled','disabled');
      $('input[id*=zayavka_field_8_4_1]').attr('data-validate','false');
      $('input[id*=zayavka_field_8_4_2]').removeAttr('data-validate','false');
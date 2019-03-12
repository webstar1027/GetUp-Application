# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  
  $('#deal_discount_type').change ->
    currentValue = $(this).val()
    console.log currentValue
    switch currentValue
      when 'Value discount'
        $('#percentage_discount').hide()
        $('#free_gift').hide()
        $('#value_discount').show()
      when 'Percentage discount'
        $('#value_discount').hide()
        $('#free_gift').hide()
        $('#percentage_discount').show()
      when 'Free Gift'
        $('#value_discount').hide()
        $('#percentage_discount').hide()
        $('#free_gift').show()
      else
        
    return
    
  # initialise Datetimepicker and Sliders
  md.initFormExtendedDatetimepickers()
  if $('.slider').length != 0
    md.initSliders()
  return
  
  
  
  

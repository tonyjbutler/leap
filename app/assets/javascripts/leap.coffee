###
leap.coffee
The general js needed for leap stuff
###

$(document).ready ->

 setupDatePickers =  (e) ->
    e.find('.datepicker').datepicker
      dateFormat:'D dd M yy'
      prevText: "<i class='icon-arrow-left icon-white'/>"
      nextText: "<i class='icon-arrow-right icon-white'/>"

  # Enable / Disable buttons on a dropdown being selected
  buttonAutoEnable = ->
    $('[data-enable-on]').each (i,button) ->
      $($(this).attr('data-enable-on')).change ->
        if $(this).val()
          $(button).removeAttr("disabled")
        else
          $(button).attr("disabled", "disable")

  # Fade in the person photo once it's loaded  
  #$('.person-photo>img')
  #  .load(-> $(this).fadeIn())
  #  .mouseover(-> $(this).effect('shake', {times:2,distance:3},100))

  #Init Popovers
  $(".has-popover").popover
    delay : 500

  # Init Tooltips
  $(".has-tooltip").tooltip
    delay : 500

  # Fade out alerts after a while
  $('#main-pane > .alert:not(.no-fade)').delay(4000).hide('slow')

  # Focus on any input field with id 'q'. Usually used to focus the search box
  $('#q').focus()

  # Submit the search form if you press the extended search link
  $('#search_extended').click( -> $('#search_form').submit())

  # Set up a date picker for timetables
  $('.timetable-datepicker').datepicker
    buttonImage:'/assets/timetable.png'
    dateFormat:'D dd M yy'
    altFormat:'yy-mm-dd'
    altField:'#real_datepicker'
    prevText: "<i class='icon-arrow-left icon-white'/>"
    nextText: "<i class='icon-arrow-right icon-white'/>"


  # Don't show the help button if there is no help on this page.
  if $('.online-help').length == 0
    $('#help_button').hide()

  # Build the online help by concatinating any info wrapped in a div with class "online-help"
  $('.online-help').appendTo($('#help'))

  # Open the help panel when you click the help button - make it full window height
  $('#help_button').click ->
    $('.online-help').appendTo($('#help')).show()
    $('#help').height($(window).height())
    $('#help').toggle('slide', {direction:'right'})
    $('#help_button').toggleClass('hover')

  # Keep help panel at full window height on window resize
  $(window).resize ->
    $('#help').height($(window).height())

  # Load Delayed Blocks
  $('[load_block]').each (i,block) ->
    $(block).load $(block).attr('load_block'), ->
      $('#help_button').show() unless $('.online-help').length == 0
      $('.nav-pills a:first').tab('show')
      setupDatePickers $(block)
      buttonAutoEnable()
      # TODO: This needs to be moved into a seperate file to keep events seperate if I can hook it into 
      #       the loading of the create form
      $('#progression_review_approved').change ->
        if($('#progression_review_approved').val() == "true")
          $('#progression_reviews_reason_div').hide('slow')
          $('#progression_reviews_conds_div').show('slow')
        else
          $('#progression_reviews_conds_div').hide('slow')
          $('#progression_reviews_reason_div').show('slow')

  # Filter Course Lists by mis_status
  filterCourseList = (status) ->
    if status == "show-all"
      $(".class-list-person").show('fast')
    else
      $(".class-list-person:not(.mis_#{status})").hide('fast')
      $(".class-list-person.mis_#{status}").show('fast')

  $('[data-course-person-filter]').click ->
    filterCourseList $(this).attr('data-course-person-filter')

  $('#person_note_button').click ->
    $('#person_note_text').show("blind","slow")
    $('#person_note_button div').addClass("disabled")

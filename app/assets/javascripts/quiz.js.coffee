# http://stackoverflow.com/a/1060034
onchange = ->
  $.ajax
    url: gon.lock_path,
    type: 'POST'

ready = ->
  if $('#take_quiz_form').length
    $(window).blur -> onchange()
    timer(gon.time_left)
  else
    $(window).off 'blur'

#Countdown timer:

timer = (time) ->
  if time > 0
    [minutes, seconds] = [parseInt(time / 60), time % 60]
    $(".seconds").html("#{seconds} second(s)")
    $(".minutes").html("#{minutes} minute(s)")
    setTimeout (-> timer(time - 1)), 1000
  else
    $(".seconds").html("0 second(s)")
    console.log 'Out of time!'
    $("#submit_quiz").click()

$(document).ready ready
$(document).on 'page:load', ready

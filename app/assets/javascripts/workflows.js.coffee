$(window).ready ->

  update_trigger = ->
    $(".trigger-type").hide()
    $(".trigger-type-#{this.value}").show()

  $(".trigger-type-chooser").on "change", update_trigger
  $(".trigger-type-chooser").each update_trigger

  update_step = ->
    num = $(this).data("step")
    $(".step#{num}-type").hide()
    $("#step#{num}-type-#{this.value}").show()

  $(".step-type-chooser").on "change", update_step
  $(".step-type-chooser").each update_step

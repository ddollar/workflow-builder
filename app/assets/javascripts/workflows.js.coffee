$(window).ready ->

  update_trigger = ->
    $(".trigger-type").hide()
    $(".trigger-type-#{this.value}").show()

  $("#workflow_trigger_type").on "change", update_trigger
  $("#workflow_trigger_type").each update_trigger

  update_step = ->
    num = $(this).data("step")
    $(".step#{num}-type").hide()
    $("#step#{num}-type-#{this.value}").show()

  $(".step-chooser").on "change", update_step
  $(".step-chooser").each update_step

  update_notification = ->
    $(".notification-type").hide()
    $(".notification-type-#{this.value}").show()

  $("#workflow_notification_type").on "change", update_notification
  $("#workflow_notification_type").each update_notification

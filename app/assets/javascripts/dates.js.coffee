$ ->
  $("input.datepicker").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "mm/dd/yy"
      altField: $(this).next()

  $("input.datetimepicker").each (i) ->
    $(this).datetimepicker
      dateFormat: "yy-mm-dd"
      timeFormat: "h:mm TT"
      altFieldTimeOnly: false
      altFormat: "yy-mm-dd"
      altTimeFormat: "HH:mm"
      altField: $(this).next()
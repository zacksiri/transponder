class Transponder.Response
  payload: {}

  constructor: ->
    $(document).ajaxComplete (event, xhr, status) =>
      if xhr and (xhr.getResponseHeader('Content-Type') is 'application/transmission')
        @payload.raw = JSON.parse(@cleanContent(xhr.responseText))
        element    = @payload.raw[0]
        event_name = @payload.raw[1]
        content    = @payload.raw[2]

        $(element).trigger(event_name, content)

  cleanContent: (content) ->
    content.replace(/'/g, '"');
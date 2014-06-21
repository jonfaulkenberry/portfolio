$ ->
  if ($('.codemirror').length > 0)
    $('.codemirror').each () ->
      CodeMirror.fromTextArea( $(this).get(0), 
        { lineNumbers: true, lineWrapping: true, theme: 'monokai' }
      )

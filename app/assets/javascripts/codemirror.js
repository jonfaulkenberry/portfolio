$( document ).ready(function() {
  if ($('.codemirror').length > 0) {
    $('.codemirror').each(function() {
      var myCodeMirror = CodeMirror.fromTextArea($(this).get(0), {
        lineNumbers: true,
        lineWrapping: true,
        theme: 'monokai'
      });
    });
  }
});
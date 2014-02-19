$( document ).ready(function() {
  if ($('.codemirror-md').length > 0) {
    $('.codemirror-md').each(function() {
      var myCodeMirror = CodeMirror.fromTextArea($(this).get(0), {
        lineNumbers: true,
        theme: 'monokai'
      });
    });
  }
});
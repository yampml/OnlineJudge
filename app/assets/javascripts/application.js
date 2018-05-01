// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require codemirror
//= require codemirror/modes/xml
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/javascript
//= require codemirror/modes/ruby
//= require codemirror/modes/haml
//= require_tree .

var delay;
// Initialize CodeMirror editor with a nice html5 canvas demo.
var editor = CodeMirror.fromTextArea(document.getElementById('code'), {
  mode: 'text/html'
});
editor.on("change", function() {
  clearTimeout(delay);
  delay = setTimeout(updatePreview, 300);
});

function updatePreview() {
  var previewFrame = document.getElementById('preview');
  var preview =  previewFrame.contentDocument ||  previewFrame.contentWindow.document;
  preview.open();
  preview.write(editor.getValue());
  preview.close();
}
setTimeout(updatePreview, 300);

var canvas = document.getElementById('pane');
var context = canvas.getContext('2d');
context.fillStyle = 'rgb(250,0,0)';
context.fillRect(10, 10, 55, 50);
context.fillStyle = 'rgba(0, 0, 250, 0.5)';
context.fillRect(30, 30, 55, 50);
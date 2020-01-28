document.addEventListener('copy', function (event) {
  var pagelink = '\n\nSource: <a href="' + document.location.href + '">' + document.location.href + '</a>';
  event.clipboardData.setData('text', document.getSelection() + pagelink);
  event.preventDefault();
});

function ready(callbackFunction){
  if (document.readyState != 'loading')
    callbackFunction(event)
  else
    document.addEventListener("DOMContentLoaded", callbackFunction)
}

ready(function (event) {
  littlefoot.littlefoot({
    allowMultiple: false,
    activateOnHover: false,
    hoverDelay: 250,
    dismissOnUnhover: false,
    dismissDelay: 250,
    scope: 'article',
    numberResetSelector: 'article',
    contentTemplate: '\
     <aside alt="Footnote <% number %>"\
         class="littlefoot-footnote is-positioned-bottom"\
         id="fncontent:<% id %>">\
       <div class="littlefoot-footnote__wrapper">\
         <div class="littlefoot-footnote__content">\
           <% content %>\
         </div>\
       </div>\
       <div class="littlefoot-footnote__tooltip"></div>\
     </aside>',
    buttonTemplate: '\
      <button aria-expanded="false"\
          aria-label="Footnote <% number %>"\
          class="footnote-button"\
          id="<% reference %>"\
          title="See Footnote <% number %>" />(<% number %>)</button>',
  });
});

ready((event) => {
  const isActive = (element) => {
    return element.parentElement.classList.contains('active');
  };

  let activeElement = null;
  const setActive = (element) => {
    if (isActive(element)) { return; }

    if (activeElement) {
      activeElement.parentElement.classList.remove('active');
      activeElement = null;
    }

    element.parentElement.classList.add('active');
    activeElement = element;
  };

  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      const id = entry.target.getAttribute('id');
      if (entry.isIntersecting) {
        setActive(document.querySelector(`#toc nav a[href="#${id}"]`));
      }
    });
  });

  document
    .querySelectorAll('#content h1[id], #content h2[id], #content h3[id], #content h4[id], #content h5[id], #content h6[id]')
    .forEach((heading) => {
      observer.observe(heading);
    });
});

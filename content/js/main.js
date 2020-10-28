function ready(callbackFunction){
  if (document.readyState != 'loading')
    callbackFunction(event)
  else
    document.addEventListener("DOMContentLoaded", callbackFunction)
}

ready(function (event) {
  littlefoot.littlefoot({
   activateOnHover: true,
   hoverDelay: 250,
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

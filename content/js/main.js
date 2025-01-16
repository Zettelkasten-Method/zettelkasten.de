function ready(callbackFunction){
  if (document.readyState != 'loading')
    callbackFunction(event)
  else
    document.addEventListener("DOMContentLoaded", callbackFunction)
}

ready((event) => {
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
  let direction = 'up';
  let prevYPosition = 0;
  const setScrollDirection = () => {
    direction = (window.scrollY > prevYPosition) ? 'down' : 'up';
    prevYPosition = window.scrollY;
  };

  const isActive = (el) => el && el.parentElement.classList.contains('active');

  let lastDeactivatedElement = null;
  let activeElements = [];
  const activate = (element) => {
    cleanupSynthesizedActiveElement();
    if (!element || isActive(element)) return;
    element.parentElement.classList.add('active');
    activeElements.push(element);
  };
  const deactivate = (element) => {
    if (!element || !isActive(element)) return;
    element.parentElement.classList.remove('active');
    activeElements = activeElements.filter(el => el !== element);
    if (activeElements.length === 0) {
      lastDeactivatedElement = element;
    }
  };

  /** Element that was activated 'synthetically', i.e. as a fix-up once all headings have scrolled out of view. */
  let synthesizedActiveElement = null;
  const activateSynthesized = (element) => {
    activate(element);
    synthesizedActiveElement = element;
    lastDeactivatedElement = null;
  };
  const cleanupSynthesizedActiveElement = () => {
    if (!synthesizedActiveElement || !isActive(synthesizedActiveElement)) return;
    deactivate(synthesizedActiveElement);
    synthesizedActiveElement = null;
  };
  const synthesizeActiveElementInScrollDirectionIfNeeded = () => {
    if (activeElements.length > 0 || !lastDeactivatedElement) return;
    const lastDeactivatedIndex = tocElements.indexOf(lastDeactivatedElement);
    const targetIndex = (direction === 'up')
      ? Math.max(lastDeactivatedIndex - 1, 0)
      : Math.min(lastDeactivatedIndex, tocElements.length - 1);
    const target = tocElements[targetIndex];
    activateSynthesized(target);
  };

  const tocElements = Array.from(document.querySelectorAll(`#toc nav a`));
  const onIntersect = (entries, observer) => {
    setScrollDirection();

    entries.forEach((entry) => {
      const id = entry.target.getAttribute('id');
      const index = tocElements.findIndex(a => a.href.includes(`#${id}`));
      if (index === -1) { return; }

      const tocElement = tocElements[index];

      if (entry.isIntersecting) {
        activate(tocElement);
      } else {
        deactivate(tocElement);
      }
    });

    synthesizeActiveElementInScrollDirectionIfNeeded();
  };

  const observer = new IntersectionObserver(onIntersect);

  document
    .querySelectorAll('#content h1[id], #content h2[id], #content h3[id], #content h4[id], #content h5[id], #content h6[id]')
    .forEach((heading) => {
      observer.observe(heading);
    });
});

ready((event) => {
  const menuLinks = document.querySelectorAll('#navigation .main-navigation a');
  menuLinks.forEach((link) => {
    link.addEventListener('click', () => {
      const navigation = document.querySelector('#navigation .main-navigation');
      navigation.classList.add('no-transition');
    });
  });
});

ready((event) => {
  const nav = document.getElementById("navigation");
  const hamburger = document.getElementById("hamburger-toggle");
  window.addEventListener("click", (event) => {
    const eventPath = event.composedPath();
    const isTargeted = eventPath.includes(nav);
    if (!isTargeted) {
      hamburger.checked = false;
    }
  });
});

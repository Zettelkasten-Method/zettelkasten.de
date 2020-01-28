---
title: "Displaying Flow Charts in nvALT's Preview Window Using Mermaid.js"
created_at: 2017-04-21 14:28:14 +0100
kind: article
author: christian
tags: [ nvalt, javascript, graph ]
image: 20170212085637_mermaid.png
vgwort: https://vg01.met.vgwort.de/na/0a8500f216cb4cd39997bdf71654d5b8
---


nvALT's Markdown preview uses a browser to display HTML output of your note. That enables you to include a lot of modern web technology in your note previews.  [Mermaid](http://knsv.github.io/mermaid/) is such a thing: it's a JavaScript library that renders flow charts from plain text graph definitions.

[Look at the demos](http://knsv.github.io/mermaid/#demo1) to get a feel for it.

nvALT and I both assume you write your notes in Markdown to make the following work. If you don't, nvALT will still render HTML in the browser window; skip to the end for a Markdown-less mini tutorial.

Nevertheless, tweaking the template is a bit more advanced than downloading files. You have to paste a bit of code in an HTML file. Maybe you'll want to ask your neighboring teenager to do that for you.

## Mermaid and Markdown

Markdown accepts HTML in your notes. But nobody wants to write HTML. The plain text syntax of Mermaid is okay and sufficiently readable to stand as-is. I am fine with a piece of my note looking like the following (Latin aside):

    Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
    sed do eiusmod tempor incididunt ut labore et dolore magna 
    aliqua. Ut enim ad minim veniam.
    
        graph LR
        Lorem -- ipsum --> Dolor
        Lorem --> Exceptur
        Dolor --> Exceptur

    Duis aute irure dolor in reprehenderit in voluptate velit 
    esse cillum dolore eu fugiat nulla pariatur. 
    
    Excepteur sint occaecat cupidatat non proident, 
    sunt in culpa qui officia deserunt mollit anim id est laborum.

The ASCII-arrows are good enough to be readable. I indent the graph definitions so they render as verbatim (or "code") blocks by default when no Mermaid is installed.

This, in turn, makes Mermaid setup a bit more complicated, because we have to remove all the code-iness of verbatim blocks that Markdown-to-HTML-converters usually insert. 

If you don't understand a word of HTML or JavaScript, then just follow the step-by-step guide and skip the explanation.

### Explanation of the Pocess for the Savvy Reader

Mermaid looks for `<div>` tags with the `mermaid` class and then uses the text contents as input for its graph rendering. Mermaid isn't clever enough to skip HTML tags inside, so we have to make sure the Markdown converter doesn't mess with the stuff.

Sadly, I have code syntax highlighters installed; and I think the default behavior of a Markdown-to-HTML-converter is to translate indented blocks of text to a `<code>` tag nested inside a `<pre>` tag.

This means we're going to look for all `<pre>` tags and then take the plain text out of it, ignoring any other HTML tags inside. JavaScript offers `element.innerText` for this, so that's simple. Then we replace the whole `<pre>` block with a `<div class="mermaid">` block to prevent syntax highlighters to interfere. Only afterwards will we let Mermaid do its job.

To distinguish Mermaid graphs from regular code, the sad news is this: we'll have to add a [hashbang](https://en.wikipedia.org/wiki/Shebang_(Unix))-like "block syntax identifier". That means each code block that is supposed to become a graph has to start with a line that contains `%%!mermaid`:

    The following will become a picture:
    
        %%!mermaid
        graph LR
        A --> B
    
    ... but this will stay simple code:
        
        some.code();
    
    (More text here, blah blah.)

I'm a coder. I can live with that extra line. But it kinda ruins the purity of this approach. 

### Alternative Approach

Maybe another approach is to try to interpret _all_ code blocks with Mermaid and only keep the result for those that don't fail. The [Mermaid JavaScript API](http://knsv.github.io/mermaid/#api-usage) seems to support that approach. 

If you want to spend more time with this than I: suggestions are very welcome!

### Step-by-Step Instructions

Put this Mermaid test graph definition into a note to test it later:

    Here comes a graph:
    
        %%!mermaid
        graph TD %% TD = top-down. LR is also possible
        A-->B
    
    That was all.

1. Now quit nvALT. You need to restart the app to reload the preview HTML template.
2. Download Mermaid from here: <https://github.com/knsv/mermaid/releases> (There's a "Downloads" sub-section after all the release notes.)
3. Extract the Mermaid zip file.
4. Navigate to the path `~/Library/Application Support/nvALT/`. In Finder, you can press ⌘G to invoke the "Navigate → Go To..." menu item and paste the path inside. Make sure you're in a folder with a `template.html` file.
5. From the Mermaid folder, copy `mermaid.min.js` and `mermaid.css` to the nvALT folder next to the `template.html`.
6. Open the `template.html` in a text editor. Paste the following lines inside the "head" section at the top, maybe in a new line right after the one starting with `<title>`:

<br>

    <link rel="stylesheet" href="file://{%support%}/mermaid.css">
    <script type="text/javascript" src="file://{%support%}/mermaid.min.js"></script>

Now the Mermaid files will be loaded. But Mermaid won't run, yet. 

Paste the following block of code below the lines you just inserted. The JavaScript inside will replace verbatim blocks of text that start with `%%!mermaid` with a graph just as explained above. I added comments in case you want to follow along:

    <script>
    // Run the replacement when the browser is ready.
    document.addEventListener("DOMContentLoaded", function(event) { 

      // Take all <pre> tags ...
      var elements = document.querySelectorAll("pre");
      for (var i = 0; i < elements.length; i++) {
    
        // ... that start with "%%!mermaid".
        var element = elements[i];
        if (!element.innerText.startsWith("%%!mermaid")) { return; }
        
        // Create a `<div class="mermaid">` tag and copy over 
        // the graph definition.
        var result = document.createElement('div');
        result.classList.add("mermaid");
        result.innerHTML = element.innerText;
    
        // Then replace the old <pre> block with the new one.
        element.parentNode.insertBefore(result, element);
        element.parentNode.removeChild(element);
      }
      
      // After all replacements, run Mermaid which will render
      // the blocks we've just created.
      mermaid.initialize(undefined);
    });
    </script>
  
Save the file. Launch nvALT. Look at the note with the graph. 

<%= insert_teaser_image title: "Mermaid graph" %>

Isn't it pretty?


## Markdown-less Setup

You can put the graph syntax in HTML yourself. Even though the rest of the note may not be Markdown, nvALT will still put the text of your note into a HTML document for the preview (web browser) window to display.

Put this HTML code into a note to test Mermaid graph rendering:

    <div class="mermaid">
      graph TD %% TD = top-down. LR is also possible
      A-->B
    </div>

1. Now quit nvALT. You need to restart the app to reload the preview HTML template.
2. Download Mermaid from here: <https://github.com/knsv/mermaid/releases> (There's a "Downloads" sub-section after all the release notes.)
3. Extract the Mermaid zip file.
4. Navigate to the path `~/Library/Application Support/nvALT/`. In Finder, you can press ⌘G to invoke the "Navigate → Go To..." menu item and paste the path inside. Make sure you're in a folder with a `template.html` file.
5. From the Mermaid folder, copy `mermaid.min.js` and `mermaid.css` to the nvALT folder next to the `template.html`.
6. Open the `template.html` in a text editor. Paste the following lines inside the "head" section at the top, maybe in a new line right after the one starting with `<title>`:

    <link rel="stylesheet" href="file://{%support%}/mermaid.css">
    <script type="text/javascript" src="file://{%support%}/mermaid.min.js"></script>
    <script>mermaid.initialize({startOnLoad:true});</script>

Save the file. Launch nvALT. Look at the note with the graph and pray it now shows something.

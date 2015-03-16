---
title: Zettel Note Header Automation in NvALT
created_at: 2014-10-09 21:41:00 +0200
kind: article
author: christian
tags: [ nv, tool, mac ]
vgwort: http://vg08.met.vgwort.de/na/eb5a7102855e4b4d875e88e998af70b5
image: 201410092140_nv-script.png
---

An essential priniciple of a _Zettelkasten_ is its flexibility. From there you can derive maxims like "you should avoid proprietary software", and "you should use plain text notes to ensure longevity". That's why I don't use a fancy application with lots of spectacular features but the simple [nvALT][nvz] instead. Here's how I automate note creation to speed up my workflow.

nvALT isn't a dedicated _Zettelkasten_ application. It doesn't know anything about identifiers or references or topic clusters. It only manages text files, and it's up to us to make a sense of it. We have to plug-in everything related to the _Zettelkasten_ method ourselves.

nvALT creates new files pretty easily, though most of the _Zettel_ markup I deem important is missing. The [bare minimum of a _Zettel_ note][min] can look like this:

    201105160958 Improve the structure of essays by rewriting

    Benjamin Franklin improved his writing skill by re-writing other author's articles (Isaacson 2004, p. 28):

    * Take notes when reading on single scraps of paper. (Like in the reading workflow for a Zettelkasten)
    * Shuffle the notes sometimes
    * When the original content is forgotten, write an essay based on your notes and compare to the original
    * Sometimes try to write in verse instead

    Cf. <http://www.earlyamerica.com/lives/franklin/chapt1/>

    #writing #essay #practice #zettelkasten

    ---
    References:

    Walter Isaacson (2004):  Benjamin Franklin. An American Life, New York and London and Toronto and Sydney: Simon and Schuster Paperbacks.

According to this example, a note gets a title, a [global identifier][ident], tags, and a list of references. You could leave out a title since the identifier is sufficient to, well, _identify_ each note. Having a title is usability sugar. So is the list of references. I think tags are important to form loosely connected clusters of notes. Let's sketch a wireframe of a _Zettel_ like this (`<<...>>` denotes a placeholder):

    <<ID>> <<Title>>
    
    (The Text will come here.)
    
    <<Tags>>
    
That's what the script provides: generate a date-time based identifier, insert a title of your choice, and rename the note accordingly.

Because writing _Zettel_ notes has to be as efficient as possible, I created an Automator Service to insert the date-based _Zettel_ identifier into a new note:

**Download the [Zettel Header Service][download] (Automator workflow)** for nvALT (Mac).


To install the Service, unzip the archive and open the included Service file. Mac OS will then ask you to move the script in your `~/Library/Services` folder. Agree to do so. Then, you should be able to invoke the service from the menu by selecting nvALT > Services > Insert Zettel Header. 

You can assign a keyboard shortcut to this Service from your System Preferences to speed-up note creation even more. Go to your Keyboard system preferences pane and select the "Shortcuts" tab. Add an "App Shortcut", use "Insert Zettel Header" as the menu title and select a keyboard shortcut (I use ⌘⌥⌃H). No more clicking necessary!

If you're interested in customizing the script or if you want to understand how it works, read on.

[ident]: /posts/2014/02/add-identity/

## What's in the Script?

The script does the following:

- ask for a note title
- generate a _Zettel_ ID for the current time (the timestamp is of the format `YYYYMMDDHHmm`)
- rename the active note in nvALT to become `<<ID>> <<Title>>`
- paste the ID and title into the note

The gist of the script is about invoking keystrokes. I added comments to the script so you can make sense of the keystroke invocation.

<script src="https://gist.github.com/DivineDominion/fe1d4d39baf45477a496.js"></script>

You can copy the [full AppleScript Gist from GitHub][gist].

If you want to use a more elaborate header, add additional lines of text to the lines of `set theHeader to ...`. The blank line is in there to create enough whitespace to start typing. You may delete it if you don't find it useful.

For example, I like to use MultiMardown-style headers. So in my version, the value for `theHeader` looks like this:

    set theHeader to "Title:" & theTitle & "
    Tags: #"

This adds two lines of text into the header and places the cursor right after the hash character (`#`) so I can begin adding tags right away. I put my list of keywords into the header instead of the bottom of the note, contrary to the bare-minimum example from above. When you pick MultiMarkdown, this makes sense. If you stick to "just text", I guess you better leave tags at the bottom so they are out of sight.

You can see that the function `current_date()` concatenates year, month, day, hours, and minutes into a string like `201410011105` for "2014-10-01 11:05 a.m.". You could add the seconds, too, by adding `(twoDigitDisplay(it's seconds))` to `current_date()`. I found that it suffices to create _Zettel_ notes with accuracy to the minutes. I assign IDs with accuracy to the seconds to items outside my note archive, though.[^two]

Please share your customizations, and how you format your Zettel header!

[^two]: The `twoDigitDisplay()` stuff was necessary to pad numbers with zeros, so "1" becomes "01" to ensure consistency among identifiers. I believe this can be shortened, but I wouldn't know how. Any AppleScript tips are welcome!

[min]: /posts/2014/03/baseline-zettelkasten-software-reviews/#the-bare-minimum-of-a-zettel-note
[nvz]: /posts/2014/04/nvalt-zettelkasten-implementation/
[gist]: https://gist.github.com/DivineDominion/fe1d4d39baf45477a496
[download]: /downloads/2014-09-29_Insert-Zettel-Header-Workflow.zip

---
title: Zettel note header automation in nvALT
created_at: 2014-09-26 10:37:00 +0200
kind: article
author: christian
tags: [ nv, tool, mac ]
vgwort: http://vg08.met.vgwort.de/na/eb5a7102855e4b4d875e88e998af70b5
comments: on
publish: false
---

The essential priniciple of a _Zettelkasten_ is its flexibility. From there I derived my maxims, like "you should avoid proprietary software", and "you should use plain text notes to ensure longevity". That's why I don't use a fancy application with lots of spectacular features but the simple [nvALT][nvz] instead. Here's how I automat note creation to speed up my workflow.

nvALT isn't a dedicated _Zettelkasten_ application. It doesn't know anything about identifiers or references or topic clusters. It only manages text files, and it's up to us to make a sense of it. We have to plug-in everything related to the _Zettelkasten_ method ourselves. That's fairly easy because we're mostly dealing with text.

**Download the [Zettel Header Service][download] (Automator workflow)** for nvALT (Mac).

Because writing _Zettel_ notes has to be as efficient as possible, I created a script to insert the date-based _Zettel_ identifier into a new note.

The [bare minimum of a Zettel note][min] looked like this:

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

To automate _Zettel_ creation, we can wireframe a _Zettel_ like this (`<<...>>` denotes a placeholder):

    <<ID>> <<Title>>
    
    (The Text will come here.)
    
    <<Tags>>
    
    ---
    References:
    
    <<References>>

I don't like to work with a wireframe which is so strict. Some notes don't have references, for example. But what I always need is the [global _Zettel_ identifier][ident] and the note title. So that's what you get with my script: a date-time based ID, followed by a title of your choice. The note is automatically renamed accordingly.

## The Script

The script does the following:

- generate a _Zettel_ ID for the current time (the timestamp is of the format `YYYYMMDDHHmm`)
- ask for a note title
- rename the active note in nvALT to become `<<ID>> <<Title>>`
- paste the ID and title into the note

The gist of the script is this:

    tell application "nvALT" to activate
    tell application "System Events"
      --- Save the old clipboard
      set currentClipboard to the clipboard
      
      --- Paste the header
      set the clipboard to theHeader
      keystroke "v" using command down
      delay 0.3
      
      --- Rename the file (Cmd-R) and paste in the title
      keystroke "r" using command down
      set the clipboard to theZettel
      keystroke "v" using command down
      delay 0.3
      
      --- Move back to the editing pane and restore the clipboard
      keystroke tab
      delay 1
      set the clipboard to currentClipboard
    end tell

You can copy the [full AppleScript from GitHub][gist], which is the following:

<script src="https://gist.github.com/DivineDominion/fe1d4d39baf45477a496.js"></script>

Alternatively, you can download the [Zettel Header Service][download] as an Automator workflow. You can assign a keyboard shortcut to this service from your System Preferences to speed-up note creation even more. (I use ⌘⌥⌃H)

If you use MultiMarkdown, you can tweak the script a bit. Locate where the header is set and replace

    set theHeader to "" & theZettel & "

    "

With the following, preserving the blank line:

    set theHeader to "Title:" & theZettel & "
    
    "

[min]: /posts/2014/03/baseline-zettelkasten-software-reviews/#the-bare-minimum-of-a-zettel-note
[ident]: /posts/2014/02/add-identity/
[nvz]: /posts/2014/04/nvalt-zettelkasten-implementation/
[gist]: https://gist.github.com/DivineDominion/fe1d4d39baf45477a496
[download]:

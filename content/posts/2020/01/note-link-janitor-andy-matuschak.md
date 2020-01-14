---
title: Insert a List of Backlinks Into All Your Notes
created_at: 2020-01-14 07:34:03 +0100
kind: article
author: christian
tags: [ script, backlink ]
description: "Use this script to add a list of backlinks to all of your notes, and update it in place to always have up-to-date results."
---

Andy Matuschak shared [a script called `note-link-janitor`][janitor] with us the other day that maintains a list of backlinks in all of your Markdown notes.

And yes, by "maintains" I really mean "maintains": if it doesn't exist, it adds a `## Backlinks` section at the end of each Zettel with a list of incoming links, and it updates the section on subsequent runs. This means you can run the script as often as you'd like, and it always produces an up-to-date result -- as opposed to, say, naively adding a new `## Backlink` section time and time again. When you run the script regularly, you'll always have an up-to-date backlink list in your notes. Neat.

On the flip side, it deletes any customizations you add to these sections as well, so you better not write in them.

**Please test the script on a copy of your notes, because there is no undo, and make backups!**

I ran it on a copy of a subset of my notes from [the David Epstein videos](https://zettelkasten.de/posts/tags/book-processing-series/) and on the note `201910011532 Computational thinking`, it inserted one link, plus a copy of the phrase it was found in:

    ## Backlinks
    * [[201711181848 Separation of Concerns]]
        * [[201910011532 Computational thinking]] is about separation of concerns

The script does find `[[wiki links]]`, but only finds the files when the whole filename is inside the square brackets. 

- This link is recognized: `[[201910011532 Computational thinking]]`
- This is not: `[[201910011532]] Computational thinking`

On the upside, there's hope for a less precise search since the script is open source. (It is written in JavaScript/TypeScript.) Anyone can volunteer to change the file name resolver algorithm to add an option to make it work with partial matches in file names.

**[Check out `note-link-janitor` on GitHub.][janitor]**

[janitor]: https://github.com/andymatuschak/note-link-janitor

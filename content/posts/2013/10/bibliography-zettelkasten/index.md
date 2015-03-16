---
title: Manage Citations for a Zettelkasten
created_at: 2013-10-07 18:18:37 +0200
kind: article
author: christian
tags: [ reading, reference-management ]
image: 201310071817_bibdesk.png
vgwort: http://vg02.met.vgwort.de/na/f4202a462ce54077ae77953e77004a63
---

Today, we'll talk about tools for a change.  Managing a reference file is part of the **collection** phase of maintaining a _Zettelkasten._  It's of special importance if you're writing a research paper or a book because without proper citation management things are going to be a mess for you, soon.  I'll show you how I do it and tell you about possible alternatives briefly.

In short, I suggest you:

* use MultiMarkdown citations,
* add the full citation to every Zettel once,
* use a reference manager and
* add TextExpander shortcuts for frequently cited works.

## Why I add full citations to every Zettel

<%= insert_rel_image file: "zettel.png", title: "Screenshot of a Zettel", caption: "Zettel with full citation at the bottom" %>

I always include a full citation in a _Zettel._  This redundant storage gives me a safe feeling:  

* Every _Zettel_ I write is self-contained:  nvALT and [Marked](http://marked2app.com/) preview know what to do without additional effort.
* I could re-create a bibliography from most of the references stored in my notes did I ever lose my precious digital library.
* Since I only add references to notes from my bibliography manager, I've still got a fully working bibliography or digital library at my fingertips.

The references are copied over from my bibliography manager of choice, [BibDesk][].  I made this process as easy as I could.  TextExpander and the like will help you safe tons of time.  Whenever I'm about to create lots of notes for a book, I add two shortcuts:

1.  A shortcut to the full citation which I put at the end of a note.  For example `,,evans` expands to:
    
        [#evans2006ddd]: Eric Evans (2006):  _Domain-Driven Design. Tackling complexity in the heart of software_, Upper Saddle River, NJ: Addison-Wesley.
2.  Another shortcut is needed for inline citations.  For example, `°evans` expands to `[{^}][#evans2006ddd]`, where `{^}` denotes the cursor position.

If you're doing lots of research, do yourself a favor and get at least a trial version of [Typinator][tn] or [TextExpander][tx] or [KeyboardMaestro][km] and see for yourself how much faster you can be.

[tn]: http://www.ergonis.com/products/typinator/
[tx]: http://smilesoftware.com/TextExpander/
[km]: http://www.keyboardmaestro.com

## Benefits of MultiMarkdown citations

When I write anything, I capture ideas in my _Zettelkasten_ in [MultiMarkdown][mmd].  I compose drafts for longer pieces in MultiMarkdown as well.  When I need to hand in a paper, I convert MultiMarkdown to LaTeX to PDF. 

Since MultiMarkdown has its own [citations syntax][mmdcit], every citation in my _Zettelkasten_ is done in this format.

    Something something.[p 123][#citekey]
    
    [#citekey]: (full-blown reference like in the example above)

When I put Markdown preview in nvALT [exactly three years ago][mmdnv], I deliberately chose MultiMarkdown to support citations for acamedic writing.  It served me well all these years and I'm glad Brett & David sticked to it when NV became nvALT.

It's easy to go from `.mmd` to `.tex` and clean things up afterwards.  LaTeX utilizes the BibTeX format to read bibliography information and generate manageable citations and a well-formed bibliography.  

[mmd]: http://fletcherpenney.net/multimarkdown/
[mmdnv]: /posts/2010/10/markdown-hud-nv/
[mmdcit]: http://fletcher.github.io/peg-multimarkdown/#citations

## BibDesk bibliography manager

<%= insert_teaser_image title: "BibDesk" %>

The software which fits like a glove when managing references seems to be [BibDesk][] (Mac only).  It's storing everything in a `.bib` BibTeX file, hence everything is fully compatible with LaTeX.

The sweet part is how easily you can create your own **export templates** which in turn can be bound to the "copy" action at ⌘C (Cmd+C).  Select the items in the library, hit "copy", switch to nvALT, paste, done.

You can [find the full citation template on GitHub][exp] and propose changes there.  

<script src="https://gist.github.com/DivineDominion/6870769.js"></script>

You can find the other BibDesk templates in `~/Library/Application Support/BibDesk/Templates/`.  This is where I put mine, too.  You have to add the template file to BibDesk's preferences afterwards.  They are overwhelmingly complex at first, but you only need worry about the setting panes called "Template Files" and "Citation Behavior" ([see image](<%= rel_url_for 'config.png' %>)). 

[bibdesk]: http://bibdesk.sourceforge.net/
[exp]: https://gist.github.com/DivineDominion/6870769

### Software Alternatives

Your reference manager should get out of your way and export references in a MultiMarkdown-friendly format if you're like me.  The more you cite your sources in notes the more you will want to have a shortcut to generate the citations quickly.

I've had my hands on various alternatives you might want to try for yourself:

*   [Zotero][] is nice and platform independent but the export templates give me nightmares.  Zotero is more useful if loathe LaTeX and prefer to write articles in Word or Pages since it can export bibliographies as rich text.
*   [JabRef][] is a platform independent BibTeX database manager a friend of mine used for years.  It's ugly, but it does its job.  Even on Windows.
*   Then there's [Mendeley][], which has a unique spin:  it incorporates social network features and stores attachments in its cloud service.  You can share citations and cooperate on bibliographies with others, think _collaborative research._  Also, it totally turns me off because I don't need any of this.

In the end, you could totally use a spreadsheet to keep track of author, title and year and a column with pre-formatted Markdown output.  Cal Newport wrote a great introduction on how to use a lo-fi ["Research Database" spreadsheet][rdb] way back in 2007.  His principles of organizing the database are well worth a read.

[zotero]: http://www.zotero.org/
[mendeley]: http://www.mendeley.com/
[jabref]: http://jabref.sourceforge.net/
[rdb]: http://calnewport.com/blog/2007/10/01/monday-master-class-how-to-build-a-paper-research-database/

## Outlook

Chances are you write a lot.  Since I'm covering Mac applications a great deal, you probably have heard of [Scrivener][].  When you collect your notes and ideas in your _Zettelkasten,_ you may want to write your paper or your book with Scrivener.  Since Scrivener utilizes MultiMarkdown, it's a fully compatible extension to the note-taking workflow I've sketched.  There's a great article by Tim Brandes about [writing and citing in Scrivener 2][scr] which I enjoyed reading.

I picked my tools so they can be easily exchanged.  A BibTeX database can be edited with any text editor.  The popular MultiMarkdown syntax won't go anywhere soon.  What are your principles?

[scrivener]: http://www.literatureandlatte.com/scrivener.php
[scr]: http://timbrandes.com/blog/2012/02/28/howto-write-your-thesis-in-latex-using-scrivener-2-multimarkdown-3-and-bibdesk/


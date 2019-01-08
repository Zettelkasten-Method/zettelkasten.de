---
title: You Only Find What You Have Identified
created_at: 2014-02-27 22:29:12 +0100
kind: article
author: christian
tags: [ archive, writing, process, identifier ]
image: 201402272240_find.jpg
vgwort: https://vg08.met.vgwort.de/na/960a44ad284a4fbbbe68b6159d1c8ad6
import:
    from: "http://christiantietze.de/posts/2014/02/add-identity/"
---

<!--ct: -->

I want to answer the question: Why are unique identifiers useful when you work with a _Zettelkasten_?

The objective of a _Zettelkasten_ note archive is to store notes and allow connections.  Both are necessary to [extend our mind and memory][extend].  As long as the software you use doesn't provide any means to create links between notes, you have to come up with your own convention.  Even if the software did provide such a mechanism, I'd suggest you think twice about relying on it:  I want to evade vendor lock-in for my _Zettelkasten,_ and I think you should, too.  So let's assume you don't care about the software and create your own hyperlink scheme.

To create links, you'll need to define **targets** first.  This is how I do it:  every _Zettel_ note gets its own unique ID.  It is time-based, and a timestamp like "2014-02-26 9:39am" is concatenated and turns into "201402260939", for example.

Whenever I **reference** a note, I use the target's ID and prefix my reference-glyph of choice, the paragraph sign (`§`).  This way, I end up with `§201402260939`.  When I read a note, this is enough to give away that I'm linking to a note.  The reference glyph is useful to distinguish a thing itself, the note and its ID, from references to the thing.

<%= insert_teaser_image title: "searching", caption: %Q{Photo Credit: <a href="http://www.flickr.com/photos/15577588@N00/1831955837/">chrisbb@prodigy.net</a>, <a href="http://creativecommons.org/licenses/by/2.0/">cc</a>}, link: "http://www.flickr.com/photos/15577588@N00/1831955837" %>

In fact, since I write my notes in plain text Markdown, I use a Markdown-style syntax to denote links:  `[target description][§201402260939]`.  I want to add a Markdown pre-processor so links like these work out of the box.  Since I don't define the link reference `[§201402260939]` anywhere, no click-able link is created when I convert notes to HTML.

Also, every Zettel has its own file in my archive.  This isn't a necessary criteria for identity, though.  It's just way more convenient than writing everything in one single, big file of text.  Additionally, thinking in files comes easier than merely thinking in IDs.  Keep this in mind, though:  Note identity and file system representation are ultimately not the same thing.

Think outside of the box for a moment:  when note identity and file system representation are decoupled like this, how could we use information identity elsewhere?

[extend]: /posts/extend-your-mind-and-memory-with-a-zettelkasten/

## Hyperlinks in a Book Manuscript

In my [Zettelkasten book][zkbook] manuscript, I wanted to create cross-references between sections.  Their main purpose is to remind me which parts are tightly coupled so I neither repeat myself accidentally, nor forget to write about a detail.

Part of my writing process is to add comments to the manuscript which contain promises I make.  This way I don't lose track of all the open loops which are scattered everywhere.  The whole manuscript is a big construction site where I, the builder, make progress concurrently.  Pointing at other parts of the book makes it easier to remember _not_ to write about a topic in a particular place.  Instead, I can create a placeholder where the details really belong and point to it from where the thought occurred to me.

Since not every sub-sub-section of the book has its own file, unlike Zettel notes, I can't use a file name to create references between parts of the book.  Instead, I have to use some kind of label.  It comes to mind that a section's heading can be uses for links in the same document -- but in this drafting phase, the headings change too often, thus making the references either unstable or a pain to maintain.  

I need to manually add an invisible jump mark to solve this problem.  "To add a jump mark" means that I add an arbitrary line of text into the document which contains some kind of unique label.  Somewhere else I use that label again to create a reference back to the jump mark.  This is like jumping in an HTML document with the use of anchor links, like "go to top," or clickable table of contents in a PDF.  If you're a techie, you will find this is familiar to the [`GOTO` command][goto] of a BASIC programming language dialect, for example.  Sadly, when you write a text, there's no software which ensures you don't use the same textual label twice.  Unlike in programming, no one warns you about duplicate jump marks.  You have to worry about uniqueness yourself.

<%= insert_rel_image file: "201402272227_jumpmark.png", title: "jump mark title", caption: "Jump marks in a text as Markdown comments" %>

To realize labels which are stable and unique, I decided to take the flexible approach and add unique timestamp-based IDs to the sections.  They look just the same as Zettel note identifiers.  That's no problem: since I can only add text in one place at a time, the Zettel IDs don't get "used up;"  the time passes anyway.  There's no conflict of IDs in practice.

[goto]: https://en.wikipedia.org/wiki/Goto
[zkbook]: http://www.zettelkasten.de/book

### Identifiers become jump marks

The identifiers I use in the book manuscript are hidden.  Since I use [Markdown][], I can add HTML comments, `<!--like so-->`.  They don't show up in a preview, but they're visible to me when I'm working on the draft of the book.  Since these jump marks are of use to me only, I hide both the label definition and the reference from a potential reader in comments.  When I want to create usable hyperlinks in the PDF later on, I'll use visible Markdown-style links, of course.  The real, clickable links and my hidden references don't interfere with each other.

Another problem comes up, though: every time I add a lot of new stuff in a short period of time, the ID's usual accuracy to the minute doesn't suffice.  It's fine for _Zettel_ notes which almost always take more than a minute to write.  It's not precise enough for this use-case, so I have to create IDs with accuracy to the second, like `20140226093922`.

The two extra digits don't affect my _Zettel_ notes or anything else in my system.  `201402271349` and `20140227134930` overlap, for example:  both were created during the same minute.  It's unlikely that I create a _Zettel_ with an ID (which is precise to the minute), _and_ create a jump mark in a text with precision to the second of the same minute.  While there may be problems with overlapping IDs in theory, these problems don't occur to me in practice.

[markdown]: http://daringfireball.net/projects/markdown/

### How to get to the target of a jump mark

The short answer is:  manually.

To resolve the reference, I have to select the ID and copy & paste it into a search field to obtain the target.  There never was a more convenient mechanism in any app I ever used.  This is my personal hyperlink convention -- how could other people's software be tailored to such a case?  I'd love to just point and click on an ID to get to the referenced target.  I don't see this happening soon, though, and I'm fine with selecting text and pasting it in a search field.  So this jump mark business isn't making me any slower than how I always was.

I can search for the ID either system-wide, project-wide, or directly in my Zettelkasten note archive.

System wide search is a no-brainer on the Mac, thanks to Spotlight.  There is similar software for Linux and Windows, so everyone should be covered.  It's okay to default to system-wide search, but it'd be way faster if the ID-based link gave away where the target is.  It suffices to know whether a reference points either at the _Zettelkasten_ note archive or at some place in the current project -- if both aren't the case, then we have to search system wide, obviously.  Thus, we have to denote whether a link is an external link to the archive or an internal link to a jump mark in the project.

To limit search to a project is easy thanks to modern text editors.  [TextMate][] is my editor of choice:  it supports to search in all files of a folder.  This is perfect for writing projects, because every chapter has its own file, while all files share a common project folder.  Using a project-wide search, it becomes virtually irrelevant how you distribute your text across files.

From within this manuscript, I use the `§` glyph to denote that the target is in the project.  This is a special case.  I don't use the same glyph for links to the note archive.  That's because, for this writing project, I prefix references to my note archive with my initials, `ct:`.  There are also IDs prefixed with `sf:` to denote stuff my pal [Sascha][] has collected on the topic and sent to me.  If Sascha and I didn't collaborate on the note collection, though, I would've sticked to the already established convention:   use `§` for links to Zettelkasten notes and something else, maybe `§§`, for jump mark links.

* If the glyph before the ID is `§`, it's a jump mark reference.
* If the prefix is `ct:` instead, it's a reference to my _Zettelkasten_ note archive.
* In this special case, there's the `sf:` prefix to point an item in a folder full of Sascha's notes.
* Anything else would be a matter of a system-wide search.

Mission accomplished:  with this convention I'm certain what to do expect at any given moment.

[textmate]: http://macromates.com/
[sascha]: http://saschafast.de

## Use Auto-Expanding Snippets to Create IDs

I created text expansion snippets so that whenever I type `,,id`, these four characters are replaced with an ID.  There are tools for that, and chances are you already own one of them:

* For [TextExpander][], use `%Y%m%d%H%M%S`.
* For [Typinator][], use `{YYYY}{MM}{DD}{h024}{m}`.
* For [Keyboard Maestro][keymae], use `%ICUDateTime%yyyyMMddHHmmss%`.

If you don't own a text expansion application yet, try one of the above if you're on a Mac.  They really save a lot of time and typing.  If you run Windows, search for "textexpander for windows" on Google or follow [lifehacker's recommendation][1].

[1]: http://lifehacker.com/5844126/the-best-text-expansion-app-for-windows
[textexpander]: https://smilesoftware.com/TextExpander/
[typinator]: http://www.ergonis.com/products/typinator/
[keymae]: http://www.keyboardmaestro.com/

## Outlook

Let's say you wrote a Zettel note a year ago.  Today, you want to modify it and add a related detail.  It's possible to insert a new ID in the paragraph you have added to denote both the modification date and make in-document-links possible.

Try to come up with use cases where an ID could come in handy.  I use IDs for receipts; I use them to mark [Day One journal entries][dayone] I want to link to.  In fact, I use them everywhere I want to point at something in my system.  Sometimes, file paths aren't stable.  File names change.  Unique identifiers, on the other hand, don't.

Tell me where this might be useful in your workflow!

[dayone]: http://dayoneapp.com/

---
title: Using nvALT as a Zettel Note Archive
created_at: 2014-04-04 17:20:41 +0200
updated_at: 2014-07-11 09:20:00 +0200
kind: article
author: christian
tags: [ nv, software, review, mac ]
image: "201404041723_nv.png"
vgwort: http://vg08.met.vgwort.de/na/37717592bac84c1fa7340fe191b058d3
comments: on
toc: on
---

I want to start this series of reviews with a software I'm fairly familiar with.  While most things apply to the [Notational Velocity][nv] base application, I will talk about [nvALT][] exclusively in this review.  nvALT is a fork by [Brett Terpstra](http://brettterpstra.com/) and [David Halter](http://elasticthreads.tumblr.com/) of the original Notational Velocity, which was created by Zachary Schneirov, and a few [modifications by yours truly](/posts/2010/10/markdown-hud-nv/).  It's Open Source, free, and very popular.

I use nvALT since 2010, and I think it's the best product available to create and find notes quickly and to manage a lot of them.  I mean, really, a **LOT**, as in 3000 and counting.  This app is Mac only, sadly, but there are alternative implementations popping up which promise to work on every platform.

[nv]: http://notational.net
[nvalt]: http://brettterpstra.com/projects/nvalt/

## Enter nvALT

<%= insert_rel_image file: "201404031027_nvalt-overview.png", title: "nvALT", caption: "nvALT as it looks on my machine" %>

Looking at the picture above, nvALT has three elements I will refer to:

1. the "Search or Create" field,
2. the list of notes, filtered according to the search term,
3. the contents of a selected note, which is a text field you can write in to.

Initially, the app is in portrait mode, with a smallish font and a few example notes.  It looks pretty tasteless.  You can customize the font, colors, and even the width of the text area so you can use the application in full-screen mode on widescreen displays comfortably.

See Michael Schechter's [nvALT 101][nv101] for a general introduction and configuration tips.  I recommend you follow his setup steps to use a directory of plain text files instead of an arbitrary database.

Also, I suggest you put this note archive directory into your Dropbox folder so you can access your notes from other devices.

<%= insert_rel_image file: "201404041021_startup.png", title: "nvALT startup", caption: "This is how the app looks on first start" %>

[nv101]: http://bettermess.com/plain-text-primer-nvalt-101/

## Testing nvALT: the Four Criteria

As a reminder, the key elements I look at will be:

* **Note retrieval**: for example, how fast and easy is full-text search?
* **Note creation**: does it take many clicks or keystrokes to create a new _Zettel_ note?
* **Note connections**: which mechanisms does the app support to create connections?  
* **Data export**:  how does the application manage to get everything out without losing information?  How does it manage to get stuff in?

nvALT has a unique interface, as the "Search or Create" field is there to both search for existing notes and create new ones.  [Watch a video by lifehacker](https://www.youtube.com/watch?v=iKShuvEOiqA) to see the base app Notational Velocity in action and get a feel for the speed.

### Note Retrieval

When the "Search or Create" field is empty, the list of notes shows every note file in your whole archive directory.  If you enter anything into the "Search or Create" field, nvALT selects notes matching the criteria.  This search term matches on both the full text of the note and its title or file name.

Using the "Search or Create" field is the main way to interact with the application.

You can select the "Search or Create" field with &#x2318;+L.  That's the same shortcut for selecting the location bar in every web browser on a Mac, by the way.  You can navigate the filtered notes with the up (&uarr;) and down arrows (&darr;) or select one with the mouse.  When a note is selected, its content shows up to the right.

<%= insert_rel_image file: "201404041052_exnote.png", title: "note example", caption: "Example note in the one-size-fits-all format.", link: "/posts/2014/03/baseline-zettelkasten-software-reviews/" %>

In total, to select a note it takes only three steps: you hit &#x2318;+L, type in the search string, select the appropriate note with &uarr; or the mouse, and there you are.

How could it get any quicker?

I don't see potential to save clicks or keyboard hits here.  This is as fast as it can possibly get.  Also, note retrieval is instantaneous.  The application doesn't lag behind for even a millisecond.

nvALT watches the note archive directory, so when you modify the files in the folder, nvALT will know about the changes.  This is true both while nvALT is running and when you start it up after it was closed.

Essentially, nvALT is a real-time interface to a folder of files with which you can do anything you want.

### Note Creation

To create a new file, you just have to type anything into the "Search or Create" field and hit the return key &#x23CE; to create a new file.  It will be named after the string you entered into the "Search or Create" field.  Afterwards, the empty note will show up to the right and the text area will be selected immediately, so when you begin type anything, it will be added to the note directly.

Notes are saved automatically.  Virtually every keystroke is stored in the file instantaneously.  If the application or your computer crashes, you don't lose data.  

nvALT really shines here.  Creating notes is blazingly fast, as is note retrieval.  nvALT was designed to achieve this momentum.  You just have to hit &#x2318;+L, type in the name of the note you want to create, hit return &#x23CE;, then immediately write the note's contents -- no clicking necessary.

### Note Connections

nvALT supports wiki-link note connections.  To create links between notes, insert the note title in double brackets, like so: `[[Link Target]]`.

<%= insert_rel_image file: "201404031109_wikilinks.png", title: "wiki links", caption: "nvALT auto-completes a wiki link after I typed 's'. Apparently, there's only one file starting with the letter 's'." %>

nvALT sports a nice auto-completion feature.  After you type the opening double-brackets `[[`, nvALT will suggest existing note titles which start with the characters you type.  In my case, with 3100 files in the note archive, generating the list of suggestions is a bit slower than note retrieval.  The lag is conceivable but minuscule.

If the target doesn't exist, a note with the appropriate title will be created if you follow the link.  You can follow these links by &#x2318;-clicking on the text.  This is how wikis do.

<%= insert_rel_image file: "201404031117_useless.png", title: "completion box", caption: "If I knew the ID, auto-completion works fine. If I know the actual title only, I don't get any suggestions." %>

If you prepend numerical identifiers to the note titles like I do, this feature is useless in its current form, though.  Filtering the title suggestions is limited to match the exact characters at the beginning of a note's file name.  The suggestion box requires that the note starts with the characters you type, unlike filtering with the "Search or Create" field.  This is severely limiting, as I'd have to remember the note identifiers and start typing these to make use of the suggestion feature.  If the suggestion box would do a fuzzy search like the "Search or Create" field does, I could make use of this.  If you don't mind chronological order of notes, you can put the identifiers at the end of note file names to remedy this limitation.

I resort to a manual process instead:

1. I search for the link target which I know exists already.
2. I copy the contents from the "Search or Create" field, which is the file name, consisting of both the identifier and the title.
3. I go back to the note I was creating and paste the target's identifier and title.  I use [the "Q" trick][qq] to mark the note I was creating so I can get back to it fast.  I just put "qqq" into the note contents before I leave and search for references.  It works like leaving a finger between the pages while you look elsewhere in a book.

When I apply this process to a note in the [one-size-fits-all style][ex], I put the references in a list at the bottom of the note.

Afterwards, when I search for a linked note identifier, `201305031721` in this case, nvALT shows both the original note (matching the note's file name) and the connected note (matching the note's contents).  This isn't too bad a replacement for clickable links.

<%= insert_rel_image file: "201404031131_link.png", title: "link retrieval", caption: "Using the note retrieval feature to find link sources and targets.  Plain references are at the bottom." %>

Linking notes can't possibly get more raw than this.  Of course, to create the connections manually is a bit tedious.  Since note retrieval is so fast, though, it's easy to follow links later.

I really wish for a go-back function or a [breadcrumb navigation][bc] to make browsing and creating links easier.  This is something I will add some day when I have the time. Promise.  Then, I'll fix the link suggestion box, too.

[ex]: /posts/2014/03/baseline-zettelkasten-software-reviews/
[bc]: /posts/2010/11/mass-edit-notes/
[qq]: http://www.kungfugrippe.com/post/453204090/q-trick

### Data Import/Export

Since nvALT can store all notes in a plain old directory with plain old text files, these isn't much to export.  You have all the files available at your disposal all the time.

Importing a file is as easy as saving it into the note archive directory.

nvALT can export files to HTML, Microsoft Word, and Rich Text Files.  Using the Markdown preview, it can also export the preview output as HTML and PDF.  If you happen to use [Marked][], you can open note files in Marked with a keystroke and export from there.

[marked]: http://www.marked2app.com
    
## Additional Features

There's some more stuff to like:

* Rich Text support,
* custom URL scheme,
* keyboard shortcut to invoke the application,
* Simplenote synchronization,
* tagging.

### Rich Text

<%= insert_rel_image file: "201404041021_rtf.png", title: "RTF support" %>

Using [Rich Text][rtf] is totally possible.  You can embolden, italicize, underline, and strike-through text.  There's no way to change font sizes, though.

Wiki-style links are blue, underlined, and you can click on them directly in RTF mode.

[rtf]: http://en.wikipedia.org/wiki/Rich_Text_Format

### Custom URL Scheme

To create incoming links to notes from outside the app, you can use the URL Scheme of nvALT.

If you open `nvalt://find/foo` in a browser, for example, it will start nvALT if necessary and look for "foo" via the "Search or Create" field. 

It's possible to add incoming links to Zettel notes by using the identifier.  Sticking to the example from earlier, `nvalt://find/201305031721` will find my "CDN" note.  Assuming you keep using nvALT for life, these incoming links could be pretty stable over time.

In practice, I don't use these myself at all because I don't want to rely on app-specific features.  I just put the ID accompanied by my reference glyph into texts, like `§201305031721`.  When I see this pattern, it triggers "this is a Zettel note link" for me, and that's all I need to fire up nvALT and look for the note.  Obviously, I can't click on these, but also I don't have to rely on the application I'm writing in to support clickable hyperlinks at all.

### Keyboard shortcut

Speaking of "firing up nvALT":  you can set a keyboard shortcut to open the application.  When invoked this way, nvALT will focus the "Search or Create" field so you can look for a note or quickly create a new one as a scratchpad for ideas.

### Simplenote Synchronization

nvALT supports [Simplenote synchronization][simplenote], a popular note synchronization service.

Simplenote will provide a web interface to access your notes from your browser.  Also, it syncs to a lot of smartphone applications.  This way, you'll have your Zettel notes available on lots of devices.  Until you hit the mark of about 1000 notes.

Eventually your archive will grow too big for synchronizing reliably via Simplenote.  Maybe you'll be lucky and it takes a year or two until you hit that mark, so the people at Simplenote had a chance to fix the service to handle lots of files better.  

[simplenote]: http://simplenote.com/
            
### Markdown Support

<%= insert_rel_image file: "201404041054_exnotemmd.png", title: "example markdown note", caption: "MultiMarkdown note, with header and citation." %>

nvALT can deal with MultMarkdown and offers a preview function.  There are a bunch of [shortcuts to help with Markdown input][mmdsc].

While a note in the all-purpose format is perfectly readable in nvALT, a MultiMarkdown note is both human-readable _and_ sports a nice-looking HTML preview, with links to click on and everything.

The preview window of the MultiMarkdown example note looks like this:

<%= insert_rel_image file: "201404041056_preview.png", title: "HTML preview", caption: "HTML preview of the Markdown note" %>

From there, you can save the preview as HTML or generate a formatted print PDF.  That's not enough for a long piece of text, but it suffices to get a note on paper without all the asterisks and brackets.

**Update 2014-07-11:** The Markdown preview can include images. To [select images from a sub-folder of your note archive][nvimg], follow my recent instructions on how to set up nvALT and its preview template.


[nvimg]: /posts/2014/06/images-in-nvalt-notes/
[mmdsc]: http://brettterpstra.com/share/nvalt2.2b94.html#markdownauto-completionsyntaxtricks

### Tagging

<%= insert_rel_image file: "201404041152_tags.png", title: "tags", caption: "The note's tags added as metadata to the file." %>

[OpenMeta tagging][tags] is supported, and I wouldn't be surprised if support for Mavericks tags was on its way.  The tags field appears and becomes editable when you hit &#x2318;+T.  Tags show up in the note list as small blue tokens.

Again, I don't use the tagging feature because I don't trust custom file meta data.  Instead, I rely on `#hastags` in the note content itself.  Eddie Smith [explains this][201404041727] in more detail.

[tags]: https://code.google.com/p/openmeta/
[201404041727]: http://www.practicallyefficient.com/2010/11/05/notational-velocity-tagging-without-the-tag-field/

## Alternative Applications

There are software alternatives which work with text files in a similar fashion.  I personally know about these:

* NVim (platform independent), a Vim plugin
* nvpy (platform independent), which isn't quite stable, yet
* ResophNotes (Windows only), which is a Simplenote-centered clone of nvALT

The website [alternativeTo.net has other suggestions](http://alternativeto.net/software/nvalt/) which I mostly haven't used myself.  Please leave a comment if you can recommend one of these.

## Conclusion

nvALT's fast note creation and retrieval got me hooked years ago and it didn't wear off.  The application didn't slow down even a bit when my archive grew to 3000 notes.  I know that ResophNotes coughed heavily at 1000 notes when I tried it.

The possibility to use Dropbox to synchronize the folder of note files lets you read and write notes from your smartphone or tablet or another computer.  Theoretically, at least: I didn't find a note-taking application for iPhones which can reliably cope with the my load of note files.  It's super-flexible this way -- just as flexible as storing text files on your computer can get, since nvALT doesn't do a lot more than that.

nvALT is, essentially, just a special kind of text editor.  It works with files in a single folder, and this allows you to do everything you want with the note files from outside the application.  nvALT is an interface to a small part of the file system.  Also, it's Open Source, so there's no [vendor lock-in effect.][lockin]  I like to have this kind of flexibility.

Since I use this application so much, I tweaked it a bit over time.  To show and explain all these customizations will get pretty lengthy, and I don't want to water-down this review, so I leave my customizations for a future post.

**Go [grab nvALT][nvalt]!**

So tell me ...

* What could you use the `nvalt://find/` URL scheme for?
* There are strong arguments for using plain text files. I wonder: what would prevent you from using nvALT?
* As this is the first review of this kind, what would you like me to include here?  Videos?  More pictures? Specific details?

[lockin]: http://en.wikipedia.org/wiki/Vendor_lock-in
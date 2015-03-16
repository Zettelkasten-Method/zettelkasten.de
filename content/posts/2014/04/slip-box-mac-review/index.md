---
title: SlipBox (Mac) Note Archive Review 
created_at: 2014-04-22 09:51:53 +0200
kind: article
author: christian
tags: [ software, mac ]
image: 201404240921_slipbox.png
vgwort: http://vg08.met.vgwort.de/na/aee9adfa0a334a94a5537b688428cf2e
comments: on
toc: on
---

[_SlipBox_][slipbox] is a Mac-only application with iPad/iPhone companion apps to manage a note archive. When I found out about the app, I was curious about its ability to traverse a organically growing, tree-like ontology of keywords.  That's the app's killer feature.  _SlipBox_ didn't disappoint, but I come to the conclusion that it is best suited for project-based note databases.

I used the current version 0.9.7, which indicates that the software isn't finished, yet.  I already reported a few obvious bugs I found and you should, too: we developers need every feedback we can get to make applications better. Development has [slowed down pretty much to a halt][devsp], though, but maybe that's only temporarily.

_SlipBox_ is free Mac OS software, written by [Markus Guhe](http://markusguhe.net/) of _Tabi Software_.  He doesn't get a penny from the Mac app itself. The only revenue he gets is from a universal iPhone/iPad companion app, [SlipBox mobile](https://itunes.apple.com/us/app/slipbox/id399522477?mt=8&uo=4&at=11lxCd), and from [List Box](https://itunes.apple.com/us/app/listbox/id410030332?mt=8&uo=4&at=11lxCd), a plain-text list-making app with Dropbox sync.[^aff]

  [^aff]: Affiliate links; I get a small kickback from the vendor if you buy from my link but it won't cost you anything.

_SlipBox_ has a few peculiarities to keep in mind during the review.

* The first line of every note becomes its title.
* A note is called a "slip", and a note database is a "slip box". You can open many slip boxes at the same time.
* Related notes are found via "slip scent".  The strength of a scent is based on keyword similarity.

[slipbox]: http://markusguhe.net/slipbox/
[devsp]: http://tabi-software.com/slipbox/forum/viewtopic.php?f=1&t=574&sid=fb448715cce1569286c2ad767a8e5dba

## Criteria

Recall [the review criteria][baseline]:

* **Note retrieval**: for example, how fast and easy is full-text search?
* **Note creation**: does it take many clicks or keystrokes to create a new _Zettel_ note?
* **Note connections**: which mechanisms does the app support to create connections?  
* **Data export**:  how does the application manage to get everything out without losing information?  How does it manage to get stuff in?

I started with importing all my old notes to see what _SlipBox_ does with a large database. To better reflect how I discovered this application's features, I will write about the review criteria in a different order this time.

[baseline]: /posts/2014/03/baseline-zettelkasten-software-reviews/

### Data Import/Export

_SlipBox_ stores the notes in a proprietary `.slipbox` database file.  TextMate tells me it's some kind of binary [property list](http://en.wikipedia.org/wiki/Property_list) -- anyway, you're not supposed to have access to the database itself.

You can import from a few file types.  I tried `.txt` and `.rtf` and both worked fine.  `.md` or `.markdown` files are rejected, though, so I prepared my _Zettelkasten_ note archive duplicate by changing all the file extensions.

To rename all the `.md` files in a folder, I used this shell command:
<code>for f in *.md; do mv -- "$f" "`basename -- "$f" .md`".txt; done;</code>

Importing all files from a folder worked great and was pretty quick. [OpenMeta tags][omt] are supported, but not during importing notes it seems. The keyword metadata remain empty.

<%= insert_rel_image file: "201404170930_export.png", title: "export dialog", caption: "SlipBox export options" %>

There are some options for exporting.  Exporting the whole database as single plain text files worked great.  Instead of using the slip ID as file name, you can use the note title instead.  If you adhere to the minimal note layout with _Zettel_ identifier and title in the first line of the note, exporting results in a folder where the file names turn out to be pretty useful, ordered by ID.

<%= insert_rel_image file: "201404170944_rtfex.png", title: "rtf export", caption: "Rich text export of a single slip note" %>

The resulting note files include the slip ID at the top and a list of keywords and related slips in the back matter at the bottom.  When you export to RTF, the backmatter is set in a monospaced font and the slip ID is set in bigger and bold font.

Overall, the app seems to do its best to give you control over your data, given the circumstances.  Remember that the database itself isn't accessible, so you just can't get stuff out without the help of the software.  Imagine the latest OS X update breaks compatibility with the app and you can't get to your precious notes.  Then you're screwed.  Doing a periodic export as backup could help, and I strongly advise that you do so if you work with this or similar software.

There's no input format to make _SlipBox_ recognize pieces of data when you import files, it seems. The format of exported files certainly isn't it.  If you export your database to a folder full of files, then re-importing them into a new database will not recover any metadata.  The old slip IDs are lost; Keyword lists won't be parsed and added to the resulting slips; you will will recover sources nor the slip title.  If you leave the app and delete the database, you won't be able to come back easily.

[omt]: https://code.google.com/p/openmeta/

### Note Retrieval

_SlipBox_ supports full-text, both system-wide via Spotlight and from within the application.  That's nice to keep the notes accessible.

Depending on the interval from the settings, the app periodically creates a Spotlight index of all the notes.  Although you're locked out of the proprietary `.slipbox` database format otherwise, you can access its contents via Spotlight this way.  During the process of re-generating the index, it's not possible to use the software, though.  In my case, it took about 3 seconds to generate the index, so I experienced a noticeable interruption.  I'd rather the app did this as a background process to get out of my way. Maybe this is one of the pre-v1.0 quirks.

<%= insert_rel_image file: "201404170859_search.png", title: "search view", caption: "The search view reminds me of Notational Velocity in its vertical mode" %>
    
The application has its own search window. At first, it shows keywords and slip ID only. You can enable to show the note title via the application menu, _View > Result Table Columns > Title_.  I think this should be the default, because tags and slip number don't suffice to identify a note.  Turns out that the first line of a note becomes the title.  That's great, because this way the one-size-fits-all plain text note style fits in nicely, where _Zettel_ ID and title occupy the first line.

Using the search function is not instantaneous, but it's pretty fast on my machine.  Since it does lag a tiny fraction of a second, though, I guess the application doesn't keep an optimized search index of the notes.  In the worst case, this means that _SlipBox_ is looking through every note in the database;  I can't tell anything for sure, though, so I asked a [question on the forums][searchlag] to clarify.  It seems that file access times become the bottleneck.  Since my computer has a Solid-State Drive, which sure is pretty fast, the performance may be worse using a conventional hard disk. 

When you built up relationships between notes via keyword similarity, the "Suggest Slip" function pulls up a related note from the database with a strong "slip scent".  This sounds like a useful feature to help you explore your knowledge on a topic with lots of _Zettel_ notes.  Getting started with pulling out stuff you know about a topic usually takes some time since you have to re-read old notes and follow trails.  "Suggest Slip" promises to help you follow trails.

Keep in mind that the information scent is computed based on keyword similarity.  Direct links don't count, so you could miss fertile trails if you relied upon the keyword-based "Suggest Slip" function alone.  Direct links create the strongest connections and sometimes yield the most surprising results.

[searchlag]: http://tabi-software.com/slipbox/forum/viewtopic.php?f=1&t=578&sid=c4e7b2de25347eba2f65fbf810d64353

### Note Creation

<%= insert_rel_image file: "201404170908_rtf.png", title: "rich text notes", caption: "Rich text features of the note editor" %>

Slips are rich-text notes, so you can embolden and italicize.

The first line of the note is treated as the title.  I only found out because that's what is shown in the search preview and the slip scent view.

_SlipBox_ takes care of assigning numerical identifier to your notes. It increments automatically.  If the last note is, say, #1000 and you delete it, the next note you create becomes #1001.  There won't be any duplicates and an ID will never be used twice per database.

The application can open more than one note database or slip box at once, so the identifiers aren't unique system-wide, but only relative to the database you're working in. [I argue][identity] that system-wide identity is important, so this doesn't do the trick for me.

I can see that local identity will suffice for per-project note archives, though.  This would be a _Zettelkasten_ light, if you will.  _SlipBox_ allows you to organize notes for your next big writing project without affecting notes of other areas of your life.

The _Zettelkasten_ method I describe, on the other hand, is ultimately attempting to [extend your brain][ext].  This is a global effort:  _all of your knowledge_ from now on until the end of your life should be archived and connected.

I can see that having multiple slip boxes provides a clean and sometimes desired boundary, but to really learn something new over the course of the years, you'll have to allow your various endeavors to affect one another.


[identity]: /posts/2014/02/add-identity/
[ext]: /posts/2013/11/extend-your-mind-and-memory-with-a-zettelkasten/

### Note Connections

This is where _SlipBox_'s unique features unveil. It sports so-called "information scents", which come in two flavors:

1. **Keyword Scents**, where you can either explore related keywords in a tree view directly or show the notes to which the keyword is assigned.  The help defines this term as follows:

    > There exists an information scent between two keywords if there is at least one slip on which they occur together. The more slips the keywords co-occur on the stronger the scent.

    <%= insert_rel_image file: "201404170850_related.png", title: "slip scent in the sidebar", caption: "Slip scents show up in the sidebar" %>
2. **Slip Scents**, where similarly tagged notes are listed in the right-hand column of the note view.  According to the help:
    
    > There exists an information scent a from one slip to another another one if the two slips share at least one keyword. The more keywords are shared by the slips the stronger the scent.


<%= insert_rel_image file: "201404170902_kwscent1.png", title: "keyword scent view", caption: "I think the keyword scents are useful if you enable to hide duplicates so you don't go in circles.  This way, you can explore keyword relationships and see the keyword ontology you created over time." %>

<%= insert_rel_image file: "201404170905_kwscent2.png", title: "alternate keyword scent view", caption: "The alternate keyword scent view shows tagged slip titles" %>

There's an alternate view which not only shows the keywords but related slips and their titles when you explore the path of a keyword scent. Whereas the default keyword scent view provides an overview of your tags, devoid of any details, this alternate view lets you dive into notes and fully explore keyword trails.  That's something I'd like to use more often to see if it proves to be as useful as I imagine.

_SlipBox_ supports direct links between notes which you can click on.  You can create links by the use of a menu item or with the ⌘⌥L shortcut.  There is no toolbar support for this function at the moment.  The app asks for the slip ID of the target, so you have to pick the link target first, make note of its ID, and return to where you want to place the link.  All in all, that's not unlike what I have to do to create links in nvALT.  Of course, a search would be nice, or a title-based filter, or anything else which doesn't require that I remember the slip ID.

Direct links between slips are useful to go from one note to another with a click. To make a lasting connection, though, you still have to keep track of the target's _Zettel_ identifier. Otherwise, you tie yourself to the program and won't get everlasting connections: If you export a slip as plain text, direct links are simply lost. RTF files retain the link, though.  It seems to be of the format `slipbox://<<SLIP>>.self`, while `<<SLIP>>` is a placeholder for the slip identifier.  These links kind of work from outside _SlipBox_, but all they do is bringing the app to the front.  They don't show the slip with the corresponding ID.

The real bummer is: you can't search for expressions like "all slips containing a link to slip #300".  There's no way to find out which other notes link to a specific slip.  Without traversing connections backward, you can follow information trails in only one direction.  Maybe good use of keywords can make up for this lack in search, but direct links are pretty much useless still.


## Additional Features

There are useful features to tend to your archive, like renaming keywords in all slips or removing duplicate notes.

Then there's split and merge.  The split function takes whatever comes after the position of your caret in the text and moves it to a new note, preserving keywords and source information.  The merge function puts the contents of another note into the current one, deleting the other note.

Merging requests the the slip ID of the note you want to merge into the current one, just as the "Link slip" function does.  When the other note is merged into the current slip, _SlipBox_ adds big and bold text at the seam.

<%= insert_rel_image file: "201404170919_splitmerge.png", title: "merged note", caption: "A merged slip gets a big note at the seam. Also, keywords duplicate" %>

In my review version v0.9.7, merging [duplicates the keywords](http://tabi-software.com/slipbox/forum/viewtopic.php?f=2&t=579&sid=c4e7b2de25347eba2f65fbf810d64353), and the old slip ID still [shows up under slip scents](http://tabi-software.com/slipbox/forum/viewtopic.php?f=2&t=580&sid=c4e7b2de25347eba2f65fbf810d64353).  I reported both bugs already.

I think the split function is really useful.  When I read a book and [create _Zettel_ from its paper notes][takenote], I often end up with long note drafts which I have to rearrange and then cut into pieces.  To split the note and preserve both common keywords and the source information can be a huge time-saver for the mechanic and repetitive task of copying & pasting metadata.

[takenote]: /posts/2013/09/create-zettel-from-reading-notes

### iOS App

The developer of _SlipBox_ released an iPhone and iPad companion application.  It looks feature complete, and judging from the free trial version, the app does its job.

Most note taking apps choke or even freeze when they have to deal with my 3000+ note files.  I can't say how well _SlipBox_ for iOS performs, though, because you need to buy the full version to load an archive with more than 20 notes.    The full version comes at USD&nbsp;8.99.  Given that the app isn't under active development at the moment, that doesn't sound very attractive for the cause of taking a peek.  I think it's a reasonable price for a feature-complete second brain, though.

Tell me in the comments if you insist I spend some bucks on the iOS app to expand this review and to give Markus a monetary motivation, and [consider a small donation.][donate] Please note the cause "SlipBox iOS app" or similar in the donation form.

[donate]: /donate

### Plug-in System

There are plug-ins for _SlipBox_ to extend the app's behavior.  Plug-ins are way more than simple AppleScripts.  You'd have to program and compile plug-ins for the app, but there's no code library to do so at the moment.  Every available plug-in was probably written by Markus Guhe, the developer of _SlipBox_.

The list of default plug-ins is as follows:

* BibDesk, to integrate with the reference manager
* Bookendz
* Graphviz, to visualize information scents
* Keyword Extraction, to override the list of keywords with automatically generated keywords.[^kw]
* Simple Spotlight Interface
* Skim
* Slip Text Similarity
* Summarization OS X Interface

[^kw]: In case of my example note on Benjamin Franklin, the result was "notes, original, 2004, write, Franklin".

There are far too many specific features to tackle all of them here.  There are two I want to talk about, though:  the BibDesk and Skim plug-in.

### BibDesk Plug-In

<%= insert_rel_image file: "201404220846_bdesk.png", title: "autocompleting bibdesk sources", caption: "The auto-completion uses cite-keys from my BibDesk reference database, shown in the background" %>

[BibDesk][] is [my favorite reference manager][refman], and it's Open Source. _SlipBox_'s plug-in appears to be handy for completing references.

Every slip has a field to specify references, called "Source".  The plugin uses the contents of this field to provide auto-completion of full references. The BibDesk auto-completion works if you enter only one cite key into the source field, so I guess that's what you're supposed to do.

<%= insert_rel_image file: "201404220849_bd-one.png", title: "auto-completing one source", caption: "Suggesting known sources for the second entry (without use of BibDesk)" %>

<%= insert_rel_image file: "201404220850_bd-both.png", title: "auto-completing a composite source", caption: "Suggesting the array of two known sources (without use of BibDesk)" %>

The whole "Source" field is treated as one item, it seems.  When you type into the source field, SlipBox suggests already used source cite keys.  You're able to separate different sources by space characters.  Next time around, though, it will suggest all of another field's known contents instead of recognizing single cite key components.


[bibdesk]: http://bibdesk.sourceforge.net/
[refman]: /posts/2013/10/bibliography-zettelkasten/

### Skim Plug-In

[Skim][] is a free PDF reader with useful annotation features.  It's designed for the work with scientific papers.

In Slip box, you can extract Skim notes from PDF files into slips.  If you start with an annotated PDF, this is a good start to get all the quotes and your notes out automatically and start from there.  Skim stores the text you select and highlight as the annotations textual content, so upon exporting you get all the quoted text.

I suggest you take a look at Skim if you do any serious PDF reading on your Mac. Did I mention that BibDesk integrates with Skim as well, and that the two of them can probably replace your old, costly reference manager with integrated PDF viewer?

[skim]: http://skim-app.sourceforge.net/


## Conclusion

The application can open multiple databases at once.  Since the application also assigns numerical IDs to every slip, it is suited for smaller, project-based note archives very well.  I think I will suggest this app to a friend who ponders how to organize ideas, plots, and character sketches of a novel.  I can imagine that **_SlipBox_ works well for project-based note archives.**  It doesn't fare well as a second brain.

Working with notes is pretty straightforward.  Thankfully, there are lots of keyboard shortcuts which make using the app easy. Notes contain essential metadata and the databases integrate with Spotlight search, thus making notes accessible to the whole operating system.  However, I'm worried that file access times from within the app could become the bottleneck of note retrieval as the archive grows.

The "scent" feature is great.  I always wanted to display note relationships in [a network-like visualization](http://www.thebrain.com/) and be able to traverse paths this way to discover my own web of knowledge.  To have the tree of slip scents comes pretty close.

Once the user doesn't have to worry about slip IDs any more to create direct links, these connections may become more useful.  Same is true for the sidebar, where related slips show. I can't do anything with the IDs alone.

A _Zettelkasten_ note archive needs connections to make [its magic][ext] happen.  _SlipBox_ provides a lot of good stuff, but its information scent feature is centered around keywords only. It lacks the ability to take direct connections into account.  Since you can't seem to search for note links themselves, it's impossible to traverse links backward out of the box.  Essentially, _SlipBox_ doesn't do anything with the feature to create direct connections.

_SlipBox_ is centered around keywords.  It provides some unique features to work with them, and I think this is enough to create a useful archive of primary texts, like ideas for your next fiction book.  It doesn't suffice to create a full-blown _Zettelkasten_ note archive, though.

**Now go and [give _SlipBox_ a shot][slipbox]** and see for yourself if it might become a useful supplement in your toolbox.

Tell me in the comments:

* How could you benefit from having both an all-encompassing _Zettelkasten_ note archive and a project-specific, short-term database?
* What criteria do you want me to cover in future reviews?

[nvrev]: /posts/2014/04/nvalt-zettelkasten-implementation/
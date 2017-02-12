---
title: Baseline for Zettelkasten Software Reviews
created_at: 2014-03-29 11:12:19 +0100
updated_at: 2017-02-12 11:22:00 +0100
author: christian
kind: article
tags: [ software, review ]
image: "201403291237_gear.jpg"
vgwort: http://vg08.met.vgwort.de/na/a490d108a158425eba51059bf4471994
toc: on
import:
    from: "http://christiantietze.de/posts/2014/03/baseline-zettelkasten-software-reviews/"
---

I'm going to take a close look at applications to find out which are suitable to implement the _Zettelkasten_ note archive.  I already talked about [reference managers][refman].  While reference managers can be switched pretty easily, migrating a database of notes is far from being a trivial task, depending on the software you used in the past.  Therefore, we have to chose how to implement the note archive with great care.  Here you'll find my criteria.

In the comments, you can [contribute to this list.](#contribute-what-s-your-suggestion)

[refman]: /posts/bibliography-zettelkasten/

## Criteria I Will Consider

First, we'll see what the bare minimum features are.  What does any note archive software has to achieve to be useful?

To find out, recall the essentials you have to adhere to when you want to create a _Zettelkasten_ to be your [second brain][ext]:

1. **Use hyper-textual notes:**  Notes should both link to one another directly to create a web and use keywords to form clusters with indirect relationships.
2. **Write a lot:**  Feed your _Zettelkasten_ and make it grow.  With time you will be surprised by the wealth and interconnectedness of information.  There's an estimate threshold which people assume to be at around 1000 notes.  After that, your information retrieval will change.

[ext]: /posts/extend-your-mind-and-memory-with-a-zettelkasten/

There should be no obstacles when it comes to writing notes.  The software has to make it effortless to add new notes and to connect them.  To get knowledge out of the _Zettelkasten_, it has to be fast at retrieving notes, too.  When these tasks were slow, you probably wouldn't use the note archive enough.

The key elements I look at will be:

* **Note retrieval**: for example, how fast and easy is full-text search?
* **Note creation**: does it take many clicks or keystrokes to create a new _Zettel_ note?
* **Note connections**: which mechanisms does the app support to create connections?  I'm leaving this point pretty vague intentionally.  I know of various ways different applications deal with this problem.  Also, I'm going to cheat a bit:  if full-text search works, manually linking notes will work, too:  just put the target's identifier somewhere, copy it, search for the identifier, and open the resulting note. 
* **Data export**:  nobody wants to be locked into a [data silo][silo].  How does the application manage to get everything out without losing information?  How does it manage to get stuff in?

Every software has its own features and limitations, of course.  Wiki-like software makes linking painless, while others provide sophisticated search mechanisms.  I will evaluate these individual properties too, of course, but only in respect to their usefulness for managing a _Zettelkasten_ note archive.

So how will notes look like?  How will I compare?

At first, let's pretend that there's no such thing as [rich text][rtf].  Some editors will support emboldening and italicizing of text like Microsoft Word does.  Some will even support links to other notes you can click on.  I consider these things interesting, but not mandatory.

Instead of searching for the perfect app for an ideal note, we should focus on the content and the data, the note text and the note's attributes.  After all, the _Zettelkasten_ method works with paper, so why worry about the latest fad in computing?  I think it's more suitable to begin with the lowest hurdle possible, see which applications outreach the expectations, then allow to be surprised.

[silo]: http://en.wikipedia.org/wiki/Information_silo
[rtf]: http://en.wikipedia.org/wiki/Rich_Text_Format

## The Bare Minimum of a _Zettel_ Note

Every note consists of various parts:  it needs to have an [identifier][id], it needs to have body text or content, and it may have some front matter and back matter.

To ensure that you and I talk about the same stuff when we use these terms, take a look at this example note of mine called `201105160958 Improve the structure of essays by rewriting`:

<%= insert_rel_image file: "201403291138_example.png", title: "example note", caption: "Example note, partitioned" %>

In this example, the note is partitioned as follows:

* The **identifier** is `201105160958` and it's stored in the file name.  Also, I can reconstruct the ID from the date in the front matter.
* Obviously, the **body text** consists of the first introductory paragraph and the following list.  I don't consider the web link to be part of the content in this case.  Note that in the body text I have put the hash-tag `#Zettelkasten` inline, just as you do on Twitter, for example.
* The **front matter**, called **header** in this case since it's contained at the top of the note itself, is about metadata like the creation date;  in my case, it even hold a list of tags.  Like I said, you could put the tags in the running text, too.  This is just my personal preference.
    
        Title:      Improve the structure of essays by rewriting
        Date:       2011-05-16 09:58:57
        Keywords:   #writing #essay #practice

* The **back matter** should contain references, and it may include a dedicated list of links on the same topic if you want to add those.  In my case, the definition of citations contains a link to my reference manager [BibDesk][].
        
        Cf. <http://www.earlyamerica.com/lives/franklin/chapt1/>

        [#isaacson2004bf]: Walter Isaacson (2004):  
        _[Benjamin Franklin. An American Life](x-bdsk://isaacson2004bf)_, 
        New York and London and Toronto and Sydney: 
        Simon and Schuster Paperbacks.
        

As you see, I use plain-text notes.  The syntax or "language" I use to format notes and add references is called [MultiMarkdown][mmd].  This isn't mandatory;  I only tell you so you know which particular details I settled on.

Now that we've taken a look at the example, we can strip away my personal twists on saving notes and focus on the essentials.

I want to establish an all-purpose note layout as a baseline in a way that every text editing software on this planet can cope with it.  

[mmd]: http://fletcherpenney.net/multimarkdown/
[bibdesk]: http://bibdesk.sourceforge.net/

### The all-purpose, one-size-fits-all note

This one is suitable for every editor which supports saving text.

The body text or content dominates. Citations work as they do in print:  you put "(Author YEAR)" in the appropriate places and append a readable list of references in the back matter.  I put tags into the back matter as well so they get out of the way when reading the note;  the topmost lines are precious screen real estate I don't like to waste.

This is a viable example:
            
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

This is perfectly readable in every application which can display text.

Instead of using asterisks (`*`) to denote list items, I can imagine using rich text editing features to add real list markup, depending on the software we'll be looking at.  When there's no rich text available, asterisks work fine for me.

Here's two example pictures, one in a plain text editor, one in a rich text editor:

<%= insert_rel_image file: "201403291127_plaintext.png", title: "plain text", caption: "View in a plain text editor" %>
<%= insert_rel_image file: "201403291128_rtf.png", title: "rich text", caption: "View in a rich text editor with some formatting" %>

### Going plain text with MultiMarkdown

We've seen the usage of MultiMarkdown already when I showcased my own note.  I use a text editor which is Markdown-aware and gives me some visual sugar to improve scannability.  Visual aids are all rich text is about in the end.  Just compare how the same note looks with and without Markdown-specific coloring:

<%= insert_rel_image file: "201403291146_compare.png", title: "comparison of syntax highlighting", caption: "Markdown syntax highlighting enabled and disabled" %>

[Plain text has its benefits][plaintext], especially when it comes to longevity:  while every other file format might go out of fashion at some future time, plain text will likely stay.

On the other hand, [one could say][word] that as long as Microsoft exists, there'll be a Microsoft Word.  If Microsoft as a company outlives us, then we're going to be able to rely on `.doc` files for our entire lifetime.  Vendor lock-in is only a problem when the company stops to support the application -- but that seems unlikely in the case of Word:

> So yes, \[plain text\] should last forever. But I think Word -- like jpeg for photos -- is going to be around for a very long time too. And it's worth remembering that for writers these are intermediate formats -- in the end you wind up as digital media, whether it's Kindle, mobi, epub or whatever, all of them capable of being reverse engineered. The chances of being lost are, it seems to me, are extraordinarily remote.
> ([David Hewson][word])

When you use a plain text markup language like Markdown (or the MultiMarkdown flavor), you have a common standard to transform your text notes into something else, like PDFs for example.

I discovered MultiMarkdown because it is built into [Scrivener][].  It supports metadata in the front matter or header which doesn't show in [HTML previews][nvprev] and exports to LaTeX nicely.  Nowadays, there's other means to get this feature, enabled by the popular Pandoc document converter.

[plaintext]: http://www.christopher-mayo.com/?p=14
[word]: http://davidhewson.com/2013/12/28/does-markdown-mean-your-work-will-live-forever/
[scrivener]: http://literatureandlatte.com/scrivener.php
[nvprev]: /posts/multi-markup-notational-velocity/

### Going plain text with Pandoc

While I am a plain text aficionado, MultiMarkdown is not a flavor for everyone.  [Pandoc][] is a popular conversion tool to create Word `.doc` files or PDFs from plain text input, even MultiMarkdown files.  Transforming to nearly every possible format on earth useful for sharing documents with mere mortals.

If you are fond of Markdown but don't like MultiMarkdown's peculiarities, you can rely on Pandoc's markup language support for conversion and utilize its all-purpose metadata format.  The metadata is embedded in a different markup language called [YAML][].  The front matter of my example note from above would look like this in YAML:

    title:      Improve the structure of essays by rewriting
    date:       2011-05-16 09:58:57 +2
    keywords:   [#writing, #essay, #practice]

Not much has changed.  This is a self-contained YAML document.  The nice thing about YAML is, though, that you can _embed_ them into every text file if you put a line with three dashes (`---`) above and below the YAML content.

Here's an example note with the full bibliography reference put in YAML front matter:

    ---
    title:      Improve the structure of essays by rewriting
    date:       2011-05-16 09:58:57
    keywords:   [#writing, #essay, #practice]
    references:
    -   id: isaacson2004bf
        title: Benjamin Franklin. An American Life
        author:
        - family: Isaacson
          given: Walter
        year: 2004
        location: New York and London and Toronto and Sydney
        publisher: Simon and Schuster Paperbacks
        type: book
    ---
    
    Benjamin Franklin improved his writing skill by re-writing other author's articles:[@isaacson2004bf p. 28]

    *   Take notes when reading on single scraps of paper. 
        (Like in the reading workflow for a #Zettelkasten)
    *   Shuffle the notes sometimes
    *   When the original content is forgotten, write an essay based on your notes
        and compare to the original
    *   Sometimes try to write in verse instead

    Cf. <http://www.earlyamerica.com/lives/franklin/chapt1/>

With Pandoc, you can create a PDF from this note with a real bibliography at the end because all the information is contained in the reference list of the YAML front matter.  Alternatively, you can attach a BibTeX file with all the reference information.  As I said, I like to preserve space at the top of the note, so this is the path I'd chose.

I think notes should be self-contained.  If you don't add the verbose reference information in the YAML front matter but use a BibTeX file instead, I recommend you put at least a basic textual representation of the reference in the note file just in case.  This representation could look like the one I used in the one-size-fits-all example:  `Walter Isaacson (2004):  Benjamin Franklin. An American Life, New York and London and Toronto and Sydney: Simon and Schuster Paperbacks.`

[pandoc]: http://johnmacfarlane.net/pandoc/

## Software I (Want to) Look at

<%= insert_teaser_image title: "gears", caption: %Q{Photo Credit: <a href="http://www.flickr.com/photos/37256969@N08/8649462824/">nic_r</a> via <a href="http://compfight.com">Compfight</a> <a href="https://creativecommons.org/licenses/by-sa/2.0/">cc</a>
}, link: "https://www.flickr.com/photos/37256969@N08/8649462824/" %>

This is a running list of applications I want to look at.  I'm going to update this list over time and as your suggestions come in.  Also, I'm going to link to reviews from here as soon as they're done.

The current list of application candidates, in alphabetical order:

* Bear (Mac)
* Clibu (Web-based, platform independent)
* ConnectedText (Windows)
* [DEVONthink](http://zettelkasten.de/posts/devonthink-zettelkasten-review/) (Mac)
* Evernote (platform independent)
* Emacs org mode + Deft (platform independent)
* MacJournal
* [Notational Velocity and nvALT](/posts/nvalt-zettelkasten-implementation/) (Mac)
* [One Note](/posts/one-note-review/) (PC, Mac, even mobile)
* PiggyDB (Java, platform independent)
* P.S. Notes (Linux, Ubuntu)
* ResophNotes (Windows)
* [SlipBox](/posts/slip-box-mac-review/) (Mac)
* Tinderbox (Mac)
* [Trello](/posts/trello-zettelkasten-implementation/) (web)
* WikidPad (platform independent)
* VoodooPad (Mac)
* vim as NVim (platform independent)
* Zkn&sup3; (platform independent)
* and a paper-based Zettelkasten

I currently don't have a Windows machine at my disposal.  If you would like to help out with testing, just [drop me a line][contact].

## Contribute: What's Your Suggestion?

So here's your call to action.  Participate in the comments below:

* Which criteria for testing would you like me to add?
* Which software would you like to add to the list?

[id]: /posts/add-identity/
[yaml]: http://en.wikipedia.org/wiki/YAML
[contact]: /about/
---
title: OneNote Review
created_at: 2015-12-16 11:17:02 +0100
updated_at: 2019-11-20 11:41:30 +0100
kind: article
author: "Peter Buyze"
tags: [ onenote, archive, review, tool ]
image: 201512161116_one-note-screenshot.png
toc: on
---

*Today DutchPete, one of the most avid commenters on this blog, will help us fill the gap in software reviews for Windows by talking about OneNote as a Zettelkasten note archive. OneNote is part of the Microsoft Office family and thus available for a lot of different platforms, too, so this is not strictly speaking a PC-centered review. Now let's see which conventions and techniques make DutchPete productive.*

---

Early this year I decided to change my default note-taking app from Evernote to
OneNote 2013. Much to my surprise OneNote surpassed my expectations, so a next
step I wanted to take was to give OneNote a try as a Zettelkasten app too.

I will discuss the subjects shown below. There will be some Aside comments which
are not specific to OneNote but relate to an aspect of the Zettelkasten. I have
also expressed my own views and preferences in this review.

<%= insert_teaser_image title: "onenote screenshot", caption: %{OneNote in its full glory} %>

## The Template

My starting point was to design a standard layout for the notes that I would be
storing in it, bearing in mind that those notes only relate to literature I
read, be that a book or online philosophical material. So a note about a
telephone conversation or about internet security or any other such like will
not go into my Zettelkasten. A standard layout, a template, shows the essential
info that needs to be collected, and it allows easier reading afterwards.

### Types of Notes

Having used my Zettelkasten for more than a year, and having followed/been
involved in various discussions about the Zettelkasten, I have come to the
conclusion that Zettel & Folgezettel (i.e. a sequence of a Parent note and Child
notes) works well for me. I have therefore incorporated that in my template.

Christian gave a good & simple presentation in one of his [recent post about the
relationship:](</posts/kinds-of-ties/>)

<%= insert_image file: "folgezettel.png", title: "folgezettel", caption: %{Folgezettel in a tree-hierarchy.} %>

Note 1 is Parent to 1a, note 1a is Parent to 1a1. That means note 1a is both
Child and Parent.

### Types of Links

I distinguish three types of links in my notebook:

-   **Blue links**: These are the hyperlinks to external references, sources and
    the like, such as Wikipedia. These links are outward links, i.e. a link from
    the note we are working on or looking at to another note. The name of the
    link consists of contextual text (flowing with the "story of the note).

-   **Green Links**: These are internal links, which connect a note with another
    one, or a note with a note in a non-Zettelkasten notebook. These are also
    outward links. The name of the link consists of contextual text (flowing
    with the "story of the note) as well as the number of the note it refers to.

-   **Backlinks**: These are links that point from a note (A) to note (B), with
    the latter being the one that we are working on or looking at. The links
    from A are not visible as such in B. But A does show a link to note B. So
    when we call up B (by searching for its number), A will also appear in the
    list since it has B's number in its link.

### Details of the Template

After some experimenting & fine-tuning this is what I found works best for me. I
have tried to make each section and its components as self-explanatory as
possible so I don't have to search/think each time what certain things mean or
how I did it in the previous notes.

<%= insert_image file: "template.png", title: "template", caption: %{Zettel note template} %>

On top of the note are:

-   **The note number**: `#` indicates the unique note number. For more details
    see section 2. Organisation.

-   **Title**: The Title is anything I want, but it should describe in one word
    or a pithy phrase what the note is about.[^1]

Then follows a table with the details of the main note body. That template is
subdivided into 2 sections: Data and Metadata.

Note I have marked certain words with an asterisk. These are search terms. They
are my "invented" unique words that can be used in addition to the normal
full-text word search.

[^1]: The unique number and title are not part of the text box containing the details, but are part of the overall template. A text box is something particular to OneNote, I have not seen it in any other app.


#### Template Section "Data"

First, let me discuss the rows of the "Data" section.

-   **Quote**: When I read something I can take a literal quote from the text
    without amending it. If I want to add an interpretation or annotation I put
    that in the space below, called "Issue". If I fill the space with a quote I
    leave the word "yesquote", so that if I want to find all my notes with a
    quote (most notes do not have a quote) I search for "yesquote". If I do not
    fill that space I delete the word yesquote from that space. This applies to
    "yesimage" and "yesremark" too.[^2]

-   **Issue**: Here I put my thoughts about a quote or, if I don't have a quote,
    any other notes about the piece I just finished reading

-   **Note sequence/(Folge)zettel/Follow-on's**: See remarks from above. Bear in
    mind a note can be a parent, a child, or both. Internal links are in green.

[^2]: *Christian's Comment:* Using words to indicate some kind of content produces a similar effect to tagging on a meta level. Using the hashtag-convention, you could type this as `##quote`, for example. But as you see: [any convention can work](</posts/how-to-program-yourself-productivity/>) as long as it works for you.

#### Template Section "Metadata"

Next, the rows from the "Metadata" section: "Keywords", "Outward Links",
"Author(s)", "Source" and "Remarks/Footnotes".

##### Keywords

I found that keywords which start with `#` (e.g. `#personality`) are not treated
as 1 word by OneNote. So when I would search for `#personality` it would return
individual `#` occurrences too.

Leaving a keyword as is (e.g. personality without any other marker) would also
return other, irrelevant instances. So I chose to put a "k" in front of my
keywords (e.g. kpersonality). All my keywords are thus unique enough that a
search really only returns the Zettelkasten notes marked with the keyword I am
looking for.

I keep an Excel list (a green link in the template for the sake of convenience)
of keywords (without the "k" in front) and for each keyword I have as many
synonyms as possible. Excel allows you to find duplicates, on the basis of which
I can decide if certain keywords can be eliminated, or, if I consider creating a
new keyword, whether there is a real need for it or if an existing one suffices.
In the latter case I will always choose the existing keyword.

Aside: [Sascha's approach](</posts/what-is-a-zettel/>) is "I write as many
keywords as I can come up with" in order to increase the chance of serendipity.
I don't subscribe to this strategy because in an uncontrolled & growing pile of
keywords a search for notes with a particular keyword returns too few notes
because many fewer notes carry the particular keyword searched for.[^saschacomment1]

  [^saschacomment1]: _Sascha's Comment_: This is absolutely not the case. I don't have the same number of Zettel that need to be spread out to a bigger number of keywords. I just have more keywords that are more indirectly connected to the content. I don't choose from a bigger pile of keywords. I have additional keywords. 
  
On the other hand, if you have a relatively limited collection of keywords, more notes will be assigned to each keyword, thus increasing the chance of a search returning a collection of unexpected notes with a higher chance for a serendipitous discovery.

So, contrary to Sascha's premise that a plethora of keywords increases
serendipity, it actually reduces the chance for a serendipitous discovery, for
the reasons outlined above. I do agree with Sascha, however, that serendipity is
the main idea behind the Zettelkasten.

##### Outward links

If I cannot link the note I just created to another one, the qualifier "nolinks"
stays & "nolinks" is a search term to find similar notes. On the other hand, if
I do link my note to (an)other(s) I delete the "nolinks" qualifier.[^3]

  [^3]: *Christian's Comment:* I think recognizing a Zettel to have no outgoing connections, for example using a "nolinks" tag is very clever: so you can come back to revisit dead ends after a while and see if now you have something to link it to.

This also applies to the rows "Author(s)", "Source" and "Remarks/Footnotes".
Their contents are simply based on references.

## Organisation

### Numbering

As indicated above, my primary method for organising my notes consists of a
simple numbering system.

I do not have a sophisticated system for this; I started at no. 1 and will
continue numbering till "infinity".

Aside: I do not believe Christian's ID system of yyyymmddhhmm provides more
added value because humans tend to remember the date or time of year we did
something very well, as Noguchi suggested. A long time after creating a note one
does not remember what date it was created, never mind the hour. However, I do
agree with Christian's premise that each note number needs to be unique,
otherwise when one searches amongst the Zettel for a number that is not unique,
there will be a lot of noise, pollution if you like, which makes it difficult to
fish out the Zettel one is looking for, and it wastes a lot of time
unnecessarily. In my system, therefore, I put an n in front of each number in
the title; links in the text are also accompanied by a similar number, though I
show those as superscripts so as not distract from the flow of the text. So, for
example, when I search for Zettel n268, OneNote finds the actual note, as well
as those pointing to n268 - see screenshot below.

<%= insert_image file: "note-ids.png", title: "note IDs", caption: %{Some of my note IDs} %>

My number sequence goes from n1 to n2, n3, ...

However, if one wishes to use Christian's numbering format, that of course is
perfectly possible and fine in OneNote.

### Time

I take the time dimension into account in different ways.

<%= insert_image file: "grouping.png", title: "OneNote groups", caption: %{Zettel grouped per year.} %>

The time dimension that I feel offers some added value in terms of
identification is grouping together notes created in the same year in a OneNote
section of the Zettelkasten notebook. The title of each section is the year
plus, between brackets, the numbers created during that year. The screenshot
below shows that I created notes 1--204 in the year 2014.

The screenshot above also shows a small part of the note I created to write this
review. Each note has "create date" immediately below the title (in this case 04
November 2015), which is added automatically for each new note; that "create
date" can be modified manually. So if one remembers in some more detail about
when/what period a note was created, it is possible to search on that basis. But
making that date part of the note's number identifier only acts as a
distraction, in my opinion.

### Hierarchy

From the preceding dimensions of organisation above it can be deducted that I
only use 2 slight degrees of hierarchy:

-   time-bound, which in reality is done more from a point of view of "in case I
    would need that for the odd occasion."

-   Parent-Child notes (Zettel/Folgezettel), which are an essential part of my
    Zettelkasten. This is my personal preference, OneNote does not impose it

## Advantages of using OneNote

### Text editor

#### Formatting

Text typed in OneNote can be formatted very easily and in many ways is similar
to what is possible in Word. Word of course has many more possibilities.

#### Intra-note outlining

One very useful feature in OneNote is the possibility to create an outline of
sections/chapters within a note.

I find this to be an essential tool that can be used when creating a rather long
Zettel or creating a paper/essay/… about a subject based on a number of Zettel.
It allows one to set up a structure, of which the parts that one is not
currently working on can be collapsed, as the screenshot below shows. The
screenshot shows that the Introduction and chapter 1 are collapsed to focus on
chapter 2. Those 2 collapsed chapters can be expanded easily by double-clicking
on the + on the left.

<%= insert_image file: "outlining.png", title: "outline", caption: %{Writing the outline for this post in OneNote.} %>

#### Tables

When adding attachments, photos, sketches, … to a note I find that the best way
to organise that when one needs on a single page is to use a table. OneNote
offers any combination of numbers of rows and columns. It is even possible to
use tables within tables. I use tables extensively.[^saschacomment2]

  [^saschacomment2]: _Sascha's Comment:_ Keep in mind, the more you use features of a particular app the more you are boxed in. One reason for the plain text approach is the independency from software your get with it.

### Multiple Entrance Points

Using the keywords one can dive in anywhere in the Zettelkasten database. This
is also possible if one has a certain note sequence in mind: find it & follow
the path of Parent & Child notes. Note sequences make excellent stories on their
own or can be part of a bigger story. In any case, the bigger one's Zettelkasten
becomes, the more useful note sequences are as they keep you more focused,
rather than following links from one note to another without having a clear idea
of where one is going.

### Interaction with other OneNote notebooks

Since OneNote has become my go-to app for all my information, I appreciate the
possibility to be able to make links to some of my other notebooks. For example,
I have a note listing words that are new for me and that I want to make part of
my regular vocabulary. So when creating a new note and I copy text from
something I have read which contains a word in that list, I create a link to the
list.

### Interaction with other Office apps

Being part of the Microsoft Office suite OneNote interacts and integrates
seamlessly with the other Office apps. In my use case integration with Word and
Excel are particularly important.

### Atomicity

The normal way to ensure atomicity is to keep notes short, which makes it easier
to link to specific small bits of info and expands the network connecting the
notes.

OneNote is actually designed for long notes, which in the case of the
Zettelkasten runs counter to the [principle of atomicity](/posts/create-zettel-from-reading-notes/). However, OneNote has a
very interesting feature: the ability to link to a paragraph within a note. This
means that, irrespective of the length of the notes, atomicity is ensured if one
makes full use of the aforementioned feature. In fact, the length of the note
even becomes irrelevant, so when one is inputting info into OneNote one does not
have to consider whether one is in the Zettelkasten and therefore keep atomicity
in mind, or one is in another environment and does not have to worry about
atomicity.

This is a big advantage, made possible by linking to specific paragraphs in
notes.

## Disadvantages of using OneNote

### Altering Keywords

Real tags (those that are part of the metadata of a note, not inline as in
OneNote) are independent of notes. So calling up the amended tag will yield the
same list of notes as before the amendment.

OneNote does have tags (as semi-metadata that they are visible but are put in
the note's margin) but they are awkward. Changing the text associated with the
tag doesn't change the tags that you've already "used". With real tags, if you
change the name of a tag, it instantly updates everywhere. So, if I tag some
notes in OneNote, e.g with the tag "project\_philosopher" and the name of the
project changes, I have to change the text in the tag itself (e.g.
"project\_germany") and then go find the notes with the old project tag and
manually update them with the new project tag.

### No card view and/or inter-note outlining

When one wants to compile a piece of writing on the basis of Zettel it may be
useful to be able to put on a virtual desktop & manipulate their position so as
to eventually create a good story. Unfortunately OneNote does not have this
feature. As a workaround it is possible to select the collection of notes one is
interested in, and copy/paste them into 1 Word document, which makes it possible
to contemplate them together as 1.

### No plaintext mode

Some people prefer plaintext over rich text format. OneNote does not offer
plaintext. Prior to my switch to OneNote I tried a number of plaintext apps,
mostly wikis, because I thought that plaintext offers the best, "unbiased" form
of note-taking. In addition, I thought it was best for portability i.e. being
able to move those notes to another app easily if and when circumstances
dictated that.

Well, I never got used to plaintext and consequently do not enjoy taking notes
that way. And as for portability, OneNote allows export of notes as Word
documents, PDF files or MHT files. These 3 possibilities are enough for my
needs.

OneNote does have one wiki feature: the ability to create a linked new note by
typing the title of the new note between double square brackets within an
existing note. So any word or phrase between double square brackets becomes a
link to a note with that specific title.

## Conclusions

The ease of use, the intuitiveness, the versatility and richness of features
mean that OneNote is a good tool to use as a Zettelkasten for those who do not
insist on a plaintext or wiki app. Other drawbacks/disadvantages are minor
and/or can be overcome, and in any case are far outweighed by the advantages.

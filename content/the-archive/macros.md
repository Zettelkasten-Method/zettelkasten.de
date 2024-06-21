---
title: The Archive 3rd Party Macros
created_at: 2022-12-16 08:04:00 +0100
updated_at: 2023-08-02 14:34:52 +0100
excerpt: "This page lists all macros for 3rd party apps like Keyboard Maestro, Alfred, and other launchers that can enhance your workflows with The Archive."
description: "List of  macros for 3rd party apps like Keyboard Maestro, Alfred, and other launchers that can enhance your workflows with The Archive."
kind: article
toc: true
layout: the-archive
tags: [thearchiveapp, keyboardmaestro]
---

# The Archive 3rd Party Macros

<a href="/the-archive/" class="back--link"><img src="/the-archive/img/appicon-sm.png" class="back--image" /><span class="back--text">Back to the Project Page</span></a>

This page lists all known macros for Keyboard Maestro, Alfred, and other third-party launchers that can enhance your workflows with The Archive.

<aside class="note">
  <p><b>How to Contribute:</b></p>
  <ol>
    <li>Create a discussion with your macro <a href="https://forum.zettelkasten.de/categories/the-archive">in the &quot;The Archive&quot; category</a> of our forum as a place to discuss the macro.</li>
    <li>Submit the macro to the <a href="https://forum.zettelkasten.de/discussion/213/the-archive-keyboard-maestro-alfred-macros/p1">overview discussion</a> with a link, and a short description.</li>
    <li>We then put it here :)</li>
  </ol>
  <p>Alternatively, <%=email("hi@christiantietze.de", text: "email your macros to  Christian")%>!</p>
</aside>


## Bundles

- [Alfred workflow](https://forum.zettelkasten.de/discussion/comment/6715/#Comment_6715) by @pryley: bundle of many different actions to work with your Zettelkasten from anywhere
- [@seanakabry's KM macro collection](https://github.com/seanakabry/zk-tools)

## Writing and linking

- [Link & tag auto-completion bundle by @Will](https://forum.zettelkasten.de/discussion/comment/2444/#Comment_2444 "Automatic completion when adding a link or a tag to zettel.")
- Insert link to notes with auto-completion/type-ahead search
    - [Variant by @Will](https://forum.zettelkasten.de/discussion/comment/2516/#Comment_2516 "Quick insertion of links to other Zettels with type-ahead search (using Keyboard Maestro)"), inserting the ID
    - [Variant by @kaidoh](https://forum.zettelkasten.de/discussion/176/quick-insertion-of-links-to-other-zettels-with-type-ahead-search-using-keyboard-maestro), inserting the full note title
    - [Variant by @Vinho](https://forum.zettelkasten.de/discussion/comment/10245/#Comment_10245), periodically updating a KM variable
- [Tag auto-completion/type-ahead search](https://forum.zettelkasten.de/discussion/179/quick-insertion-of-tags-with-type-ahead-search-using-keyboard-maestro)
- [Extract new note from selected text by @sfast](https://forum.zettelkasten.de/discussion/comment/13329/#Comment_13329)
- [Table of Contents link: Inset link with spacing to right-align links](https://forum.zettelkasten.de/discussion/comment/2297/#Comment_2297 "Inset Note Link with 80 spacing")
- [Copy note links in 3 different formats](https://forum.zettelkasten.de/discussion/comment/7530/#Comment_7530 "Note Linking Trifecta") by @Will
    - For an alternative to one of these formats: [Convert The Archive's copied links from `[[YYMMDDHHMM Title]]` to `[[YYMMDDHHMM]] Title`](https://forum.zettelkasten.de/discussion/comment/2132/#Comment_2132) also by @Will


## Creating Notes

- [Create new note from selecton](http://forum.zettelkasten.de/discussion/902/km-macro-create-new-zettel-from-selection)
- [Create & update Zettel and its metadata](https://forum.zettelkasten.de/discussion/675/alfred-workflow-for-creating-new-zettels-including-metadata) (Alfred workflow)
- [Create Zettel](https://forum.zettelkasten.de/discussion/comment/6811/#Comment_6811) (Keyboard Maestro)
- [Insert note header/template](https://forum.zettelkasten.de/discussion/comment/10154/#Comment_10154)

## Getting Stuff into The Archive

- [Paste without newlines](https://forum.zettelkasten.de/discussion/comment/13212/#Comment_13212), e.g. to copy from PDFs.
- [Copy link to mail, media, or website into The Archive](https://forum.zettelkasten.de/discussion/2122/3-quick-ways-to-create-a-markdown-link-from-mail-safari-and-finder) by @Will
- [Take screenshot and save into The Archive](https://forum.zettelkasten.de/discussion/comment/11202/#Comment_11202): saves the picture in your media folder and prepares the Markdown to insert an image in your clipboard.
    - Good news: The Archive since v1.7 supports image pasting from the clipboard directly!

## Maintenance, Search and Replace

- [Rename note and update all links](https://forum.zettelkasten.de/discussion/1230/km-macro-rename-note-and-update-wikilinks-to-it/) by @seanakabry.
- [Global find and replace **for titles**](https://forum.zettelkasten.de/discussion/638/keyboard-maestro-macro-replacing-text-string-in-all-zettel-titles) in all notes, by @Vinho.
- [Global find and replace **for whole note contents**](https://forum.zettelkasten.de/discussion/641/keyboard-maestro-macro-replacing-text-string-in-all-zettels) by @Vinho.
- [Print all tags from .txt files (run from archive directory)](https://forum.zettelkasten.de/discussion/comment/2504/#Comment_2504 "Script to print all tags from .txt files (run from archive directory)") by Will, a.k.a. *Create a "Tag Cloud" note*.
- [Create note that adds details to tag](https://forum.zettelkasten.de/discussion/comment/7440/#Comment_7440) by @Will.
    - Another approach in The Archive could be to create a note with the tag as the filename. When you search for the tag `#zettelkasten`, the file `#zettelkasten.txt` will be presented to you automatically as a sort of hub note.
- [Generate a statistics dashboard](https://forum.zettelkasten.de/discussion/786/zettelkasten-statistics) by @Will.
- [Visualize network of selected notes via graphviz](https://forum.zettelkasten.de/discussion/670/visualising-links-between-zettels-with-keyboard-maestro-and-graphviz) by @Vinho.
- [Create nested list from connections of selected notes](https://forum.zettelkasten.de/discussion/630/feature-request-outliner-view-of-a-zettel-and-its-children) by @Vinho.
- [Create & update note backlink back-matter](https://forum.zettelkasten.de/discussion/comment/4413/#Comment_4413) by @piotr. Uses Andy Matuschak's "note janitor" script [we wrote about before](https://forum.zettelkasten.de/discussion/670/visualising-links-between-zettels-with-keyboard-maestro-and-graphviz).

## Visualization

- [Generate a statistics dashboard](https://forum.zettelkasten.de/discussion/786/zettelkasten-statistics)
- [Visualize network of selected notes via graphviz](https://forum.zettelkasten.de/discussion/670/visualising-links-between-zettels-with-keyboard-maestro-and-graphviz)
- [Create nested list from connections of selected notes](https://forum.zettelkasten.de/discussion/630/feature-request-outliner-view-of-a-zettel-and-its-children)
- [Create & update note backlink back-matter](https://forum.zettelkasten.de/discussion/comment/4413/#Comment_4413)


Reference management:

- [Insert BibDesk citekey, choose from list](https://forum.zettelkasten.de/discussion/comment/2533/#Comment_2533) by @cdguit.
- [Insert links to Evernote notes](https://forum.zettelkasten.de/discussion/417/using-evernote-as-a-pdf-and-article-archive "Quick insertion of links to Evernote notes.") by @Will, a.k.a. *Using Evernote as a PDF and article archive*.

Media:

- [Move image to /media and put syntax in clipboard](https://forum.zettelkasten.de/discussion/559/quickly-copy-files-images-to-media-folder-and-create-formatted-media-links-using-keyboard-maestro): Select files in Finder and copy to the media directory and create in the system clipboard a formatted link for pasting, e.g. `![](media/001.jpg)`.

Linking and getting to notes:

- [Search for note by ID at cursor position from any application](https://forum.zettelkasten.de/discussion/774/keyboard-maestro-macro-search-uid-in-thearchive-from-any-application/) by @Mediapathic.
    - [Sascha's variant](https://forum.zettelkasten.de/discussion/comment/14923/#Comment_14923) skips the clipboard and emulates keystrokes on behalf of the user.
    - [Open note that matches selection from other apps](https://forum.zettelkasten.de/discussion/1235/km-macro-open-a-file-outside-the-zettelkasten-identified-by-a-uid/) by @seanakabry (like external wiki linking)
- [Copy note links in format](https://forum.zettelkasten.de/discussion/comment/7530/#Comment_7530 "Note Linking Trivecta") by @Will does:
    - Insert Inline Note Link (UID only) `[[202008011415]]`
    - Insert Title 1st Note Link - `Zettelkasting Dashboard [[202008011415]]`
    - Insert UID 1st Note Link - `[[202008011415]] Zettelkasting Dashboard`
        - Also: [Convert The Archive's copied links from `[[YYMMDDHHMM Title]]` to `[[YYMMDDHHMM]] Title`](https://forum.zettelkasten.de/discussion/297/convert-the-archives-copied-links-from-yymmddhhmm-title-to-yymmddhhmm-title#latest "Convert The Archive's copied links from [[YYMMDDHHMM Title]] to [[YYMMDDHHMM]] Title")

## Miscellaneous

- [Poor Man's Roam](https://forum.zettelkasten.de/discussion/855/poor-mans-roam-style-contextual-backlinks-keyboard-maestro): "Creates a new note with all paragraphs containing search term"
- [Insert URLs to notes _from other apps_ with auto-completion/type-ahead search](https://forum.zettelkasten.de/discussion/191/quick-insertion-of-urls-to-notes-with-type-ahead-search-using-keyboard-maestro)
- [Open note that matches selection from other apps](https://forum.zettelkasten.de/discussion/1235/km-macro-open-a-file-outside-the-zettelkasten-identified-by-a-uid/) (like external wiki linking)

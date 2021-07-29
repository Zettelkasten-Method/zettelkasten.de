---
title: "org-roam (Emacs Zettelkasten Package) Version 2 Released"
created_at: 2021-07-29 18:42:55 +0100
kind: article
author: christian
tags: [ emacs, opensource, org-mode ]
rel_image: 20210729191147_org-roam-v2.png
---
Last week, free and open source [knowledge management package `org-roam`][or] was updated to version 2.

`org-roam` is an Emacs package (or "plug-in" as we normies would call it) that adds Zettelkasten features to connect small pieces of knowledge.

<%= insert_rel_image file: "20210729191147_org-roam-v2.png", caption: "Screenshot of org-roam v2 in action: the main pane shows a note, the right sidebar shows incoming links", link: "https://www.orgroam.com/" %>

The format used to store and display notes used the popular Emacs package `org-mode`: [`org-mode`][org] has a plain-text file format (`.org`) not unlike Markdown, and the package comes with functionality for note-taking that allows you to write formatted text, and also organize projects and tasks. Its variety of features actually makes org hard to describe.[^org]

`org-roam` adds functionality for a Zettelkasten on top of org, like displaying all incoming links (aka backlinks) for any note in a sidebar. You also get quick capture functionality to create a new Zettel from anywhere, and link auto-completion to make connecting notes easier. So `org-roam`'s job is to maintain a web of knowledge, while `org-mode` is the file format to write rich notes with e.g. images and tables inside. -- The capabilities of `org-roam` actually go beyond mainainting a Zettelkasten, since org's task-management features can be interwoven with Zettelkasten-style notes if that's something you're into.

[^org]: Really, where do you even start? It comes with tables and spreadsheet functions to auto-update table cells based on formulae; it displays and manages images and other attachments in your notes; you can have executable (!) code blocks that show results in your notes, be it text or images (think plotting data); you can manage your address book; and it's a very capable task manager with customizable project and task rules, scheduling, deadlines, and automation for everything, including a dashboard-like overview of everything you have to do for the day. Oh, and you can use it to power your website or blog because there's extensions that spit out HTML. If a task can be accomplished with text, org can probably do it for you.

Want an introduction to `org-roam` and its Zettelkasten features by a veteran Emacs screencaster? Check out this video:

<%= insert_youtube("AyhPmypHDEw", caption: %Q{Building a Second Brain with org-roam, by System Crafters; <a href="https://systemcrafters.cc/build-a-second-brain-in-emacs/getting-started-with-org-roam/">see show notes for text version</a>}) %>

What's new in v2? The most breaking change from v1 to v2 is that they now use org-mode links IDs instead of individual files. This is supposedly making it much more snappy when you work with a lot of notes. Migrating from the old v1 file format is a bit of work, but they offer a migration wizard for this purpose. If you're just getting started, the new version 2 is good to go, though!

Notable links to learn more about `org-roam`, `org-mode`, and a starting point for Emacs if you want to check this out:

- [Sacha Chua](https://sachachua.com/) publishes Emacs news every week to provide an overview of activity in the community. [Her latest issue from 2021-07-26](https://sachachua.com/blog/2021/07/2021-07-26-emacs-news/) contains a huge section about org, org-roam, and the update to v2.
- [`org-mode` website][org] to get to know the `.org` file format and a glimpse of its features
- [`org-roam` website][or] to learn more about the roamification of Emacs `org-mode` notes
- [`org-roam-bibtex`](https://github.com/org-roam/org-roam-bibtex), a package that makes it possible to use BibTeX for reference management in your notes
- [/r/emacs](https://www.reddit.com/r/emacs/) is a surprisingly active subreddit where people share their Emacs love stories, setups, configuration helps, and also org-related stuff
- [/r/orgmode](https://www.reddit.com/r/orgmode/) is a place to get help and discover tricks pertaining `org-mode`, but is less active than /r/emacs
- [Xah Lee's Emacs tutorial](http://ergoemacs.org/emacs/emacs.html) if you want to get your hands dirty with Emacs

[or]: https://www.orgroam.com/
[org]: https://orgmode.org/

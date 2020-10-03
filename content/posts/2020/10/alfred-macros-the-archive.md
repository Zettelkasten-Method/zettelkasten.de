---
title: "Alfred Macro Collection for The Archive"
created_at: 2020-10-03 19:36:15 +0100
kind: article
author: christian
tags: [ thearchiveapp, automation  ]
rel_image: 20201003193543_alfred-macro-preview.png
discussion_id: 1170
---

Paul Ryley (@pryley on the forums) whipped up an [amazing Alfred macro collection for The Archive][macro]. -- Huuuuge thanks go out to Paul for taking the time to working with The Archive better for Alfred users!

That means you get a ton of macros to remote-control your Zettelkasten in general and The Archive in particular from Alfred. [Alfred][] is a tool for application launching, global hotkeys, text expansion, and macro invocation. The macro stuff means you can bring up Alfred with a shortcut, then select e.g. the "Search The Archive" macro, and type your search term there.

<%= insert_rel_image file: "20201003193543_alfred-macro-preview.png", caption: "With Paul's workflow, you can create notes from templates if you have a recurring note format. Create a template by using the `#template` tag in a file, and that's it." %>

Paul's macro collection, called a "workflow" in Alfred lingo, comes with these actions:

- **Searching Notes** is not actually searching with The Archive, but it's doing a search in your Zettelkasten, and then offers a couple of actions:
    - preview the note
    - insert link to the note
    - open note with an external editor
- **Searching Tasks** looks for checkbox-style lists `- [x] like this`
- **Searching Tags** shows you a list of all used tags in all your notes, and lets you invoke a search for notes from there
- **Random Notes** shows any note from your Zettelkasten
- **Creating Notes** uses a form for title and tags, and it supports complex template files
- **Importing URLs** is a web clipping tool to import articles as notes
- **Importing Images** puts an image you select via Alfred (e.g. using it as a Spotlight-like file finder) into The Archive's managed media folder -- and provides a link for it right away
- **Text Manipulation** is like a format menu add-on for The Archive to increase the heading level, for example

There's a ton to configure if you want to adjust the behavior to your liking.

[Paul's macro collection][macro] comes with a comprehensive documentation, including examples and many screenshots. If you run macOS and want to dip your toes into productivity-enhancing tools like [Alfred][], make sure to check out Paul's macros!

[alfred]: https://www.alfredapp.com/
[macro]: https://github.com/pryley/alfred-the-archive

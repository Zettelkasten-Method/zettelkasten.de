---
title: "The Archive v1.8: Plug-Ins and Automation"
created_at: 2025-01-23 08:32:28 +0100
kind: article
author: christian
tags: [ plugin, announcement, thearchiveapp,  ]
rel_image: "2025-01-23_plug-in-settings.png"
---
We're excited to announce the release of _[The Archive](https://zettelkasten.de/the-archive) v1.8_! Here's what's new and improved in this version:

## Introducing the Plug-In System

This system is a game-changer for users looking to streamline their everyday actions without the need for external tools, like:

- Quickly create notes from templates;
- Generate statistics for your note archive,
- or for specific projects, like the current word count in sub-departments of your Zettelkasten;
- Automate creation of Folgezettel (if you're into that kind of thing).

Then bind any or all of them to custom shortcuts. (I personally recommend <kbd>Cmd+Shift+X</kbd> to launch the "Extract Note" plug-in.)

<%=insert_rel_image file: "2025-01-23_plug-in-settings.png", caption: "Plug-ins, managed from The Archive, showing the built-in “Statistics of All Tags.”" %>
  
Customize your note-taking workflow:

- Explore and install plug-ins from the new [Plug-In Showcase](https://forum.zettelkasten.de/categories/community-plug-ins) section of our forums.
- Create, test, and tweak your own JavaScript plug-ins interactively using the **Plug-In Developer Console**, then share your custom `.thearchiveplugin` bundles with the community.

Plug-ins are safe by design and can't delete your notes, communicate with the internet, or open other applications.


### Get Involved

<%=insert_rel_image file: "2025-01-23_plug-in-editor.png", caption: "The built-in plug-in editor" %>

The plug-in system is all about unlocking new possibilities for _The Archive_ users, and we're love to see what you create!

Share your plug-ins and ideas on the [forums](https://forum.zettelkasten.de/categories/community-plug-ins), and let's grow this ecosystem together.

## Additional Improvements

We've also addressed many smaller issues to improve the reliability and usability of The Archive. Here are the highlights: 

- 🐞 **Fix:** Multi-line paragraph movement is back to its normal behavior.
- 🐞 **Fix:** Undo/Redo for file operations now works across multiple windows and tabs.
- 🐞 **Fix:** Issues with relative paths (like `../../` in note names) when creating notes have been resolved.
- 🐞 **Fix:** Issues executing [some URL-scheme actions](https://zettelkasten.de/the-archive/help).
- 🔧 **Change:** Improved the handling of media/attachment sub-directories for better organization of your pictures.
- 🔧 **Change:** Updated the built-in MultiMarkdown with improved syntax rendering.

Check out the [full release notes](https://zettelkasten.de/the-archive/release-notes) for details.

----

The Archive v1.8 is available now as a free update for all users. Happy note-taking!

- [Learn more about plug-ins →](https://zettelkasten.de/the-archive/plug-ins/)

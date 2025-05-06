---
title: "The Archive v1.9: Hashtag Auto-Completion"
created_at: 2025-05-06 12:53:28 +0200
kind: article
author: christian
tags: [ announcement, thearchiveapp,  ]
rel_image: "2025-05-06_auto-complete-thumb.png"
description: "The Archive v1.9.0 introduces automatic hashtag completion as you type to improve ergonomics of connecting your notes."
---
With today's public release, everyone can enjoy type-to-complete style auto-completion of `#hashtags` in their Zettelkasten.

<%=insert_rel_image file: "./2025-05-06_auto-complete.gif", caption: "Type a hash to start completing, and continue to type to narrow down results"%>

That means all tags from all of your notes are available for you to insert quickly. Avoid typos and find obscure tags without having to look them up!

If you've never used any kind of auto-completion before, the main keys are:

- <kbd>Escape</kbd> makes the popover go away and discards a suggestion.
- <kbd>Tab</kbd> selects the topmost completion candidate as a suggestion (that shows up as a preview in your note); 
- Arrow keys move the selection if the popover is visible.
- With an active selection <kbd>Tab</kbd> again or press <kbd>Enter</kbd> to commit the selection.
- On macOS, <kbd>⌥</kbd>+<kbd>Esc</kbd> (Option+Escape) brings up the completion popover manually, too, in case you want to edit a half-finished tag or accidentally dismissed it.

The same completion popover now also enhances how dictionary words are completed:

<%=insert_rel_image file: "./2025-05-06_aardvark.png", caption: "Get the same ergonomics for dictionary word completion" %> 

macOS's default dictionary-based word completion is invoked by pressing <kbd>⌥</kbd>+<kbd>Esc</kbd> in any macOS-native app, including The Archive. Usually, you can only pick words from the list once it shows up, and it'll vanish otherwise. But with The Archive's new completion popover, you can make the dictionary popover appear and then type-to-complete, too.

As always, people on the _Cutting Edge_ update channel could test this feature early, so switch channels to play with upcoming improvements before everyone else can.

Up next, we'll make auto-completion available for wiki links. Stay tuned!

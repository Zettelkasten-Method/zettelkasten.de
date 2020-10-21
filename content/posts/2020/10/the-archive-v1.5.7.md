---
title: "The Archive v1.5.7"
created_at: 2020-10-21 14:50:28 +0100
kind: article
author: christian
tags: [ announcement, thearchiveapp ]
---

Today, v1.5.7 of The Archive is available on the "Cutting Edge" update channel. It'll become available on the regular, stable, "Release" channel in about a week.

Most notably, you can now hold the <kbd>Cmd</kbd> key when you click on links to open them in a new tab, just like in a web browser.

And a lot of you mouse-less nerds will enjoy the ability to jump between links in a note with a shortcut (<kbd>Ctrl-Tab</kbd> by default), _and open the link under the cursor_ (<kbd>Ctrl-L</kbd>). This can speed up navigation within your archive a lot!

Then there are various fixed related to entering (or pasting!) file names that are way longer than macOS would allow. When renaming a note and in the Quick Entry window, you get visual feedback when you try to enter more than the allowed 255 characters per file name: each character that is above the limit is highlighted red.

This is one of the last releases before either the new Markdown editor or scriptability goes live. So expect version 1.6 with something new in the future!

List of Changes:

- 🐞 **Fixed:** Icon selection for Saved Searches on macOS 10.11 El Capitan didn't display the built-in icons.
- 🐞 **Fixed:** Sidebar widths (and visibility settings) are remember next time you start the app.
- 🐞 **Fixed:** The Quick Entry Helper doesn't error-out when you try to create a file that has way too many characters for macOS to handle, resulting in loss of data of the form. You can now fix the problem and try again.
- 🐞 **Fixed:** When you hit Enter in the Omnibar and a new file would be created, you'll get a warning that the file name is too long instead of a file creation error.
- 🐞 **Fixed:** Visibility of the Quick Entry helper in dark mode.
- 🔧 **Changed:** When you try to rename a note and exceed macOS's file name length limit, you geta visual feedback while you type and the app won't let you commit the name change. This also prevents "could not rename" errors from popping up.
- 🔧 **Changed:** The Quick Entry Helper shows the auto-generated file name based on IDs in the form, instead of generating a surprise ID after you click "Create".
- 🌟 **New:** Command-click `[[wiki links]]` and `#hashtags`  to open the result in a new tab.
- 🌟 **New:** Follow links at the cursor position with a keyboard shortcut.
- 🌟 **New:** Jump to the next link in the text with a keyboard shortcut. This feature tastes best when combined with the new "follow link" command.

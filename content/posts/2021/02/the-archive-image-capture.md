---
title: "The Archive v1.6.0: Image Preview in Your Notes"
created_at: 2021-02-22 18:33:03 +0100
kind: article
author: christian
tags: [ thearchiveapp, announcement, image ]
updated_at: 2021-11-15 18:35:17 +0100
rel_image: 20211115183929-the-archive-image.png
---
Since this week, [The Archive](https://zettelkasten.de/the-archive/) v1.6.0 is available. The coolest feature addition is our new **image preview**.

<%= insert_rel_image file: "20211115183929-the-archive-image.png", caption: "Image preview right inside of a note" %>

- It works with tons of image formats out of the box.
- It shows a **preview of a PDF**'s title page if you use a PDF file path instead of an image file path.
- Images will **automatically shrink to fit** into the text column and not bleed into the margins. Image height is also limited, so you can include really tall screenshots, for example, without having to scroll for miles. You can [change the vertical limit](https://zettelkasten.de/the-archive/help/#hidden-preferences) if you want. We recommend a value below 50% of your screen height. Larger values quickly become annoying. The default is 400px.
- You can use relative paths to include pictures from within your note archive. That works really well with the built-in **webcam snap tool to add illustrations to your notes**. You can also use absolute paths if you store images elsewhere.

## A note on the limitation to include images on their own line

Images are shown only when the Markdown syntax to include images is on its own line. We found that including images inside paragraphs of text was super weird, because the text is broken up by the preview. So if you want to embed a picture, you'll have to put the command into your notes like this:

    Here's some text.

    ![](path/to/picture.jpg)

    Here's more text!

The empty lines to separate the paragraphs are optional. The main point is that you make a conscious decision to put an image on a separate line, and then The Archive will comply.

## Check it out!

The updates also comes with a lot of changes that improve external editors and sync services like Dropbox and iCloud Drive. See the [release notes](https://zettelkasten.de/the-archive/release-notes) for details.

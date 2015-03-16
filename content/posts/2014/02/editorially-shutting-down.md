---
title: Editorially is Shutting Down. What About Alternatives?
created_at: 2014-02-15 11:01:46 +0100
kind: article
author: christian
tags: [ writing, software ]
url: http://stet.editorially.com/articles/goodbye/
comments: on
import:
    from: "http://christiantietze.de/posts/2014/02/editorially-shutting-down/"
---

[Editorially will shut down on May 30.][ann]

I used Editorially for some time now and me and my collaborators were getting accustomed to the platform.  It was more convenient to use Editorially than sharing plain text files in Dropbox, especially when multiple people were involved.  

Editorially wasn't designed for people collaborating at the same time, unlike files in Google Drive, née Google Documents.  Also, commenting was a rather finicky task in my eyes.  I'm accustomed to using the keyboard only, while Editorially required use of the mouse cursor.  But it worked, and it made sense for people not accustomed to plain text writing environments.  Editorially connected us Markdown geeks with the rest of the world.

What now?

* Writeboard.com was shut down, too.  It was a simpler tool, but it supported versioning.  37signals are re-structuring their business, so Writeboard.com had to go.
* [Draft][] is well.  This app is focused on getting editorial reviews for your drafts, see changes and integrate them into your document.  I have to test it with friends some more until I can judge the service.  Unlike Editorially, Draft doesn't highlight Markdown syntax while you write.  It has a 'preview' action, though.
* [Authorea][] is alive and kicking, it's backed by Harvard University, and it's especially useful for larger projects:  you can collaborate on articles or book manuscripts simultaneously, one section per person.  Behind the scenes, Authorea creates one text file for each section.  Since there's no one big document file, you can restructure the document easily.  It will only change the order of file references in a table-of-contents file.  This is similar to [Marked][], [mmd_merge][], and the book format of [Leanpub][].  It'll cost you some money to create private projects, though.  Authorea is designed for Open Science where you're encouraged to let other people see and fork your articlesIt's like GitHub for scientific articles -- it even supports LaTeX!
* Open Source has lots of proof-of-concepts.  [collaborative-markdown][1] may be one way to go.  It works fine at the moment, though it isn't polished at all.  Maybe one will have to combine it with syntax highlighting editors like [Ace][3] just as the people at [OakOutliner][4] seem to do.  Also, there's things like [OpenEtherpad][2].

It seems there's enough Open Source technology available to create an online collaboration tool if Draft and Authorea won't do the job.

Do you know of any other alternative?

[ann]: http://stet.editorially.com/articles/goodbye/
[draft]: https://draftin.com
[authorea]: https://authorea.com
[leanpub]: https://leanpub.com/
[mmd_merge]: https://github.com/fletcher/MMD-Support/blob/master/Utilities/mmd_merge.pl
[marked]: http://marked2app.com/help/Multi-File_Documents.html
[1]: https://github.com/joeyb/collaborative-markdown
[2]: http://openetherpad.org/
[3]: http://ace.c9.io/
[4]: http://oakoutliner.com/

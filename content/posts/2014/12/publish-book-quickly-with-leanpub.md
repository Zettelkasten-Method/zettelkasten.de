---
title: Writing and Publishing an E-book on Leanpub Effortless and in no Time
created_at: 2014-12-24 08:37:04 +0100
kind: article
author: christian
tags: [ writing, book, leanpub ]
image: "201412240842_kid_writing_god.jpg"
vgwort: http://vg08.met.vgwort.de/na/b2cdf158647f40fea79623841eb3067c
---


I released a book two weeks ago. It's called "Exploring Mac App Development Strategies" and it's [available for $9.99 on Leanpub.][book] Today, I want to share with you the process of its creation.

The book "happened" in two weeks of me coding an example project to solve a particular problem I encountered. I decided to jot down lots of notes and write about my decision making. It took some more hours to edit the copy, and even longer to proof-read and typeset the whole thing, but in the end I finished the 107 pages in under 14 days. I think this was possible because I knew the topic rather well, and because I am able to sit down and write or code for many hours straight. I stay focused by taking breaks regularly[^sascha] every 25 minutes or so. 

  [^sascha]: Sascha would disagree about the regularity, though, and often pull me away from my keyboard so I get to move my butt. Thanks for helping me get out of the typing frenzy a.k.a. hack mode. 

## Parameters

Overall, it took about 2 weeks to write the book, including the example application. Most of the time was spent on learning the new programming language Swift and getting stuff to work properly.

Let's focus on the knowledge-related facts.

I created Zettel notes from the stuff I found out, of course, and I used a few existing notes on the topic to write the manuscript. There are traces of Zettel I used throughout the manuscript: I left the Zettel ID and title in comments. ([Example][zettellink]) All in all, this books wasn't heavy on the Zettelkasten side of my knowledge. In fact, I had to find out a lot of the actual topics through writing the example application.

Now I'd like to argue that writing the example application was itself just an exercise to test my knowledge. [Writing notes facilitates your understanding][learn], writing texts will do so even more. Programming is similar to a very codified way to write texts. So whenever I found out I didn't know how to move on, I stepped back and looked at the puzzle. And I wrote about my attempts of problem solving. You could say the book is based on my journal notes of solving a particular programming problem.

Have a look at the manuscript [on GitHub][manuscript]:  By putting the manuscript on GitHub, I made it possible for you to see the actual files I worked on and to have a look at the [writing history][history] to compare the various versions. You can peek at how the manuscript grew over time!

If you haven't used GitHub in your lifetime before, it may look a bit too much like technology voodoo. Don't worry about that, though. You can simply use it like an online file browser and download a copy of the whole project as Zip.

The folks at Leanpub offer to create books from manuscript files in a [Dropbox][] folder shared with you if GitHub is not your thing. I preferred the more tech-savvy GitHub approach because I knew I wanted to share my progress with you from the start, and because I'd love to have other people contribute to the matter.

[learn]: http://christiantietze.de/posts/2014/02/learn-faster-by-writing-zettel-notes/
[zettellink]: https://github.com/DivineDominion/mac-appdev-book/blob/7abaca2ebadecfe6e2a56912759f2033ef9642e7/manuscript/201411190902%20use%20of%20tests.txt#L45
[manuscript]: https://github.com/DivineDominion/mac-appdev-book
[example]: https://github.com/DivineDominion/mac-appdev-code
[history]: https://github.com/DivineDominion/mac-appdev-book/commits/master
[dropbox]: https://db.tt/kgh4V4s

## Manuscript Organization

Let's talk about how the actual [manuscript][man] is organized.

I decided to create the book using the flexible publishing platform [Leanpub][] early on. This influenced the organization of the book a bit. If you haven't heard about Leanpub before: it's a book publishing platform where you're encouraged to publish and sell _unfinished_ books, build an audience, and release updates regularly. It's "lean publishing" inasmuch as "lean" equals getting feedback on the work before the product is considered "finished".

I totally buy into the analogy of books and software:

> A book, like large software, is never finished -- only released.  
> --[Ash Maurya][runlean][^maurya2013lean]

Thinking about it this way, and taking into account that digital goods are pretty common in 2014, it makes sense to find prospects early and develop the product with their constant feedback.

So that's it for the _why_ I chose Leanpub. Now to the _how_ of using the service.

Leanpub requires a `manuscript/` folder with a file in it called `Book.txt`. This is the book index from which the book is created. It's just a list of file names of your manuscript parts. Similarly, `Sample.txt` is used to select parts for a free sample download.

As you can see [on GitHub][man], I have created quite a few files to get organized. I count 36 files at the moment. Subtracting the sample preview and the finished book index, this still leaves 34 files of content.

Here's my personal convention for creating this Leanpub book:

* There's a file called `sample-stripped.txt` which I use in the sample index multiple times to remind readers that they are looking at a sample only and that some things might be totally out of context without the rest of the book.
* Apart from that, I aim to create one file per part, chapter, and section, and put them in order in the `Book.txt` index file.
* I use one file per logical unit of the manuscript and assign it an [identifier][id]. That's 24 files of book fragments.
* I put the beginning of every part into a file called `part-X.txt`. In there, you find heading and a short high-level introduction. The file name is different from all the others (it has no ID) to visually mark a difference in the book index file. Have a look at [the index][bkindex] for yourself. I like how it reads.

Now you already know that I use date-time based identifiers in my knowledge management. This means that the order of files makes no sense. Only the book index can tell the actual order of files.

Since I am pretty much used to working with text fragments in this way, I don't worry much about it. It may look weird for those unprepared. That's why I added a `README` file for explanation.

[man]: https://github.com/DivineDominion/mac-appdev-book/tree/master/manuscript
[leanpub]: http://leanpub.com
[bkindex]: https://github.com/DivineDominion/mac-appdev-book/blob/master/manuscript/Book.txt
[runlean]: http://www.amazon.com/gp/product/1449305172/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=1449305172&linkCode=as2&tag=ctzettelkasten-20&linkId=C73YRQIF4GXNIHVC

[^maurya2013lean]: Ash Maurya (2012):  _[Running lean. Iterate from plan A to a plan that works][runlean]_, Beijing: O'Reilly. (Affiliate Link)

## The Writing Experience Itself

I can only say it was a joy. I was excited all throughout the two weeks, and I still am!

Apart from my excitement, the process did work out really well. The Zettelkasten method is all about writing in fragments, you know. Every Zettel you create is possibly the piece of a future text you're going to write. When you're well-prepared, writing becomes copy-and-paste. Each Zettel is a text fragment. When you add lots of Zettel notes for a research project, say, you are writing your finished paper in fragments already.

I use this approach of fragmented writing for the Zettelkasten book already, so I was comfortable with the file organization. In fact, I created even more separate files very early on in the process for this small e-book than I have for the Zettelkasten book. Comfort grows with practicing it.

Well, I can only recommend you try this for yourself. Create an [outline of Zettel notes](/posts/write-book-without-even-trying-so-hard/) which seem to fit together nicely, paste their contents together according to the outline, then revise this patchwork draft you just finished.

Of course I think it works fine for you, too. The Zettelkasten method revolves all around this: write in fragments, compile drafts quickly, revise.

## Making the Book Open Source

I like the idea of making content freely available. You may have guessed I love to share knowledge from reading my blogs already. There's nothing to lose for anybody if we shared what we knew more freely with others. If you "give knowledge away", you have in fact _created_ knowledge instead of _given_ it since you don't lose anything in the process.

This is grounded in a core belief of mine: putting up artificial barriers between people makes things worse for each of us. 

You may pay for downloading and reading the finished e-book to support my work, as a token of appreciation. You could also use the manuscript files to compile a finished book yourself if you either think the product isn't worth your money or if you can't afford to pay for something like it. I'm cool with that!

Next to my book manuscript, the [example project][example] is on GitHub, too. The same rules apply: if you find an error, you may fix it; if you come up with an enhancement, you can submit it. Pointing out and fixing issues is a win for everyone, especially considering the book is freely available and open source itself.

Once I spread the word about this book some more, I hope interested developers will jump on and help make the book and its code better. We'll see. I am going to repeat the process soon in early 2015. The application I'm working on right now, the [Word Counter for Mac](http://wordcounterapp.com), is facing a big change behind the scenes, and I couldn't find any literature on the topic. I'm going to change this.

[book]: https://leanpub.com/develop-mac-apps-clean-architecture-swift
[id]: http://christiantietze.de/posts/2014/02/add-identity/

[fork]: https://guides.github.com/activities/forking/
[prq]: https://guides.github.com/activities/forking/#making-a-pull-request

---

_Comment by Sascha:_ I think that Christian was able to write a whole (!) book so fast is because the Zettelkasten Method trained him in a certain writing technique. In the past I was astonished at the famous writers like Stephen King, who writes 2000 words a day. Luhmann stunned me with his output of texts. Now, I think it es very normal and their output is due a specific shedule, a reading technique and writing habits. In other words: it is very attainable and learnable.


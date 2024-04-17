---
title: How I use Outlines to Write Any Text
created_at: 2014-05-24 17:11:02 +0200
updated_at: 2024-04-17 07:58:12 +0100
kind: article
author: christian
tags: [ outline, writing, hub ]
image: 201405241937_leaf_structure.jpg
vgwort: https://vg08.met.vgwort.de/na/63c76a9da31d4060a7c1e183626b04f6
import:
    from: "http://christiantietze.de/posts/2014/05/how-i-use-outlines-to-write-any-text/"
---

<%= insert_rel_image file: "201405242034_starting.png", title: "screenshot of my outline in TextMate", caption: "The start of this very post as an outline"%>

Nowadays, I write all of my texts in outlines. This post is no exception. I found this to be a game-changer when it comes to writing, so I thought I'd share the process.

I start with a few broad strokes and go into detail, which equals using deeper levels of indentation.

Every item in the outline is going to be a full sentence. This way, I can rearrange paragraphs sentence by sentence in my text editor. Most of the time, though, blog posts simply are too short to make much use of re-arranging their parts. I use this feature heavily in my book manuscript, though, and I found that research-laden posts benefit from an outline, too.

Remember, English is my second language only. Usually, I don't come up with sentences, paragraphs, or sections which work out-of-the-box. I have to re-write my texts a lot to create flow. Outlines help to separate composing a text from creating flow.

<%= insert_teaser_image caption: %Q{Photo Credit: <a href="https://www.flickr.com/photos/33252379@N00/5337737384/">llamnudds</a> via <a href="https://compfight.com">Compfight</a> <a href="https://creativecommons.org/licenses/by-sa/2.0/">cc</a>} %>

So, what's in for you?

* Outlines are composed of movable parts, as opposed to finished paragraphs and blocks of texts.
* Hierarchy creates context. You can see the structure of the ideas you employ.
* You can attach research notes as references as they are at first instead of embedding them in the text immediately.

It's hard to extract parts of a finished paragraph. You have to find out what the context of a sentence is. If you want to leave the parts coherent, how much of the surrounding sentences do you have to extract with the one you'd like to move?

To work with a hierarchical outline solved this problem for me. I know when an item in the outline has descendants, I will have move them, too, because descendants _belong_ to their ancestral item. Moreover, the relationship from the item I want to extract to its ancestor provides context information I may have to provide again when I move it. Without such hierarchical organization, I wouldn't have access to this information.

Besides helping strengthening your sentences and providing a hierarchy, outlines make organizing references easier.

You can attach research notes to parts of your outline as descendant items to make clear what belongs together.  When you move items in your outline, you move the research notes with them, keeping together what belongs together. This way, you can sketch an idea and add research results before you know what the finished text will look like. This is a very powerful feature since you can work iteratively this way. Since you know that there's always time to change the order of things later, "to get research done first" will not prevent you from drafting the document. There's no need for over-analyzing something prior to getting ideas on paper because nothing's cast in stone.

This is a great relief when you write really large texts, too. Zoomed out, the outline can look a bit odd, though. Indenting too deep is a sign that I have to consider creating sub-sections:

<%= insert_rel_image file: "201405242035_finished_t.png", title: "screenshot of finished outline", relative: "201405242035_finished.png" %>

When I worked on my book manuscript, I had to incorporate years' worth of notes into the outline.  There are two possible ways to assemble a draft with the help of notes from the archive:

1. Copy and paste everything into a single document and rewrite later. This creates a strong relationship between your draft and your notes right away. If you change the notes in the process, the changes won't be reflected in your draft.
2. Reference notes instead of pasting their content. This is a much weaker relationship. You don't rely on the content of a note itself, but on the note's existence.

If you want to know in more detail how to write a _book_ in particular, check out [the post "How to Write a Book – Without Even Trying (so hard)"](/posts/write-book-without-even-trying-so-hard/).

Since I keep notes in my _Zettelkasten_ note archive, every note has a [unique identifier][id]. This identifier empowers me to reference notes by ID so I can defer copying the note's content:  at first, I merely decide that a note is relevant to a given part of the draft; later, after I have added other notes, maybe I changed my mind and now think a particular reference is superfluous. I simply remove the reference then. How would I untangle the mess if I pasted everything into the document from the start? I have no idea.

I can move really quick this way. I skim a note, ponder where it belongs, and put a reference in the appropriate place.

<%= insert_rel_image file: "201405242042_sascha.png", title: "screenshot of 3 phases of Sascha's writing", caption: "Start with a reference, add more, then cluster them." %>

My pal [Sascha][] does something similar. When he starts a draft, he pastes a reference to the first note into the document. Then he adds a second reference, then a third, and so forth.

Before he pastes additional references into the document, though, he looks for patterns. To make similar stuff belong together, he groups the references in the draft. This way, he's forming clusters of note references in the outline, and these clusters can have titles which convey even more information than the list of references did at first.

This approach is really similar to [Cal Newport's technique][calnp] to start a paper with a few topic notes, paste in all the quotes, and finally write a coherent text around these:[^calbook]

> **Step 3: Dump the Quotes**
>
> In the document containing your topic skeleton: start typing, under each topic, all of the quotes from your sources that you think are relevant. Label each quote with the source it came from.
>
> We call the final document a topic-level outline. Unlike the compact, hierarchical outlines promoted by the orthodoxy, a topic-level outline is huge (close the size of your finished paper), and flat in structure (no reason to use 18 different levels of indentations here.)
>
> **Step 4: Transform, Don’t Create**
>
> When you write your paper, don’t start from a blank document. Instead, make a copy of your topic-level outline and transform it into the finished paper. For each topic, begin writing, right under the topic header, grabbing the quotes you need as you move along. Remember, these quotes are right below you in the document and are immediately accessible.

Unlike me, Sascha often starts with just a very first reference and builds everything else around it. From the references alone emerges a text.  I like to start with an idea and insert references after the very first rough sketch of the document, instead.

So, why do I write in my favorite text editor instead of using a full-blown outliner?

For one, it's the Markdown support. The asterisks denote a list item. They aid my eye just like a tree-like view of nested bullet points does in a real outliner because TextMate is smart enough to wrap lines so they align prettily with the start of the list item. Basically, TextMate is typesetting the list with [hanging punctuation][hangpunct].

<%= insert_rel_image file: "201405242045_mmd_comment.png", title: "screenshot of a Markdown list item with comment" %>

I think it's great that my outlines are Markdown-aware, so I can insert links, embolden text, or insert comments which are not part of the rendered output.  I like the fact that you can fold parts of the outline in every typical outliner software, though. Sometimes, I miss this feature in my text editor, but that's mostly an issue when I work on my large book manuscript.

Using a text editor for outlining isn't a recommendation. It's just what I do because it works great in my case, and because I like to keep things simple. The [smaller my toolkit][tk], the less I have to rely on others. I don't wish for _the next big feature which would definitely change the way I work, this time for real,_ but try to get as far as I can with what I have.

From outlines, you can

I wonder: **how exactly do you start when you write texts?** What's your workflow? Tell us in the comments!

[markdown]: https://en.wikipedia.org/wiki/Markdown

[hangpunct]: https://en.wikipedia.org/wiki/Hanging_punctuation

[id]: /posts/add-identity/

[calnp]: https://calnewport.com/blog/2007/11/05/monday-master-class-how-to-use-a-flat-outline-to-write-outstanding-papers-fast/

[^calbook]: Also worth a read is his book which covers the writing process: Cal Newport: _[How to Become a Straight-A Student. The Unconventional Strategies Real College Students Use to Score High While Studying Less][straighta]_, New York: Broadway Books, 2007. (Affiliate link.)

[straighta]: http://www.amazon.com/gp/product/0767922719/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=0767922719&linkCode=as2&tag=ctzettelkasten-20&linkId=3SFYYPM52IOBRJ5C

[sascha]: https://zettelkasten.de/authors/sascha/

[tk]: https://web.archive.org/web/20200920161518/https://frankchimero.com/blog/2014/no-new-tools/

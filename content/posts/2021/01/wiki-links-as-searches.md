---
title: "How to Use Wiki Links for Saved Searches in The Archive"
created_at: 2021-01-21 18:30:00 +0100
kind: article
author: christian
description: "Wiki links are just clickable, saved searches. You can use them with Boolean operators to restore context."
tags: [ thearchiveapp, links, workflow, search ]
---
You can use `[[wiki links]]` in The Archive as a clickable shortcut to searches, which support complex logical operators to form very specific expressions.

People on the forums seem to [enjoy the discovery of clickable complex search expressions](https://forum.zettelkasten.de/discussion/comment/4194/#Comment_4194) in The Archive, so here's a short explanation of how you can use links like `[[#Gardening soil NOT fertilizer]]` to create a stored search.

Stuff like this is not going to replace your structures and individually connected notes in your day-to-day work, but you could play around with this to quickly save search expressions for later. Here's an intro to get up to speed with this accidental feature, what the important boolean logic operators are, and how this relates to finding and excluding notes.

For years, Sascha and I manually resolved links in nvALT by copy & pasting target IDs to the search bar. This wasn't too bad in practice. This is also how you can navigate a Zettelkasten when all you have is a file system. Search always works when you're at a computer. You don't need a fancy app for that.

When we added `[[wiki links]]` to The Archive, we didn't want to make them special in any way. We did not even tie them to file names. Coming from the simplicity of nvALT, we made links just a shortcut to what we did manually for years: to perform a search.

So whatever you put between `[[` and `]]` is clickable, and when you click on it, the app will perform a search. You can see how the Omnibar reflects the exact wording of the liked phrase. There is absolutely no difference between searching for "hello world" in the app by typing, and clicking a `[[hello world]]` link.

Usually, we'd use wiki links to point to specific notes by their ID. But if you deliberately not put an ID into the link but just any word, you essentially get a saved search.

## A primer to Boolean Search Expressions

With support for complex search expressions, this becomes pretty powerful!

The Archive [supports boolean search expressions](https://zettelkasten.de/the-archive/help/#can-i-use-boolean-search). That means you can put **logical operators** into your search strings to affect the search results.

By default, two words in a search string are combined with the `AND` operator. So when you search for "hello world", the equivalent, explicit boolean search string is `hello AND world`. That's how the app interprets things by default. You add more words, and thus require that a note contains the first one _and_ the second one _and_ the third etc.

The other operator is the `OR` operator:

- `hello AND world` or simply `hello world` looks for notes that contain both words;
- `hello OR world` looks for notes that contain either "hello", "world", or both.

The last operator that The Archive recognizes is the `NOT` operator. You can use it to exclude words, like a blacklist. `NOT hello` will look for all notes that do not include the string "hello".

## Saving Boolean Searches for Later with Wiki Links

Back to our introductory example, `[[#Gardening soil NOT fertilizer]]`. What this ends up meaning when you add the implicit `AND` operators is the following: `[[#Gardening AND soil AND NOT fertilizer]]`.

So you will get notes that

- do contain `#Gardening`,
- and do contain `soil`,
- but do not contain `fertilizer`.

Depending on your actual notes, this could produce gardening-related notes that pertain management of a healthy soil without fertilizer.

Usually, links are meant as one-to-one connections between notes. One Zettel points to another.

But when you create a note like `Gardening tips overview` and then put the wiki link `[[#Gardening soil NOT fertilizer]]` inside, you don't just add a link to another note -- you create a saved search shortcut instead!

## Saved Searches Do not Replace Manually Created Order

In our day-to-day Zettelkasten practice, we often recommend usage of [structure notes](https://zettelkasten.de/posts/three-layers-structure-zettelkasten/) to, well, add _structures_ to all the pieces of knowledge that you put inside your Zettelkasten. Structure notes use links to point to individual notes for details. Some structure notes look like a table of contents for the project you're working on, and they use links to point you to the details. [We recommend you use note IDs](https://zettelkasten.de/posts/add-identity/) in these links to create long-lasting, direct connections.

Boolean search expressions are something totally different, and they are not suitable to be part of a structure note or create any other kind of order. They are conveniences to make finding specific notes in an ever-growing archive more likely. Please do not mistake clickable Boolean search expressions for the holy grail of productivity. As we established in the past, mere "groups" of notes are unordered and not useful, for example notes with a certain tag; and stored Boolean search expressions produce similar results and thus suffer from the same defects. Through creating order manually, you create [meaningful hierarchies](https://zettelkasten.de/posts/understanding-hierarchy-translating-folgezettel/). Saved searches don't help to create and manifest structures. They only produce an unsorted set of results.

They are useful hacks, though.

You could create a special note in your archive that becomes your daily dashboard ([a forum discussion about home notes](https://forum.zettelkasten.de/discussion/1568/does-your-zk-have-any-home-notes-if-so-how-do-you-maintain-it) came up last December if you want inspiration on that topic). A dashboard/home note could contain a list of the projects you work on, questions you had left unanswered when you left your desk, and other "meta" information like that. It's not meant to become part of the content of your Zettelkasten, but it's a digital entry point to pick up trails you wanted to follow. Especially if you have a hard time figuring out a complex Boolean search expressions, saving them for later there could be helpful. It's a research in your own archive that you didn't finish.

Or take the example of gardening; you might have a couple of structure notes on gardening already. Some discuss management of the soil in detail, and the hierarchy that's encapsulated in these structures contains pointers towards empirical studies on the effects of phosphor overdoses, arguments for different plant rotations, and such things. The clickable `[[#Gardening soil NOT fertilizer]]` search expression has no part in this. But you might still find some use in storing this search inside your `Gardening tips` note temporarily, that might eventually become a proper structure note once you finish your the process of compiling an overview on the topic of e.g. "Fertile soil without fertilizer".

There you go: this is how you can use wiki links in applications like nvALT and The Archive, where the wiki link merely performs a simple search query. With boolean operators, search expressions can get pretty wild to express complex combination of criteria -- but ultimately, your writing work will rely on manually curated structures, and this is only an interesting step to find new stuff in your ever-growing collection.

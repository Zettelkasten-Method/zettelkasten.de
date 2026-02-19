---
title: "The Hidden Problem with Note Titles as Links (And How to Fix It)"
created_at: 2026-02-24 16:02:45 +0100
kind: article
author: "sascha"
tags: [ friction, obsidian, link,  ]
vgwort: https://vg08.met.vgwort.de/na/951ee886fa5c4b32a3bab62f132553ec
description: "Using note titles for links can be made to work, but it’s a kind of friction you could avoid."
newsletter: true
---
Dear Zettlers,

In today's newsletter, we will discuss a fairly technical aspect of the Zettelkasten Method: How to link.

The Archive encourages you to link using only the unique identifier. The Archive utilises link-as-search. What you see in the double brackets is not a direct link to another note. Instead, it will perform a search for the string within the double brackets. Since the ID is at the beginning of the file and matches the search term, it will select the note and display its content.

There are two main reasons why we made that decision:

Link-as-search aligns with our software-agnostic philosophy. You can access your Zettelkasten with just the search feature and, if you wish, manage it with any text editor that lets you search your entire Zettelkasten folder.

It allows you to change the title while keeping the links intact. The ID at the beginning remains the same, and a search for that ID will return this exact file.

You may object to the second reason: "But software can take care of link health." Obsidian, for example, will observe your Zettelkasten (the entire vault in Obsidian-speak) and if you change the title of a note, it will automatically update all the links. No links will be broken.

There is a harmful side effect of this feature (don't worry, I will teach you a simple trick to fix that flaw): The note title, now effectively serving as the ID, nudges you to write the note so that the note content adapts to the title of the linked note. It is not the end of the world, and in Andy Matuschak's famous Evergreen notes, you see [a mix of both well-integrated note-links and links that feel a little bit forced][1].

[1]: https://notes.andymatuschak.org/Evergreen_notes_should_be_atomic?stackedNotes=zF8xCU4BwXwbmSyp7tmff9i

If the title effectively works as the ID, the ID carries meaning. This characteristic creates friction: the meaning of the link needs to change depending on the context in which you place it. That means that the optimal note title would be different, depending on whether you take into account just the note's content or the various contexts in which you link to the respective notes. Some links may even feel strange or stop working if you change the title.

The solution to this problem is to separate the ID and the title. In *The Archive,* it is encouraged by the link-as-search feature. In other apps, like Obsidian, you can create this separation by creating a link alias.


**First Technique: Collapsing the link.**

1. You create the link with the double-brackets as you are used to. 
2. You then create a "pipe", a vertical line, after the note's title within the double brackets. 
3. The third and last step is to add a short signifier for that link.
   "R" for reference or "link".

This is how a link would look: "`[[Note Title|R]]`" or "`[[Note Title|Link]]`"

And the result:

<%= insert_image file: "image1.png" %>


**Second Technique: Linking the Link Context**

The link context is the technical term for the context provided by the note from which you link to another note. Review [the section "Connecting Zettel"][2] in the introduction for more information on that.

[2]: https://zettelkasten.de/introduction/#connecting-zettel 

If you want to connect a note, put double brackets *around the link context,* which then functions as the alias. Then you paste the note's title *before the pipe.*

A link would look like this: 

    [[Identity of the Zettelkasten|I am a Zettelkasten]], therefore, I am the best companion for your ideas.

And in the editor:

<%= insert_image file: "image2.png" %>

## The Significance of This Topic

This is not just any minor technicality. It is part of the [many tiny specifics that add up][3]. Thinking nudges should be met with caution. Good thinking is free, and constraints should be introduced with careful conscience. The inflexible merging of the note's ID and the title is not a good nudge. It will not destroy your Zettelkasten, nor is it a true forcing function. It is an annoyance, nevertheless.

[3]: https://zettelkasten.de/posts/the-friction-fallacy/

If you are an Obsidian power user, you can for sure write a small plugin that changes the linking mechanics by automating some of the steps to create a link alias.

Live long and prosper,
Sascha

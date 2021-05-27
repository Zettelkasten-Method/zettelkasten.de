---
title: "Field Report #1: A PhD About Writing with His Zettelkasten"
created_at: 2021-05-27 18:49:14 +0100
kind: article
author: "@henrikenggaard"
tags: [ assemble, writing, publishing ]
discussion_id: 1831
relative_image: 2_detail.png
---
It is not difficult to find articles that herald the benefits of using a Zettelkasten and because of this, a dose of skepticism is perhaps healthy. Do you really get magically productive? Produce world-class research? Uncover secret connections for elevated understanding? Write 10 books spontaneously?

In my case, neither of those, but I do think there is a point in telling about experiences (positive and negative) and here I'll share a bit of mine on [a recent conference paper I presented and published](https://orbit.dtu.dk/en/publications/maxwell-boltzmann-pmf-design-using-machine-learning-for-reconfigu). This is not some amazing breakthrough or epiphany; but it is an interesting angle to an existing problem using ideas that were not obvious before working with the Zettelkasten.

I want to talk about this paper specifically because it truly _emerged_ in my Zettelkasten. Ideas obviously come from many sources and a Zettelkasten is not going to replace discussions with colleagues or reading papers. However, in this case, the Zettelkasten allowed me to, piece-by-piece, connect the dots and produce a "new idea".

To tell my tale, I will have to throw in a bit of jargon related to my research field. It is not key to understanding the workflow, but it just felt too vague otherwise. I hope it isn’t too impenetrable. I should also say that I use TiddlyWiki,<!--sf: Link? --> but nothing is specific to any software: you could probably do this with pen and paper.

# Planting Seeds, Gaining Insight

A Zettelkasten has sometimes been described as a conversation partner, but that only really works if it is "fed".

A good diet is called for and in the spring and summer of 2020, I was working on some research for understanding the relevance of noise in optical fibers in relation to maximum data rates. The big deal with this is that optical fibers have a kind of feedback: changing the signal changes the noise too. This is vastly different from, for example, wireless communication and it is the bane of cutting-edge optical communication research.

While working on this I was throwing the observations and results into my Zettelkasten. Usually something in the sense of "Property A depends on property B" or "A is defined by". Occasionally, I would also ask questions about things I did not know: "Does this property predict that?", "Why does this property do so and so?" Of course, all these notes are well connected.

Many of these notes were made with a project / paper in mind, but as that paper developed and gained a good narrative, notes were “left out”. They were of course still in the Zettelkasten, but they were not “used”.

These two paragraphs above form one of the big paradigm changes in note taking for me. Instead of notes where ideas and references are “locked” into a specific project, they are all connected through the links in the Zettelkasten. There is a warehouse or parking space for notes, even when they lose a purpose or when their purpose is not fully known.

Come late summer and the paper is done and I have some "free time" to explore new ideas. Here the question notes come into play. I look up those I find interesting and start exploring the connections: Where do they lead? What can I see?

The technicalities are not super important, but I use links, backlinks and a graph view to explore. The graph view is limited to 2nd order connections, which reduces clutter a lot. I think the spatial nature allows for a different mindset when using it. The view is interactive, so static pictures don’t do it justice, but is the graph for one of the question notes:

<%= insert_rel_image file: "1_overview.png", caption: "Snapshot of the interactive graph view" %>

And a zoom on some of the notes:

<%= insert_rel_image file: "2_detail.png", caption: "Close-up of the graph" %>

Another way of exploring that I like is through search. While writing an outline, I might search for a note to insert and then see something else in the result, which might be interesting:

<%= insert_rel_image file: "3_search.png", caption: "Exploring through search" %>

Anyway, I had some “free time” and during the first part of that week, I pieced together this: Two properties called KLD and SNR, can be used to predict a third property: optimal shaping factor (λ). The shaping factor controls a trade-off between signal power and noise, but because of the mentioned feedbacks in optical fibers, it is very tricky to describe the optimal choice. Normally it would require numerical optimization or detailed modelling.

I arrived at the relationship through observations about the optimal choices from my earlier work and some unused notes. Observations of what happens when power (SNR) is swept, and distance is swept etc. Additionally, I had used KLD, for analyzing noise and I noticed that it was affected more at higher power-levels. Together, these should then predict an otherwise “unpredictable” factor; at least if the observations were correct.

I prototyped a machine learning system to learn the relationship and by the end of the week, I had the principle demonstrated. From here, it is of course a matter of research and understanding the problem fully. Through discussion with colleagues and some more thinking in the Zettelkasten, we ended up going in a different direction, but my point is not that a Zettelkasten spits out fully formed results. It lets you explore things you already "know", but just have never put in the right context.

# Writing and Rewriting

Another benefit of a Zettelkasten is its supposed power as a writing tool. When writing the first outline for the above paper, there was nothing more fun than exploring all sorts of connections and ideas I could fit into the outline. Again, I use search to inspire myself during the writing process. With well-written note titles, it is even possible to use them directly in the outline.

However, this first outline and the draft it produced needed very heavy editing.

Writing with a Zettelkasten is both easy and hard. It is easy to throw something together and have elaborate connections, but from an outline, there is still quite a way to a good paper. When writing, especially a 2-3 page conference submission, the story has to be sharp and to the point and immediately understandable.

Our first submission was rejected (we had only worked on it for a month and rushed to get it ready for a deadline). We regrouped and cleaned up the narrative for a later conference and this was accepted.

I want to mention this, since Zettelkasten definitely helps with references and finding connections, but good writing does not come magically.

---

**Sascha's Comment:** There three aspects I want to highlight: *First*, everybody has his own experience. Some are already doing a lot of what is part of the Zettelkasten Method. For them, the Zettelkasten Method is just a nice tool. Other struggle with connected thinking. They report a big positive change when they adopt the Zettelkasten Method. *Second*, seeing your present thought in the light of all of your thinking theory is way different than just relating it to your current project. *Third*, the Zettelkasten Method does not do anything for you. It enhances you efforts. So, if you just use your Zettelkasten to interconnect ideas why would you expect that the text you assemble is more than just connected ideas? It is indeed a false advertisment.

**Christian's Comment:** I especially liked one of Henrik's closing thoughts: "Writing with a Zettelkasten is both easy and hard." This resonates with my experience, because the work I have to do during clean-up is immense, and yet the [assembly step](https://zettelkasten.de/posts/tags/assemble/) right before that feels very natural and productive -- provided I have notes on the topic, of course. Even with the 'magic tool' that is a Zettelkasten, you have to put in work to complete a project. Anyway: congrats, Henrik!

---
title: "No, I Do Not Underestimate the Power of the Dark Folgezettel – I Embrace Its Source of Power"
created_at: 2022-02-28 19:44:32 +0100
kind: article
author: sascha
tags: [ folgezettel, link, connect ]
image: 20220228195302_sorcery.jpg
vgwort: https://vg02.met.vgwort.de/na/e540491779604e389daedfc0b1c4139c
excerpt: "A long time ago, Daniel wrote a reply to my reply to his article. This might be the spark that ignited the Great Folgezettel Debate. Daniel wrote that Luhmann didn't just create a network that looked like a interconnected web, but instead, he created something resembling an ordered tree."
description: "Let's see what real links and their contexts in my Zettelkasten look like, and how they hold up compared to Folgezettel. All examples are direct translations from my own Zettelkasten."
updated_at: 2023-04-04 09:31:40 +0100
---

<%= insert_teaser_image caption: %Q{Image by <a href="https://pixabay.com/users/clard-6995126">Szilárd Szabó</a> from <a href="https://pixabay.com/">Pixabay</a>} %>

A long time ago, Daniel wrote a reply to my reply to his article. This might be the spark that ignited the Great Folgezettel Debate.

The summary is:

Daniel wrote that Luhmann didn't just create a network that looked like this:

<%= insert_rel_image file: "mesh_network.png", title: "Cross-connected web", caption: %Q{An interconnected web of notes &ndash; <a href="https://commons.wikimedia.org/wiki/File:FullMeshNetwork.svg">GW_Simulations, Public domain, via Wikimedia Commons</a>} %>

Instead, Daniel claims Luhmann created something resembling this:

<%= insert_rel_image file: "pseudo_binary_tree.png", title: "A tree structure", caption: %Q{A tree-like structure &ndash; <a href="https://commons.wikimedia.org/wiki/File:Pseudobin%C3%A4rersuchbaum.svg">Chris828, Public domain, via Wikimedia Commons</a>} %>

The central quote is:

> If a thought is to be placed in the Zettelkasten, **first consider which topic it fits to.** Then this topic must be sifted through, after which a note can be incorporated - be it as a new "initial note", as a continuation or as a branching off of a note (so-called Folgezettel notes in the Zettelkasten). (My translation, my emphasis) ([source](https://strengejacke.wordpress.com/2015/09/08/luhmanns-arbeitsweise-im-elektronischen-zettelkasten/))

This was what triggered my article [No, Luhmann was not about Folgezettel](https://zettelkasten.de/posts/luhmann-folgezettel-truth/) since in his now famous article *Kommunikation mit Zettelkästen* he wrote the following:

> By creating links, we can, without too much work or paper invested, solve the problem of "multiple storage". Using this technique, **it is not important where a new note is placed.** If there is more than one possible place the decision is arbitrary since **the context can be captured by links.** (My emphasis, [my translation](https://zettelkasten.de/communications-with-zettelkastens/) of Luhmann (1993): _Kommunikation mit Zettelkästen_; for a more word-by-word translation by Manfred Kühn, [see here](http://luhmann.surge.sh/communicating-with-slip-boxes))

Luhmann himself remarked the *functional equivalence* of the connection created by the relative placement of a note (parent--child-relationship) and the connection created by a link.

Daniel Lüdecke wrote a nicely titled rebuttal: [You Underestimate the Power of the Dark Folgezettel](https://strengejacke.wordpress.com/2015/11/01/you-underestimate-the-power-of-the-dark-folgezettel/). The core statement of his response is:

> Links or references do not emphasize the relationship between notes (ideas, content). The context of connections usually remains unclear due to arbitrary relationships. ([Source](https://strengejacke.wordpress.com/2015/11/01/you-underestimate-the-power-of-the-dark-folgezettel/))

Let's see what real links and *their contexts* in my Zettelkasten look like. All examples are direct translations from my own Zettelkasten.

## Links That Explore Statements

Some notes elaborate statements that you make in a note. In practice, it looks something like that:

```markdown
<!-- Epistemic presupposition --> If one understands the Fall of Man as the myth of becoming conscious,[[202201121037]] one can investigates these myths to see what consequences becoming conscious has for us as conscious subjects. Perhaps, we manage to conclude from this becoming conscious to the two states of Being.
```

This is one of the notes that starts with an *epistemic presupposition*. It is a conditional sentence which basically means: On the condition of the reliability of the epistemic tools, the following is true. The link above is placed directly after the comma. Any link I place behind a comma refers directly to a note that explores this statement.  The link establishes a relationship between two notes that is specific: One note is the elaboration of a statement that is made in another. The context of this relationship is given by the content of the notes.

This kind of relationship cannot be captured accurately by the Folgezettel technique.

## Links as Topical Entry Points

Some notes refer to topics and not specific thoughts. They can serve as a reminder for your future self to see this note within the context of a wider discourse. Let's see how it looks in practice:

```markdown
The Fall of Man describes the emergence of consciousness and thus self-consciousness.[546][#booker2004] The Fall of Man [[202201011058]] is a mythological contemplation of the emergence of consciousness, which came about and is perhaps necessary because man became aware of his consciousness.
```

This is the first paragraph of the note "*Fall of man as myth of becoming conscious*". It is a basic claim with no further justification. The link is behind the term *The Fall of Man*. This means its link context is just the term itself and not the entire sentence.

I link to the note "*The Fall of Man*" because not only the biblical story is meant. The term refers to an underlying pattern of several myths in my Zettelkasten. Another example for such a myth would be *Pandora's Box*. The link refers to a general note on The Fall of Man because I connect this note to my exploration of this meta-myth pattern *The Fall of Man*. I set my future self up to view the note within a certain context that I set by creating a deviation of a term.

The Folgezettel technique can only capture this relationship once since you have only one place of each note. If you want set this specific context for other notes you need to rely on direct links. But you'll run into other issues if you want to use Folgezettel even for that one chance you get: The parent--child-relationship has no semantic accuracy. There is no meaning behind the fact that a note is a parent or a child to another note. The meaning of the relationship needs to be characterised *individually* if you want to truly understand the connection later on. With the Folgezettel technique, you will create the need to always make sense of the relationships established by this technique on the fly. Your insights into the nature of this relationship would be either lost or require an explanation written on the notes. The Folgezettel technique is not capable of providing the proper connection.

## Links That Provide Additional Information

Some notes contain additional but not directly related knowledge.

```markdown
Archetypes can also be personified as sleeping forces resting within us.[[201812080747]]

The archetype for this is the sleeping god. In stories, he is an externalization for there being hidden powers within us.

1. They rest or sleep. That is, they are not active.
2. They are great but still undirected resources. That is, they are potential and do not yet serve a purpose.
3. Danger automatically follows from (2). If they are awakened wrongly, they are directed against oneself, against the family, the village (community), the world, the cosmos. (cf. the story wheel [[201812051006]] for scaling).
4. But from (2) also follows a great potential for good. If you awaken these forces correctly, they serve you.
5. From (3) and (4) it follows that we must ask ourselves the question of right and bad behavior, of virtues and vices, of the right social environment, and so on.
```

These are the first lines of the note "*Archetype The Sleeping God*". The first link is an expansion of the claim that archetypes can be seen as personifications of untapped powers. This is nothing new: links unfold claims. The second link is something different. There seems to be a sequence of concepts that can be ordered by scale: self, family, village, world, cosmos. Placing a link with no added context would be a bad choice since I would need to click on it to understand why it is placed. Therefore, *I add context* to the link. It refers to the story wheel (a concept by James Bonnet) that I use to scale stories.

The relationship between those two notes is this: one note states that it is dangerous if you wake a sleeping god, and the other states that the danger can be measured by the story wheel.

## The Quality of Links Is Identical With the Provided Context

Let's come back to Daniel's claim:

> Links or references do not emphasize the relationship between notes (ideas, content). The context of connections usually remains unclear due to arbitrary relationships. ([Source](https://strengejacke.wordpress.com/2015/11/01/you-underestimate-the-power-of-the-dark-folgezettel/))

As clearly seen, at least in my own Zettelkasten, links provide not only some context. The context is explicitly stated in the commentary to the link on the note. The relationship is established by explaining it as precise as possible. Let's see what a very low quality connection looks like. This is one of my older notes:

```markdown
# 201209040850 Dietary change is behavioral change.
#nutrition #behavior #nutritionalcounseling

Dietary change essentially means changing behavior. Nutrition habits are first and foremost just that: habits. This means that for dietary change and all related issues (nutritional counseling, lifestyle change, moralizing life) should be seen in the context of behavioral psychology.

cf. [[201208161531]]
```

Here you see some typical mistakes that I made:

1. I used a pathological mix of topic tags (`#nutrition`) and imprecise object tags (`#behavior` is not precise. It should be `#behaviorchange`). (Explore the difference between those tags on this post: [The Difference Between Good and Bad Tags](https://zettelkasten.de/posts/object-tags-vs-topic-tags/))
2. I wasn't conscious at all of the nature of knowledge while processing. For example, I didn't highlight the flow of truth (e.g. making the logical form of the argument explicit) or stating the usefulness of seeing dietary change as behavioral change.

From just looking at the link, can you estimate the relationship to the other note? I guess not. Me neither. What if I provided you with the title of the target note "Gradual Development of Behavior"? You could speculate on its relevance same as I if I didn't remember the connection. What if I'd actually provide a proper link context?

```markdown
If dietary change is subject to the dos and donts of behavioral change we should apply the knowledge of behavioral psychology to dietary change. An example is to apply the principle of gradual habit development [[201208161531]] instead of forcing meal plans on yourself or your clients
```

Now, the nature of the relationship between those notes is crystal clear. But why? How is the link context establishing a relationship between notes? The counter-intuitive answer is that it doesn't. The improvement didn't stem from me using a technique to connect notes. I connected *the knowledge* of each note by establishing the relationship between two thoughts: One being an example (principle of gradual habit development) of the conceptual relationship of ones dietary change, a subset of behavioral change. The established connection of knowledge then is manifested as a link between notes.

> Connect knowledge and not notes.

## The Power Source

So, what is the verdict then? The power source of links is not the mere fact that they are placed, or that they connect notes.

**The power source of links is the nature of the knowledge connection itself.**

I agree with Daniel that context and relationship is what note connection is about. But as I demonstrated, links are an excellent technique to provide context and relationship to the nature of the connection.

And I am yet to witness an example of Folgezettel being able to provide or even to establish an even remotely as rich context.

------

**Christian's Comment:** Ah, yes ... when I search for "cf." (or its German equivalent), I get 484 results! Some are just qualifying citations, so they don't count, but a lot of these are introducing links to other notes. My personal trend to use that stopped around 2014, it seems. That kinda checks out since around that time, Sascha and I were more systematically sharing knowledge about Zettelkasten a lot more, and the website here began to blossom. I do not look back fondly to times of 'confering' to other notes. I much prefer not having to guess when I look around a link anymore. Eliminating guess-work and friction when plowing through the thousands of notes at my disposal every day is much more important than, say, shaving off half a minute when writing a note. Qualifying the link context does that.

---
title: "What and Where is a “Link Context”? Explained Using Citation Conventions"
created_at: 2026-03-03 15:48:51 +0100
kind: article
author: "christian"
tags: [ scientific, citation, reference-management, link,  ]
rel_image: thumb.png
description: "We talk about link contexts a lot. The idea comes from where you place footnotes in scientific writing. Here is a simple explanation with examples so you can get the hang of it, too."
lang: en
canonical: /posts/what-and-where-is-a-link-context-explained-using-citation-conventions/
---
If you haven't been academically trained on the topic of citations, chances are nobody ever told you about basic citation conventions. It's not hard, it's just something you need to learn (and maybe put in your Zettelkasten for reference) once.

I present three examples. I chose the form of a footnote because that's a common way to back up claims that transfers well to other contexts.

These rules also apply to links within your Zettelkasten. Sascha talks about "link context" [in the introduction](https://zettelkasten.de/introduction), and this is exactly that. It's the answer to the question: How do you phrase a sentence so that you know with confidence what you'll find on the other side of the link?

## Word-Level Context

<%= insert_rel_image file: "word.png", caption: %Q{Put a link after a word, then the word is the context} %>

The <code><sup>1</sup></code> is the footnote. If you put it right after a word, it applies to that word only. Use this to expand on concepts or terms. 

What about composites, like terms of art or proper names, that are made up of multiple words? With a useful language like German, you can create infinitely long nouns at whim, so the same rule applies ;)  In English, for example, you have to resort to your language instincts to detect composites.

Examples, with the context highlighted:

<pre>I love <mark>Markdown</mark><sup>1</sup> very much.</pre>

<pre>My <mark>Zettelkasten</mark><sup>2</sup> is an amazing tool.</pre>

<pre>It's time to leave the <mark>stone age</mark><sup>3</sup> of productivity.</pre>

<pre>The <mark>Cirque du Soleil</mark><sup>4</sup> visits town next week.</pre>

Note that the context in one instance is "stone age", not just "age". If you read that, you probably didn't mind the word space. Intuition is all we have.

## Phrases and Sentences

<%= insert_rel_image file: "./sentence.png", caption: %Q{Place a link after ending a sentence, then the context is the sentence (or part of it) before} %>


Sentences and phrases end with punctuation like `.` or `,` or `!`, and sometimes you find punctuation in front and back to define a range, like `(...)` for an aside, `"..."` for a quote, or `¡...!` for a very Spanish exclamation.

Punctuation makes finding the range easy: you need to find the next same-level punctuation mark to know the context. Could be a full sentence, a parenthesis, or subordinate clause.

Examples, with the context highlighted:


<pre>Did you know: <mark>Markdown was invented by John Gruber.</mark><sup>1</sup></pre>

<pre>Niklas Luhmann, <mark>the godfather of the Zettelkasten,</mark><sup>2</sup> lived in Oerlinghausen.</pre>

<pre>Cavemen <mark>(who didn't dwell that much in caves, actually)</mark><sup>3</sup> used stone tools.</pre>

<pre>Cirque du Soleil originated <mark>"as a performing troupe called Les Échassiers"</mark><sup>4</sup> 
with <mark>"[t]heir first official production Le Grand Tour du Cirque du Soleil [...] in 1984"</mark><sup>5</sup>.</pre>

Note I sprinkled in two independent quotes in the last example to show how you can easily embed multiple contexts in one sentence.


## Blocks and Paragraphs

<%= insert_rel_image file: "blockquote.png", caption: %Q{Citing blockquotes is easiest to see because the whole quote is marked as such, and it is similar with links} %>

Blockquotes are quotes that take up multiple lines and aren't easily spliced into the flow of the rest of the text. So you put the quote into its own paragraph, or block. I've seen two approaches to citation there:

1. Introduce the quote and end the introduction with a colon `:` and put the reference there, before the actual quote, or
2. Introduce the quote, include the quote as a block, then put the reference at the end of that block.

While the first approach may work in printed texts, in a Zettelkasten I would favor the latter. If the citation/reference/link is included in the blockquote, you can copy the block as-is and it's still self-contained. That's a very small factor of copy and paste ergonomics, yes, but it's a sign of robustness in the approach.

Examples for both approaches, starting with "reference after introduction":

<pre>
Sascha points out how important link contexts are:<sup>1</sup>

&gt; <mark>This type of connection is where one of the leading knowledge</mark>
&gt; <mark>creation mechanisms of the Zettelkasten is found: The meaning of the</mark>
&gt; <mark>link, the why of the link, is explicit. The explicit statement of</mark>
&gt; <mark>the why is created knowledge.</mark>
</pre>

... and "reference after blockquote":

<pre>
Sascha points out how important link contexts are:

&gt; <mark>This type of connection is where one of the leading knowledge</mark>
&gt; <mark>creation mechanisms of the Zettelkasten is found: The meaning of the</mark>
&gt; <mark>link, the why of the link, is explicit. The explicit statement of</mark>
&gt; <mark>the why is created knowledge.</mark><sup>1</sup>
</pre>

## Application to your Zettelkasten

[Connecting notes is the bread and butter](https://zettelkasten.de/introduction/#connecting-zettel) of the sandwich-making that is using your Zettelkasten.

With these three simple cases of detecting contexts, you can now also _design_ your notes with confidence to maximize readability:

You can start with a link to somewhere and then decide what the context would need to look like:

- Is the target note explaining a concept? Put the link next to a word.
- Is the target note backing up a claim? Put the link after the sentence that represents your claim.
- Is the target note just itself, an item in a structure like an enumeration or list, or a table? Put the link next to the (shortened, if needed) title of the note.

----

**Sascha's Comment:** There is little to add. A highly practical article by Christian. But there is a context that I'd like to make you aware of. Many skills to create good notes are not specific to the Zettelkasten Method. Rather, they come from various domains. Another example is how to deal with arguments. There is no Zettelkasten specific way. Instead, you apply your existing skills to the arguments you want to process like: Identifying the premises, the conclusion and the logical form; adding notes on the strengths and weaknesses of the argument; providing empirical evidence for the truth of the premises.



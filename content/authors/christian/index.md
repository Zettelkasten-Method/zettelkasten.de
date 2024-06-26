---
title: About Christian
updated_at: <%= sorted_posts_by('christian')[0][:created_at] %>
toc: manual
---

<img src="/authors/christian/profile-christian.jpg" class="author-profile-picture">

Hello, my name is Christian, I'm a programmer first, writer second, and I really like to work with my Zettelkasten to capture everything that can be written down!

Quickly jump to a sub-section of this page:

- [Recommendations for Zettelkasten newbies](#recommendations)
- [My Zettelkasten Trivia & Statistics](#trivia-statistics)
- [All posts by me](#posts-by-christian)

## I Use My Zettelkasten to Write With Purpose

I love to type, and that in part drives my motivation to write. And when I write, I want to be writing to some purpose.

The Zettelkasten Method helps me maintain a purposeful writing practice. Piece by piece I work on something that can be published to help readers learn something.

The Zettelkasten is a tool to keep everything I learn in one place, and the Zettelkasten _Method_ supports me in creating something new from that, deriving ideas from self-made structures of knowledge.

Over the past decade, this combination helped me to learn what I know about software development. Not only do I not forget the details anymore (well, I do forget, but I know what to look up in no time), I also produce articles and books based on this. These products _almost_ appear out of thin air. Do you know how they say that the proverbial "overnight success" of startups is preceded by many years of hard work? The Zettelkasten Method makes putting in constant effort simple (albeit not easy), and that's how I prepare complex projects as a by-product of my daily research and work.

## My Zettelkasten & My Software Development

Even though I met Sascha through Philosophy seminars at University, I'm a **software developer** by trade and am responsible for progress on our app, [The Archive](https://zettelkasten.de/the-archive). In my part-time I'm working on a grandiose "Theory and Practice of Independent Software Development" -- that's the tongue-in-cheek title of things I've learned [and published](https://christiantietze.de/books/) about software development.

I don't dedicate time to work with my Zettelkasten and advance writing projects since I'm too busy programming. But I use my Zettelkasten every day to solve problems and work on long-term projects.

Just three examples that are related to programming:

- **Code snippets**: I capture small pieces of code to illustrate something I learned. I comment on the code and its use and why I think it's important.
- **Facts, descriptions, and explanation**: To learn about new technology (e.g. how to manage a web server, how Bitcoin works under the hood), I capture information the same way academics cite sources. I connect pieces to create an overview of topics, accompanied by aforementioned code snippets to show how it's down.
- **Higher-level concepts**: Things like cognitive fallacies, planning techniques, modes of thinking, and how to live a good life as a software developer.

## Recommendations

You get better by putting in the work.

Practice is the touchstone of all fancy ideas and theories. Some stuff I thought was useful didn't survive contact with reality. No planning can prepare you for what helps you down the road. We're all a bit different from each other in our approaches.

I think it's useful to have a playful attitude and be open for making mistakes. [All notes are malleable](https://zettelkasten.de/posts/literature-notes-vs-permanent-notes/). When you revisit notes, improve them. That's the boyscout rule of Zettelkasten. <!--ct: TODO: Meme/Bild posten-->

Experiment, revise, take note of your findings (and grow a department about your Zettelkasten inside your Zettelkasten!). The worst thing you is not to make mistakes along the way, it's to never have started at all. Course corrections are inevitable.

Do get feedback to get unstock. [Sascha's coaching](https://zettelkasten.de/coaching) might be for you! And [show the community what you're up to](https://forum.zettelkasten.de) and ask questions to learn from other people's journeys.

## Trivia & Statistics

Have a peek over my shoulder and look at my setup and current state of things. (As of 2020-12-27)

- Here's a part of the note stats from my Zettelkasten:

    | Date       | # notes |
    |------------|--------:|
    | 2012-01-29 |    1463 |
    | 2013-01-01 |    2471 |
    | 2015-02-02 |    3457 |
    | 2018-01-01 |    4692 |
    | 2019-01-01 |    5101 |
    | 2021-01-01 |    5924 |
    | 2022-01-01 |    6562 |
    | 2023-01-01 |    8372 |
    | 2024-01-01 |    9043 |


    <%= insert_rel_image file: "2020-12-27_stats.png" %>

- I have at least **50** ongoing writing and research projects in my Zettelkasten. And that's all side-projects.
- One is about [macOS text editor programming](https://christiantietze.de/posts/cocoa-text-system/) -- I rank pretty high on Google when you look for anything related to text editing and macOS and programming. So even though I don't have a publication (like a book) on the topic, I still benefit from the research by having more eyeballs-per-month on my website!
- I might be peculiar with these things, but I moved journalling and task management and such things out of my Zettelkasten and into Emacs org-mode files to keep them organized. My Zettelkasten consists of atomic, reusable, composable pieces of text, plus notes to structure them.

And this is what my Zettelkasten environment in The Archive looks like:

<%= insert_rel_image file: "2020-12-27_ct_setup.png", caption: "My Zettelkasten Setup" %>

# Posts by Christian

<%=email("hi@christiantietze.de", text: "Email Christian")%>  &bull;  Get his posts as an [RSS Feed](/authors/christian/feed.atom).

<% partitioned_by_year(sorted_posts_by('christian')).each do |year, months| %>
<section class="posts_group inset-box">
  <header>
    <h2 id="year-<%= year %>"><%= year %></h2>
  </header>
  <div class="allposts posts_list">
    <% months.each do |month, posts| %>
      <% posts.each do |post| %>
        <%= render '/_post-archive.*', :post => post, :month => month, :show_author => true %>
      <% end %>
    <% end %>
  </div>
</section>
<% end %>

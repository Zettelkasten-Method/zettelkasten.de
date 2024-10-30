---
title: About Sascha
updated_at: <%= sorted_posts_by('sascha')[0][:created_at] %>
toc: true
---

<p>Hi,</p>
<img src="/authors/sascha/sascha-leini-profile.jpg" class="author-profile-picture">
<p>I am Sascha. I write and coach for a living. I worked on the Zettelkasten Method to build tools for my personal knowledge work. I began to teach some of my clients my method and discovered that they had great success with that. So I now work on this project with Christian to provide the world with the best solutions to knowledge work problems.</p>

## How I use my Zettelkasten

I use my Zettelkasten for *all* of my knowledge work:

- I use my Zettelkasten for research on biochemistry, nutrition, training, meditation -- basically everything on health, fitness and robustness of body and mind. This is part of my job as a personal trainer.
- I use my Zettelkasten for background research and worldbuilding for my fiction writing.
- I use it to support my work on philosophy and ethics.
- I use it to analyse movies.
- I use it to organise my dog training.
- I use my Zettelkasten for writing fiction fragments that form whole the stories.

## Tips for Beginners

1. Read the [introduction to the Zettelkasten Method](https://zettelkasten.de/introduction).
2. Don’t hesitate. Commit yourself to action and learn by doing. The Zettelkasten Method is 10% knowledge and 90% skill. Skills are developed through practice. A lot of practice.
3. Start thinking about the Zettelkasten Method as a tool to accomplish a task. Learn it by using it for that task. Try to do research on a blogpost, or process a book you are excited about.
4. Try to think on how to connect knowledge and not on connecting notes.

Live long and prosper!<br>
Sascha

PS: [I offer 1-on-1-coaching](https://zettelkasten.de/coaching) if you want to learn the Zettelkasten Method from an experienced person.

# Posts Written by Sascha

- <%=email("saschafast@gmail.com", text: "Email Sascha")%>
- Get Sascha's posts as an [RSS Feed](/authors/sascha/feed.atom).

<% partitioned_by_year(sorted_posts_by('sascha')).each do |year, months| %>
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

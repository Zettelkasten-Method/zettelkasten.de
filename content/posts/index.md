---
title: Blog Post Archive
lang: en
canonical: "/posts/"
toc: true
---

<%= render '/_search_box.*' %>

<hr>

👉 [**Get started** with the curated article overview](/overview/)! 👈

* **Posts [by our amazing community contributors](/authors/guests/)** -- thanks, folks!
* Post by [Christian](/authors/christian/) and [Sascha](/authors/sascha/).
* Posts by year: <%= (2013..Date.today.year).to_a.reverse.map { |y| %Q{[#{y}](/posts/#{y}/)} }.join(", ") %>
* [List of tags](/posts/tags/).

<hr>

<% partitioned_sorted_posts_by_year().each do |year, months| %>
<section class="posts_group">
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

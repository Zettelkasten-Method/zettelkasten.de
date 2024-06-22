---
title: Posts written by Guest Authors
toc: true
---

Are you interested in contributing a gem of Zettelkasten wisdom? Get in touch with us via e-mail: write to <a href="mailto:&#x68;&#x69;&#x40;&#x7A;&#x65;&#x74;&#x74;&#x65;&#x6C;&#x6B;&#x61;&#x73;&#x74;&#x65;&#x6E;&#x2E;&#x64;&#x65;">&#x68;&#x69;&#x40;&#x7A;&#x65;&#x74;&#x74;&#x65;&#x6C;&#x6B;&#x61;&#x73;&#x74;&#x65;&#x6E;&#x2E;&#x64;&#x65;</a>!

<% partitioned_by_year(sorted_posts - sorted_posts_by('christian') - sorted_posts_by('sascha') - sorted_posts_by(nil)).each do |year, months| %>
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

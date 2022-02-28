---
title: Posts written by Guest Authors
---

<section id="posts">
<% partitioned_by_year(sorted_posts - sorted_posts_by('christian') - sorted_posts_by('sascha') - sorted_posts_by(nil)).each do |year, months| %>
  <h2><%= year %></h2>
  <ul class="allposts">
  <% months.each do |month, posts| %>
  <% posts.each do |post| %>
  <%= render '/_post-archive.*', :post => post, :month => month, :show_author => true %>
  <% end %>
  <% end %>
  </ul>
<% end %>
</section>

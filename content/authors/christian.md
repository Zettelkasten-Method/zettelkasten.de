---
title: Posts written by Christian
---

<section id="posts">
<% partitioned_by_year(sorted_posts_by('christian')).each do |year, months| %>
  <h2><%= year %></h2>
  <ul class="allposts">
  <% months.each do |month, posts| %>
  <% posts.each do |post| %>
  <%= render '_post-archive', :post => post, :month => month %>
  <% end %>
  <% end %>
  </ul>
<% end %>
</section>

---
title: Posts written by Sascha
---

<a href="mailto:&#x73;&#x61;&#x73;&#x63;&#x68;&#x61;&#x2E;&#x66;&#x61;&#x73;&#x74;&#x40;&#x67;&#x6D;&#x61;&#x69;&#x6C;&#x2E;&#x63;&#x6F;&#x6D;">Email Sascha</a>, or get his posts as an [RSS Feed](/authors/sascha/feed.atom).

<section id="posts">
<% partitioned_by_year(sorted_posts_by('sascha')).each do |year, months| %>
  <h2><%= year %></h2>
  <ul class="allposts">
  <% months.each do |month, posts| %>
  <% posts.each do |post| %>
  <%= render '/_post-archive.*', :post => post, :month => month %>
  <% end %>
  <% end %>
  </ul>
<% end %>
</section>
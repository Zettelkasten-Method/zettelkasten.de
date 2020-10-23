---
title: Posts written by Christian
---

<%=email("hi@christiantietze.de", text: "Email Christian")%> and get his posts as an [RSS Feed](/authors/christian/feed.atom).

<section id="posts">
<% partitioned_by_year(sorted_posts_by('christian')).each do |year, months| %>
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

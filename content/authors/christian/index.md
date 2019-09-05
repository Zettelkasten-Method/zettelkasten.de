---
title: Posts written by Christian
---

<a href="mailto:&#x68;&#x69;&#x40;&#x63;&#x68;&#x72;&#x69;&#x73;&#x74;&#x69;&#x61;&#x6E;&#x74;&#x69;&#x65;&#x74;&#x7A;&#x65;&#x2E;&#x64;&#x65;">E-mail Christian</a> or get his posts as an [RSS Feed](/authors/christian/feed.atom).

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

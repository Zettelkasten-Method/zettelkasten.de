---
title: Posts written by Sascha
---

Get in touch with Sascha <a href="mailto:sascha.fast@gmail.com">via email</a>.

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
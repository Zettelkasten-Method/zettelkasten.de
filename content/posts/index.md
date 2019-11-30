---
title: Blog Post Archive
---

👉 [**Get started** with the curated article overview](/posts/overview/)! 👈

* **Posts [by our amazing community contributors](/authors/guests/)** -- thanks, folks!
* Post by [Christian](/authors/christian/) and [Sascha](/authors/sascha/).
* Posts by year: <%= (2013..2019).to_a.reverse.map { |y| %Q{[#{y}](/posts/#{y}/)} }.join(", ") %>
* [Zettelkasten Live](/live/) vlog series.
* [List of tags](/posts/tags/).

<%
# 
#-----
#
#<%= render '/_newsletter_signup.*' %>
#
%>

-----

<% partitioned_sorted_posts_by_year().each do |year, months| %>
<h2><%= year %></h2>

<ul class="allposts">
<% months.each do |month, posts| %>
<% posts.each do |post| %>
<%= render '/_post-archive.*', :post => post, :month => month %>
<% end %>
<% end %> 
</ul>

<% end %>

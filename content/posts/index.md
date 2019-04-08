---
title: Blog Post Archive
---

**Getting started:** look at the [curated article overview](/posts/overview/)!

Also have a look at [Zettelkasten Live](/live/), our ongoing video blog.

For reference:

* Posts with short excerpts by year: [2018](/posts/2018/), [2017](/posts/2017/), [2016](/posts/2016/), [2015](/posts/2015/), [2014](/posts/2014/), [2013](/posts/2013/).
* **Posts [by our amazing community contributors](/authors/guests/)** -- thanks, folks!
* Post by [Christian](/authors/christian/) and [Sascha](/authors/sascha/).
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

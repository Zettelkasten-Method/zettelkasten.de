---
title: Schlagworte
layout: plain
lang: de
canonical: "/posts/tags/"
custom_path: "/de/posts/tags/"
---

<%= render '/_language-switch.*' %>

<ul>
<% @items.select { _1[:kind] == "tag" && _1[:lang] == item_lang }.sort { _1[:tag] <=> _2[:tag] }.each do |tag| %>
  <li><%= link_to(tag[:tag], tag.path) %></li>
<% end %>
</ul>

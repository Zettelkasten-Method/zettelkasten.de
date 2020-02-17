---
title: Tags
layout: plain
---

<ul>
<% tags().map { |tag, _| tag }.sort.each do |tag| %>
    <li><%= Tag::link_to(tag) %></li>
<% end %>
</ul>
---
title: Tags
---

<ul>
<% tags().each do |tag| %>
    <li><%= Tag::link_to(tag) %></li>
<% end %>
</ul>
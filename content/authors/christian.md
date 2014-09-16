---
title: Posts written by Christian
---

<section id="posts">
<% sorted_posts_by('christian').each do |article| %>
    <%= render '_post', :post => article %>
<% end %>
</section>

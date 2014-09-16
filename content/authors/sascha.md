---
title: Posts written by Sascha
---

<section id="posts">
<% sorted_posts_by('sascha').each do |article| %>
    <%= render '_post', :post => article %>
<% end %>
</section>

---
title: Posts written by Sascha
---

Get in touch with Sascha <a href="mailto:sascha.fast@gmail.com">via email</a>.

<section id="posts">
<% sorted_posts_by('sascha').each do |article| %>
    <%= render '_post', :post => article %>
<% end %>
</section>

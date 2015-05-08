---
title: Post Archive
---

Welcome to the article and blog post archive of the Zettelkasten Method! Here you'll find everything -- from our research results to workflow tweaks.

Do you prefer a **guided introduction**? Take a look at our [article overview](/posts/overview/).

You may also want to browse posts **by topic** through our [list of tags](/posts/tags).

Do you prefer to explore what happened **chronologically**? There you go:

* [Posts from 2015](/posts/2015)
* [Posts from 2014](/posts/2014)
* [Posts from 2013](/posts/2013)

You can also browse our posts **by author**. There's [Christian's posts](/authors/christian), and there are [Sascha's posts](/authors/sascha).

To stay on top of everything, feel free to sign up to our mailing list.

<%= render '_newsletter_signup' %>

If you just want to get started with all of this, take a look at our 10 most recent posts and make sure to check out the awesome comments!


# The 10 Latest Posts

<% sorted_posts()[0..10].each do |post| %>
  <%= render '_post', :post => post %>
<% end %>

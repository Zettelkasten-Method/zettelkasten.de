---
title: Blog Post Archive
lang: de
canonical: "/posts/"
custom_path: "/de/posts/"
---

<%= render '/_search_box.*' %>

----------

👉 [**Erste Schritte** mit der Artikelübersicht](/posts/overview/)! 👈

<!-- TODO: create translated overviews
* Beiträge für jedes Jahr: <%= (2013..Date.today.year).to_a.reverse.map { |y| %Q{[#{y}](/posts/#{y}/)} }.join(", ") %>
* [Zettelkasten Live](/live/) vlog series.
-->

<!--TODO: Autorenseiten übersetzen-->
* Beiträge von [Christian](/authors/christian/) und [Sascha](/authors/sascha/).
* **Beiträge [unserer fantastischen Community](/authors/guests/)** -- vielen Dank!
* [Liste aller Schlagworte](/de/posts/tags/).

<hr>

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

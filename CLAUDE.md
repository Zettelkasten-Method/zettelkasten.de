# zettelkasten.de

Nanoc static site. Posts live in `content/posts/YYYY/MM/<slug>/index.md` (or a flat `.md`). German variants use `de.md` alongside `index.md`.

## Post frontmatter

```
title, created_at, kind: article, author, tags, rel_image, description
```

- `rel_image` points at a teaser image in the post folder; render it in-body with `<%= insert_teaser caption: %Q{...} %>`.
- Embed videos with `<%= insert_youtube "<id>" %>`.

## Images

IMPORTANT: `rel_image` teasers ship as-is. Only `blog_img/*` (the old `image:` frontmatter) goes through `rake thumb`; post-folder assets are copied verbatim by nanoc with no resize or compression. So optimize the teaser yourself before committing.

- Convert teasers to **WebP** and downscale to ~1200px wide:
  ```
  magick <source> -resize '1200>' -quality 82 gym-for-the-mind.webp
  ```
  A multi-MB PNG (e.g. a ChatGPT/AI image) becomes ~50 KB. Set `rel_image: ./<name>.webp`.
- Keep **PNG** only for screenshots / line art / text-heavy images where WebP or JPEG artifacts hurt.
- AI-generated teasers need no attribution caption; call `<%= insert_teaser %>` bare.

## Tags

IMPORTANT: Do NOT invent new tags. Reuse tags that already exist on the site.

1. Before tagging a post, find the existing vocabulary first:
   ```
   rg --no-filename "^tags: \[" content/posts | sed -E 's/^tags: \[//; s/\]//' | tr ',' '\n' | sed -E 's/^ +| +$//g' | grep -v '^$' | sort | uniq -c | sort -rn
   ```
   Pick tags from that list that fit the post. Prefer established tags (higher counts) over rare one-offs.
2. If no existing tag captures an important theme and you believe a new tag is warranted, do NOT add it silently. Propose the new tag(s) to the user with the `AskUserQuestion` tool and let them decide.
3. English posts use English tags; German posts (`de.md`) use the German tags already in use (e.g. `Verzetteln`, `Lesen`, `Produktivität`).

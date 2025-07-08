# Zettelkasten Website

## Development

### Prerequisites

- Ruby 3.2+ <https://www.ruby-lang.org/en/>, e.g. via `brew install ruby` (macOS/Linux via Homebrew)
- Dart Sass 1.77+ <https://sass-lang.com/install/>, e.g. via `npm` 

Install the Ruby dependencies to build the site:

```sh
# Make sure you have a recent Ruby Bundler
$ gem update bundler
# Install dependencies from Gemfile.lock
$ bundle install 
```

Using `mise`:

```sh
$ mise exec -- bundle install
```

### Preview

To get a live preview of your changes, compile and serve via:

```sh
$ mise task run server
# Alternatively, call directly:
# $ bundle exec nanoc live
View the site at http://127.0.0.1:3000/
[2024-06-19 12:29:36] INFO  WEBrick 1.8.1
[2024-06-19 12:29:36] INFO  ruby 3.2.0 (2022-12-25) [arm64-darwin22]
[2024-06-19 12:29:36] INFO  WEBrick::HTTPServer#start: pid=38268 port=3000
Compiling site…
```

The locally served site is reachable from `http://127.0.0.1:3000/` then.

To speed-up compilation, use nanoc's "focus" feature. The following will only recompile CSS files, images, and the landing page, reducing re-compilation times from 20s to <1s:

```sh
$ bundle exec nanoc live --focus "/css/*" --focus "/img/*" --focus "/index.html"
```

Note that the paths aren't file path, but [nanoc Identifiers and Routes](https://nanoc.app/doc/identifiers-and-patterns/).


---
title: So You Want to Write a Plug-in For The Archive? - Plug-In Development – The Archive
created_at: 2024-10-11 18:59:00 +0200
layout: the-archive
description: "Tutorial for developers of The Archive plug-ins."
toc: true
updated_at: 2024-11-07 12:11:21 +0100
---
# So You Want to Write a Plug-in For _The Archive_?

<style type="text/css"><!--
table {
  border-collapse: collapse;
  font-size: 80%;
}
table td, table th {
  padding: 0.3rem 0.5rem;
  border: 1px solid darkgray;
  vertical-align: top;
}
--></style>

Great! Here's how to get started with the tools provided by _The Archive_ to make plug-in development easy.

## Start Development Within _The Archive_

_The Archive_ provides a plug-in development tool. Use it to interactively write, test, and export plug-ins.

From the app's main menu, go to <i>Plugin - Show Developer Console</i> to get started.

### The Plug-In Development Window

<%= insert_rel_image file: "plugin-development-screenshot.png", caption: "The built-in plug-in development tool" %>

On the left, you have these three programming components:

1. The JavaScript editor. It's an auto-saving scratchpad for your code. Upon exporting, this becomes your [`main.js` file](/the-archive/help/plugins/bundle-format/) that'll be executed.
2. The console log. It shows any output your plug-in generates. It also lists settings changes an other status messages.
3. The console <abbr title="Read-Eval-Print Loop">REPL</abbr>. You can enter any JavaScript expression there, an it will evaluate once you commit with Enter/Return (<kbd>⏎</kbd>). You can also access previous expressions with <kbd>⌘↑</kbd> and <kbd>⌘↓</kbd>. Use the "Reset" toolbar button if you want to e.g. clear all variable and function declarations that linger from previous executions.

On the right, you have **the Plug-In Settings Inspector** that configure [your plug-in Manifest file's](/the-archive/help/plugins/bundle-format/) access privileges to resources like all notes in the app, or the currently edited note's content. While it can be a bit tedious to configure these things, it's an important safety measure to protect plug-in users -- especially those who are less tech-savvy! Without a proper declaration, it's impossible for plug-ins to get a hold of your notes. Users can be sure when their data is safe.

The "Copy Settings as JavaScript" button in the sidebar generates boilerplate to work with the global JavaScript objects that correspond to your settings.

On the top of the window, the toolbar offers:

- a "Run" button that immediately executes your work-in-progress plug-in code with the environmental settings from the inspector,
- an "Export" button to save your plug-in for you with the current settings from the inspector.
- The "Reset" button resets the interactive REPL. When you build up expressions or script ideas in the REPL, you may want to start fresh and clear all variable or function declarations.

> ### Prefer to Start With a Plug-In Template?
> 
> To get started developing a plug-in with your favorite editor, [use our plug-in project template on GitHub](https://github.com/Zettelkasten-Method/plug-in-template).
>
> Make sure to take a look at the [`.thearchiveplugin` bundle format overview](/the-archive/help/plugins/bundle-format/) so you know what goes inside the product!

### Exploring Plug-In Writing with the REPL

When building plugins, it's useful to learn how to **ask the program what a value is** before running your entire plugin. This saves time and allows you to work step-by-step. You can use the REPL (Read-Eval-Print Loop) to experiment interactively without needing to run everything all at once.

In the REPL, you can:

- Add one function or piece of code at a time.
- Test your code immediately after writing it.
- Refine or adjust as you go.

The **REPL's context** stays active until you hit the **Reset** button at the top of the window. For example, if you declared:

```js
const x = 2;
```

and later decide `x` should have a different value, you won't be able to change it directly (because `const` constants are unchangeable). In that case, resetting the REPL will give you a fresh start.

> 💡 **Pro Tip**: Use `let` or `var` in the beginning for variables. These can be reassigned. You can switch to `const` and other best practices later, once your code works.

#### Accessing Variables

The settings in the inspector sidebar control which variables your plugin has access to.

You start with no special access by default, and you'll need to enable what you need. For instance, if you turn on access to _Selected Notes_, the variable `input.notes.selected` will become available.


#### Discovering What's Available with REPL

To see what built-in objects you can access, start by typing `input` in the REPL. This will show both your code and the resulting value, directly above the text field:

```js
> input
⇠ [object Object]
```

However, JavaScript's built-in reflection isn't very descriptive. So, to get more detail about what's inside `input`, you can use a helper function built into the app, called `dump`. Here's how:

```
> dump(input)
⇠ {
  "notes": {
    "selected": {
      "0": {
        "path": "/path/to/notes/Learning JavaScript.txt",
        "filename": "Learning JavaScript",
        "content": "#professional #js is easy! See [[how to learn anything]]",
        "tags": {
          "0": "professional",
          "1": "js"
        }
      }
    }
  }
}
```

Now, you can see much more clearly:

- `input` has a `notes` property.
- `notes` has a `selected` property.
- `selected` is an array (or object) with one element (`0`).
- Element `0` represents a note you're working with, including properties like the file path, title, tags, and full content.

You can access the selected note's content directly like this:

```js
input.notes.selected[0].content
```

#### Dumping the Global Context

You can inspect **everything** available to your script by calling:

```js
dump(this);
```

Here, `this` represents the **global context** when you aren’t inside any function or object. This will list all globally available functions and variables you can use -- including the `dump` function itself.

#### Additional Tips

- ✅ When experimenting in the REPL, avoid using `const`, unless you're confident it won’t change later. Instead:
  - Use `let` or `var` for variables to keep them flexible.
  - If you need to define a function, prefer `function myFunc() { ... }` over `const myFunc = () => { ... }`, because traditional function declarations are easier to replace during development.
- 🔄 Once you finish and your code is working, you can refactor it to use `const` and more idiomatic JavaScript.

## Exporting and Sharing Plug-Ins

From the development tool, you can export your plug-in as a `.thearchivebundle` with an interactive wizard. See [the bundle format overview](/the-archive/help/plugins/bundle-format/) for what goes inside.

- **Title**: User-facing title of your plug-in. Will be shown in plug-in listings in the app and online.
- **Identifier**: The unique plug-in ID. This will be the same as the bundle file name. Prefer to use reverse domain format to group plug-ins by creator and avoid name conflicts for generic plug-in names. Ours will start with `de.zettelkasten.`.
- **Description:** User-facing descriptive text. Will be shown in plug-in listings in the app and online. You can use Markdown.
- **Release date:** Current day in ISO format (`YYYY-MM-DD`). This will be pre-filled to your computer's current date.
- **Plug-in version**: This is the version of your creation. Please use [semantic versioning](https://semver.org/) where possible, e.g. to signal "something is very different" when you go from `1.x.x` to `2.x.x`. (This will be even more important when other plug-ins can import your code in the future.)<!-- TODO: Remove remark when plug-in dependencies are implemented-->
- **App version**: This is the version of _The Archive_ you want to target. To ensure that your plug-in can run on the user's computer, this version needs to be set to the version that introduces a feature you want to use. Currently, the only target version that works is `1.8.0`, but we plan to introduce new features in the future that won't be available to `1.8.0`-targeting plug-ins.
- **Can read** and **Effects when run** list the privileges requested by the plug-in, as configured in the Manifest inspector, and like the user will see them in plug-in listings.

The export wizard remembers some of your settings, like your name, to ease exporting future plug-ins.

## Examples Use Cases

### How to Read the Current Note's ID

Request _Selected notes_ access in the inspector. This will contain 1 note object when the user edits a note, or 0 if the user has selected no note, or more than 1 if the user selects many. While users can _select_ multiple notes, it's not possible to _edit_ multiple notes in one window. So if there's just 1 note, that means the user is also looking at it in the editor.

The plug-in code boilerplate generated by _Copy Settings as JavaScript_ will then produce:

```js
// Each note object has these properties:
// - `path`: The absolute POSIX path to that file.
// - `filename`: The filename without extension.
//    (Can be considered the title.)
// - `content`: The full text of the note.

// Array of selected notes. Can be empty, the currently visited (edited) note,
// or multiple notes for bulk operations.
const selectedNotes = input.notes.selected;

// 📝 Your Script Goes Here!
```

To get the filename of the currently edited note, and abort if none or too many are selected, write your script like so:

```js
if (selectedNotes.length !== 1) {
  cancel(`Editing 1 note required, but user selected ${selectedNotes.length} notes.`);
}

const currentNote = selectedNotes[0];
const currentNoteID = app.extractNoteID(currentNote.filename);
```


### How to Resolve Links to Other Notes

Sometimes, you may want to process links from a note, and then get access to the content of the linked-to notes. How do you find the link targets?

The Archive operates on a "links as search" basis. That means do link to a note called `202411071128 My best note ever` and effectively get there, you can link to:

- `[[202411071128 My best note ever]]`, the full title;
- `[[202411071128 My best note]]`, almost the full title;
- `[[202411071128]]`, just the identifier.

From a search-centric perspective, the more you type of the full title of a note, the more you zoom in to get to 1 result, only. Character for character, you add precision. "My" is worse than "My best" is worse than "My best note" is worse than "My best note ever" to get to this particular note. Identifiers are superior in that regard because they ae unique, and they are stable shortcuts that easily survive a note being renamed. [We wrote about this.](https://zettelkasten.de/posts/add-identity/)

Now The Archive tries to suggest a "best match" for your search query to make accessing a note you know exists as quick as possible from the search bar. That's why ID's work so well as an effect.

You can use the same mechanism from your plug-ins.

- Request access to all notes. Make sure your script can access `input.notes.all` without failure.
- Use [`app.search(...)`](/the-archive/help/plugins/api/) with the link text, e.g.: `app.search("202411071128")` for an ID-only link like `[[202411071128]]`.
- The function returns an object with a `results` and `bestMatch` property. `results` is the sorted list of notes that users would see in the search results list; the `bestMatch` property, if it's not empty, is the known best match for the link.

An example in code to resolve this hard-coded identifier:

```js
let link = "[[202411071128]]";
let fulltextOfLinkedNote = "";

// The 2nd parameter, set to `false`, speeds up link resolution: 
// It skipts the `results` array and only returns `bestMatch`.
let searchResponse = app.search(link, false);
let linkTarget = searchResponse.bestMatch;
if (linkTarget) {
    fulltextOfLinkedNote = linkTarget.content;
}

// Do something with the matched note, e.g. display it in a window:
output.display.content = fulltextOfLinkedNote;
```

This is very useful when you want to loop over all links in a note, use the search to resolve each link, and e.g. show a transcluded version of the result.




## Your Plug-in's Lifecycle

Your plug-in runs in a clean sandbox environment every time. It is unaffected by previous plug-in executions, no matter if it's your plug-in or someone else's. In technical terms, there's no shared mutable state you need to worry about. **The only shared state is available in the user's note files.**

As a result, you can focus on writing your plug-in so that:

1. it gathers information from the app and the user,
2. performs a computation, and then
3. produces an effect that is carried out by the app.

Your plug-in behaves like a sub-routine or "function". You implement the algorithm "in the middle" to perform the computation, and rely on _The Archive_ to provide the inputs at the beginning and carry out the effects in the end.

### One Plug-In, One Effect

Plug-ins are designed to and encouraged to perform _one_ effect, which is carried out by _The Archive_ immedately when the plug-in's code finishes execution.

For example, you cannot write a plug-in that creates thousands of files for the user in a loop.

But you can tell the app to carry out 1 effect like file creation once the plug-in successfully finished computation.

The key difference to imperative programming that you may do in e.g. Python scripts is that your plug-in _describes_ the desired effect only. It does not actually execute it. _The Archive_ interprets the effect you describe and then executes it at the end for you.

This ensures that user's data is safe (you cannot delete or overwrite all of their precious notes) and secure (you cannot upload it anywhere from within plug-ins).

This approach currently reduces the potential power of automation within _The Archive_. We encourage plug-in authors to re-think what you want to achieve in terms of purely functional value transformations. Reduce the scope of what your plugin does to 1 thing, and in turn help your users understand what they sign up for when they install your plug-in. 

> Future plug-in system updates will include composition of plug-ins to express more complex behavior, and remote-controlling the app on the user's behalf. Eventually, the plug-in system will also incorporate inherently dangerous capabilities -- i.e. those that _The Archive_ cannot check or validate properly, like running external applications. We'll get to that point in iterations.

### What "Value Transformations Over Imperative Code" Means for You

From _The Archive_'s perspective as much as the user's, your plug-in is a black-box that performs some computation on inputs provided by the app, and producing a description of an effect that is handed back to the app to be executed. The part in the middle that is the computation of the change is a function that transforms the inputs into an effect. Depending on your experience, this may require some re-thinking.

Say you want to write a plug-in that transforms each line of the selected text into an enumerated list, but using alphabetical notation like `a)`, `b)`, `c)`, etc.

If you were taugt the imperative mindset in the past, and think of this task in terms of automating what the user does, you would want to move the cursor to the beginning of the first line and insert `"a) "`, then move to the beginning of the next line and insert `"b)"`, and so on until you reach the end of the selection, similar to how the user would move the cursor with the arrow keys and type to insert text. Imitating what the user would do is a reasonable mental model of an automation. Because you moved the cursor, the selected range of text is gone, though, and you wouldn't know when to stop prepending enumerated list markers. So you have store the selection's end location before you begin moving the cursor around. Say the selected range was from character location `100` to `1000` in the text. Because your automation inserted two enumerations plus a space each by this point, `"a) "` and `"b) "`, you have changed the text's total length by 6 characters. This affects when you need to stop, so you need to add `+3` to the end location `1000`, getting `1000+3+3=1006`. In other wirds, the more text you insert, the more the location of the character that used to be at the end of the user's selection in the text moves away, and you need to keep track of this. Now if you abort the process in the middle for any reason (could be a bug in the computation of the next enumeration character in the alphabet after "z" that produces an error, for example), the users ends up with a half-finished change to their note, but overall it's in an unexpected state. In some cases when your automation fails mid-process, this could mean that the user _loses data_, which is very unpleasant.

Pseudo code for the imperative approach:

```
// Pseudo Code
set enumerationCharacter to "a"
set endLocation to the selectedRange's current endLocation
moveToBeginningOfLine
while cursor location < endLocation {
  // Insert enumeration
  insert enumerationCharacter
  insert ") "

  // Adjust the stop condition
  set endLocation to endLocation
    + length of enumerationCharacter
    + length of ") "
  set enumerationCharacter to next character in alphabet

  // Move to beginning of next line
  moveCursorToEndOfLine
  moveCursorRight
}
```

If instead you think about your whole plug-in as a single value transformation, you can grab the selected text from the app, then split it by line breaks, prepend a suitable enumeration character to each line, merge all lines back together, and finally tell the app to replace the selection with that computed result. You don't need to move the cursor at all, and conversely can't make a mistake on that front. Any fatal error during the plug-in's execution aborts the computation and no effect will be carried out.

Plug-in code to perform this transformation:

```js
// Produces 0=>"a", 1=>"b", ..., 25=>"z", 26=>"aa", etc.
const enumerationCharacter = (i) => {
  let letters = '';
  while (i >= 0) {
    letters = String.fromCharCode((i % 26) + 97) + letters;
    i = Math.floor(i / 26) - 1;
  }
  return letters;
};

// Transform the selected lines into a list ...
const result = input.text.selected
  .split("\n")
  .map((line, i) => `${enumerationCharacter(i)}) ${line}`)
  .join("\n");
  
// ... then replace the selected text with the transformation.
output.insert.setText(result);
```


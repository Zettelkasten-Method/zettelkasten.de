---
title: Plug-In Development – The Archive
created_at: 2024-08-28 18:11:00 +0200
layout: the-archive
toc: true
description: "Plug-in system documentation for developers of The Archive plug-ins."
---
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

# So You Want to Write a Plug-in For _The Archive_?

<a href="/the-archive/" class="back--link"><img src="/the-archive/img/appicon-sm.png" class="back--image" /><span class="back--text">Back to the Project Page</span></a>

Great! Here's how to get started with the tools provided by _The Archive_ to make plug-in development easy.

## Start Development Within _The Archive_

_The Archive_ provides a plug-in development tool so you can interactively write, test, and export plug-ins.

From the app's main menu, go to <i>Plugin - Show Developer Console</i>.

<!--TODO: a screenshot -->

1. The JavaScript editor. It automatically saves what you type, so you can quit an reopen the app even if you forget to export your plug-in.
2. The console log. It shows any output your plug-in generates, an also lists settings changes an other status messages.
3. The console input. You can enter any JavaScript expression there, an it will evaluate once you commit with Enter/Return <kbd>⏎</kbd>

## Your Plug-in's Lifecycle

Your plug-in runs in a clean sandbox environment, unaffected by previous plug-in executions. As a result, you can focus on writing your plug-in so that

1. it gathers information from the app and the user,
2. performs a computation, and then
3. produces an effect that is carried out by the app.

Your plug-in behaves like a sub-routine or "function", where you implement the algorithm "in the middle" to perform the computation, and rely on _The Archive_ to provide the inputs and carry out the effects.

### One Plug-In, One Effect

Plug-ins are designed to and encouraged to perform _one_ effect, which is carried out by _The Archive_ once the plug-in finishes execution.

Conversely, your plug-in is discouraged from producing side-effects during execution.

For example, you cannot write a plug-in that creates thousands of files for the user in a loop. But you can tell the app to carry out 1 effect like file creation once the plug-in successfully finished computation.

The key difference to imperative programming in e.g. Python scripts you run from the terminal is that your plug-in computes and finally _describes_ the desired effect, and _The Archive_ then executes it at the end, while a Python script can perform an effect immediately in every line, if needed.

While this approach reduces the potential automation power granted to plug-in authors in _The Archive_ at the moment, it encourages you to re-think what you want to achieve in terms of purely functional value transformations, reduce the scope of what your plugin does to 1 thing, and in turn helps your users to understand what they sign up for when they install your plug-in.

### What "Value Transformations Over Imperative Code" Means for You

From _The Archive_'s perspective as much as the user's, your plug-in is a black-box that performs some computation on inputs provided by the app, and producing a description of an effect that is handed back to the app to be executed. The part in the middle that is the computation of the change is a function that transforms the inputs into an effect. Depending on your experience, this may require some re-thinking.

Say you want to write a plug-in that transforms each line of the selected text into an enumerated list, but using alphabetical notation like `a)`, `b)`, `c)`, etc.

If you were taugt the imperative mindset in the past, and think of this task in terms of automating what the user does, you would want to move the cursor to the beginning of the first line and insert `"a) "`, then move to the beginning of the next line and insert `"b)"`, and so on until you reach the end of the selection, similar to how the user would move the cursor with the arrow keys and type to insert text. Imitating what the user would do is a reasonable mental model of an automation. Because you moved the cursor, the selected range of text is gone, though, and you wouldn't know when to stop prepending enumerated list markers. So you have store the selection's end location before you begin moving the cursor around. Say the selected range was from character location `100` to `1000` in the text. Because your automation inserted two enumerations plus a space each by this point, `"a) "` and `"b) "`, you have changed the text's total length by 6 characters. This affects when you need to stop, so you need to add `+3` to the end location `1000`, getting `1000+3+3=1006`. In other wirds, the more text you insert, the more the location of the character that used to be at the end of the user's selection in the text moves away, and you need to keep track of this. Now if you abort the process in the middle for any reason (could be a bug in the computation of the next enumeration character in the alphabet after "z" that produces an error, for example), the users ends up with a half-finished change to their note, but overall it's in an unexpected state. In some cases when your automation fails mid-process, this could mean that the user _loses data_, which is very unpleasant.

Pseudo code for the imperative approach:

```
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
// Produces 0=>"a", 25=>"z", 26=>"aa", etc.
const enumerationCharacter = (i) => {
  let letters = '';
  while (i >= 0) {
    letters = String.fromCharCode((i % 26) + 97) + letters;
    i = Math.floor(i / 26) - 1;
  }
  return letters;
};

const result = input.text.selected
  .split("\n")
  .map((line, i) => `${enumerationCharacter(i)}) ${line}`)
  .join("\n");
output.insert.setText(result);
```

### `cancel(message)`: Abort Execution

To cancel your plug-in, for example when an important pre- or postcondition cannot be met, use the global `cancel()` function to exit early before any effects are executed:

```js
if (title.trim() === "") {
  cancel("No title provided");
}
```


#### Parameters

| Name      | Type     | Description                                              |
|-----------|----------|----------------------------------------------------------|
| `message` | [String] | Optional reason that shows up in logs to help you debug. |

## `.thearchiveplugin` Bundle Structure

At the moment, with app version 1.8.0 compatibility, these two files will be loaded by the plug-in system:

- `manifest.json`: Describes the plug-in and its capabilities.
- `main.js`: Is executed as a whole when the plug-in is run from the app.

### `manifest.json` Declares Capabilities, Requests Access, and Describes the Plug-In to users.

The Manifest file declares which input and output ports a plug-in needs from The Archive.

This file is instructive, not informational: If you run a plug-in without any declared inputs, you won't have access to any. (If you run a plug-in without any declared inputs or outputs, it can still be executed and compute something complex internally, but the information will never get anywhere.)

Next to input and output port declarations, there's metadata that describes the plug-in. Who's the author? When was this released?

The easiest way to generate a valid `manifest.json` is from the Plugin Developer Console window's _Export_ feature.

#### Example File

Here's a Manifest file that requests *all* possible inputs, and declares it wants to change both a file of a fixed name and enter text in the editor:

```json
{
  "appVersion" : "1.8.0",
  "authors" : [
    {
      "name" : "Christian Tietze",
      "url"  : "https://zettelkasten.de"
    }
  ],
  "dependencies" : [ ],
  "description" : "This plug-in demonstrates all available settings.",
  "identifier" : "de.zettelkasten.manifest-demo",
  "input" : {
    "notes" : [
      "selected",
      "all"
    ],
    "text" : [
      "all",
      "selected"
    ]
  },
  "output" : {
    "changeFile" : "Monthly Dashboard",
    "insertText" : true
  },
  "releaseDate" : "2024-08-31",
  "title" : "Demonstrate Features",
  "version" : "1.0.0"
}
```

#### Documentation of `manifest.json` Keys and Values

- You can requests as many inputs as you need. None are required.
- You cannot combine multiple file-related outputs. For example, you can either request a new file to be generated for the user with `"output": { "newFile": true }`, or declare which file you want to save to with `"output": { "changeFile": "Tag Index" }`, but not both.
- You can combine the output to insert text on behalf of the user, `"insertText": true`, with any file output. The text is inserted into the currently edited note before the new file is created (and potentially displayed).

| Key                   | Type             | Description                                                                                                                                                                                                                                                                                   |
|-----------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `appVersion`          | String           | The minimum version of The Archive to run.                                                                                                                                                                                                                                                    |
| `authors`             | Array of Objects | List of authors, each with name. Other keys are optional, and for readers.                                                                                                                                                                                                                    |
| `authors.name`        | String           | Name of the author.                                                                                                                                                                                                                                                                           |
| `authors.url`         | [String]         | Optional URL of the author's website.                                                                                                                                                                                                                                                         |
| `authors.*`           |                  | Other keys are optional. You could add contribution descriptions or Twitter handles.                                                                                                                                                                                                          |
| `dependencies`        | Array            | List of dependencies (empty array, upcoming feature).                                                                                                                                                                                                                                         |
| `description`         | String           | Description of the plug-in.                                                                                                                                                                                                                                                                   |
| `identifier`          | String           | Unique identifier of the plug-in, preferably in reverse domain notation like `de.zettelkasten.extract-note`. **Must match the bundle basename.**                                                                                                                                              |
| `input`               | Object           | Object containing any combination of input configurations:                                                                                                                                                                                                                                    |
| `input.notes`         | Array of Strings | List of note input types: `"all"` accesses the whole archive; `"searched"` accesses notes from the search results list; `"selected"` accesses the 1 edited or 0+ selected note(s);                                                                                                            |
| `input.text`          | Array of Strings | List of editor text selection types. Disables plug-in execution if no note is being edited. `"all"` can read the whole note; `"selected"` produces only the selected text (or an empty string if nothing is selected)                                                                         |
| `output`              | Object           | Object containing output configurations. `newFile` and `changeFile` are mutually exclusive.                                                                                                                                                                                                   |
| `output.insertText`   | Boolean          | Whether to insert text in the editor on the user's behalf as if they are typing.                                                                                                                                                                                                              |
| `output.newFile`      | Bool             | Whether The Archive will generate a filename, similar to _New File_ (<kbd>⌘+N</kbd>).                                                                                                                                                                                                         |
| `output.changeFile`   | String           | Basename (without extension) of a fixed file to change.                                                                                                                                                                                                                                       |
| `output.changeFile`   | Object           | `{"programmaticFilename":true}` to indicate the filename is determined by the plug-in during runtime.                                                                                                                                                                                         |
| `output.onCompletion` | String           | Which effect to apply after creating a file with `newFile` or `changeFile`: `"notify"` shows a notification without showing the file; `"showFile"` visits the file in the editor; `"showFileInNewTab"` visits the file in a new tab; `"showFileInNewWindow"` visits the file in a new window. |
| `releaseDate`         | String           | Release date of the plug-in in ISO format, `YYYY-MM-DD`.                                                                                                                                                                                                                                      |
| `title`               | String           | Title of the plug-in.                                                                                                                                                                                                                                                                         |
| `version`             | String           | Semantic version of the plug-in: `major.minor.patch`, e.g. `"1.3.0"`.                                                                                                                                                                                                                         |


### `main.js` Is the Runnable Entry Point

Depending on the capabilities of the plug-in as declared in the Plug-In Manifest, your code has access to different global variables:

| Variable                   | Type   | Description                              |
|----------------------------|--------|------------------------------------------|
| input                      | Object |                                          |
| input.notes                |        |                                          |
| input.notes.all            |        | Either all notes, or all searched notes. |
| input.notes.selected       |        |                                          |
| input.text                 |        |                                          |
| input.text.all             |        |                                          |
| input.text.selected        |        |                                          |
| output                     |        |                                          |
| output.changeFile          |        |                                          |
| output.changeFile.filename | String |                                          |
| output.changeFile.content  | String |                                          |
| output.newFile             |        |                                          |
| output.newFile.filename    | String |                                          |
| output.newFile.content     | String |                                          |
| output.insert              |        |                                          |
| output.insert.text         |        |                                          |

## Prompting for User Input

### `app.prompt(args)`

Interactively ask the user to provide text in a dialog:

```js
const filename = app.prompt({
  title: "New Filename",
  description: "The new note will be saved with this filename.",
  placeholder: "Filename",
  defaultValue: "Daily Dashboard"
});
```

![Screenshot of the dialog](./app.prompt-example.png)

The prompt's buttons are labeled "Submit" to confirm the input and send the result to your plug-ins JavaScript, and "Cancel" to dismiss the dialog and return `undefined` to JavaScript.

If the user hits the `Cancel` button or confirms with an empty text field, but you require non-empty input, you can abort script execution with an error:

```js
if (filename === undefined || filename.trim() === "") {
  cancel("User did cancel instead of provide a filename.");
}
```

#### Parameters

| Name                | Type     | Description                                                    |
|---------------------|----------|----------------------------------------------------------------|
| `args`              | Object   | Arguments object with the following keys:                      |
| `args.title`        | String   | Prompt message, used as the title.                             |
| `args.description`  | [String] | Optional alert text explaining what the input will be use for. |
| `args.placeholder`  | [String] | Optional placeholder value for the text field.                 |
| `args.defaultValue` | [String] | Optional initial value displayed in the text field.            |

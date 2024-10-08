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

Your Plug-In Manifest declares the capabilities The Archive should grant your code. The `main.js` file _is_ this code that _The Archive_ executes. During execution, your code has access to exactly the functionality you request in the Manifest. This ensures that users can see, understand, and know the power and danger of running your plug-in. 

Assuming you request at least 1 input type, and produce some output (otherwise your code would effectively just waste energy), your script has access to two global container objects:

| Variable                   | Type             | Description                              |
|----------------------------|------------------|------------------------------------------|
| input                      | Object           |                                          |
| output                     | Object           |                                          |

These objects contain concrete input and output ports that correspond to the capabilities requested in the Manifest file. 

Note that you can't get all at once, since e.g. the file output ports are mutually exclusive. The following table is an overview of all ports that exist -- so you know what you could get if you configure your plug-in accordingly:

| Variable                   | Type             | Description                                                                    |
|----------------------------|------------------|--------------------------------------------------------------------------------|
| input                      | Object           | Holds the input ports as requested by the Manifest.                            |
| input.notes                | Object           | Holds the note input ports as requested by the Manifest.                       |
| input.notes.all            | Array of Objects | Either all notes, or all searched notes.                                       |
| input.notes.selected       | Array of Objects | Selected note, or notes.                                                       |
| input.text                 | Object           | Holds the text input ports as requested by the Manifest.                       |
| input.text.all             | String           | Full text of the currently edited note.                                        |
| input.text.selected        | String           | Selected/highlighted text in the editor.                                       |
| output                     | Object           | Holds the output ports as requested by the Manifest.                           |
| output.changeFile          | Object           | File output port to change (replace) a file with a known file name.            |
| output.changeFile.filename | String           | File name of the file that's being replaced. (Mutable for dynamic file names.) |
| output.changeFile.content  | String           | Content of the file that will be changed (replaced).                           |
| output.newFile             | Object           | File output port to create a new file like the user would.                     |
| output.newFile.filename    | String           | File name that will be created. (Read-only.)                                   |
| output.newFile.content     | String           | Content of the file that will be created.                                      |
| output.insert              | Object           | Editor text output port to insert content.                                     |
| output.insert.text         | String           | Text to type on behalf of the user.                                            |

# API Documentation

These are the global variables that The Archive makes available to your scripts:

| Variable | Type   | Description                                                  |
|----------|--------|--------------------------------------------------------------|
| app      | Object | Interface to (some) app remote control functionality.        |
| console  | Object | Logs informational or error messages.                        |
| input    | Object | Contains all app input ports (as requested by the Manifest)  |
| output   | Object | Contains all app output ports (as requested by the Manifest) |

And these are the global functions:

| Function | Description                                                       |
|----------|-------------------------------------------------------------------|
| cancel() | Immediately abort script execution without performing any effect. |

## `app` Global Object

This global objects groups "remote control" functionality: things you want _The Archive_ to do on the user's behalf, and user interface interactions.

| Variable                | Type     | Description                             |
|-------------------------|----------|-----------------------------------------|
| app.extractNoteID(args) | Function | Returns the ID from e.g. a filename.             |
| app.pasteboardContents  | String   | General pasteboard proxy.               |
| app.prompt(args)        | Function | Prompt for user input.                  |
| app.unusedFilename()    | Function | Generates a filename that's still free. |

### `app.extractNoteID(args)`: REturns the ID From a Filename

This is a call to what _The Archive_ uses to detect note ID's according to the user's settings.

As of v1.8.0, this will effectively extract date-time-stamps from filenames. Custom identifier schemes are not yet supported in the app. 

> Note: If you want to support your own identifier schemes (like Folgezettel ID's), you will need create your own extraction function. In future updates, you'll be able to let the user of your plug-in choose your function as a means to obtain ID's from note filenames. See discussion on [sharing data between plug-ins](https://forum.zettelkasten.de/discussion/3030/how-could-we-let-plug-ins-store-data).

```js
// Imagine you get a filename from a list of all notes:
const filename = "202410060932 My most amazing discovery";
const identifier = app.extractNoteID(filename);
// => "202410060932"
```

#### Parameters

| Name   | Type   | Description                                           |
|--------|--------|-------------------------------------------------------|
| `args` | String | Filename (or other piece of text) to get the ID from. |
|        |        |                                                       |

#### Returns

Either a string when a match is found or `null` if no match is found.


### `app.pasteboardContents`: Access to the General Pasteboard

This `app.pasteboardContents` grants read--write access to the general pasteboard, e.g. the one that the user copies and pastes from with the <kbd>⌘+C</kbd>/<kbd>⌘+X</kbd> and <kbd>⌘+V</kbd> shortcuts, as a string.

```js
// Read from the pasteboard:
const text = app.pasteboardContents; 

// Write to the pasteboard:
app.pasteboardContents = "Hello!";
```

If there's non-string content on the pasteboard, your script will get back an empty string.

> **Note:** macOS has a couple of named pasteboards, e.g. one for all <kbd>⌘+F</kbd> Find operations that you may have noticed results in a find operation in one text editor to affect the find operation in another. Access to other named pasteboards may come in a future release, including definint your own named pasteboards to share data.


### `app.prompt(args)`: Prompting for User Input 

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

If the user hits the `Cancel` button or confirms with an empty text field, but you require non-empty input, you can abort script execution:

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

#### Returns

The text entered by the user on successful completion, or `null` if the prompt was canceled.

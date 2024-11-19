---
title: Bundle Format - Plug-In Development – The Archive
created_at: 2024-10-15 08:13:00 +0200
layout: the-archive
description: ".thearchiveplugin bundle file format description."
updated_at: 2024-10-29 11:49:01 +0100
---
# `.thearchiveplugin` Bundle Format

Plug-ins are saved and shared file bundles with the extension `.thearchiveplugin` file bundles. A "bundle" on macOS means that it's actually a directory, but macOS treats it as a file.


## Get Started with the Plug-In Template

To get started developing a plug-in with your favorite editor, [use our plug-in project template on GitHub](https://github.com/Zettelkasten-Method/plug-in-template).

At the moment, with _The Archive_ v1.8.0 (initial plug-in release) compatibility, these two files will be loaded by the plug-in system:

- `manifest.json`: Describes the plug-in and its capabilities.
- `main.js`: Is executed as a whole when the plug-in is run from the app.


## Plug-In Bundle Structure

The plug-in bundle filename is the same as the unique ID of the plug-in. (If these don't match, _The Archive_ refuses to install or use the plug-in.)

Plug-in ID's are written in reverse domain form. First-party plug-ins thus start with `de.zettelkasten.`.

For example, `de.zettelkasten.extract_note`, the _Extract Note_ plug-in, has this file structure:

```
de.zettelkasten.extract_note.thearchiveplugin
├── main.js
└── manifest.json
```

- The `main.js` file is being executed by _The Archive_ when the plug-in is run.
- The `manifest.json` describes the plug-in so the app can display plug-in authors, descriptions, and expose the access rights required to run the code.

> Note: Future plug-in system versions will allow inclusion of non-executable code -- in other words: dependencies. You can bundle and ship external libraries next to your `main.js` and make use of them in your code.


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
- System-wide pasteboard access is separated into read and write access. Setting the pasteboard only copies text to the pasteboard once after the plug-in finished execution. You can't copy multiple things onto the pasteboard in succession.

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
| `input.pasteboard`    | Boolean          | Whether to enable system-wide pasteboard read access.                                                                                                                                                                                                                                         |
| `output`              | Object           | Object containing output configurations. `newFile` and `changeFile` are mutually exclusive.                                                                                                                                                                                                   |
| `output.insertText`   | Boolean          | Whether to insert text in the editor on the user's behalf as if they are typing.                                                                                                                                                                                                              |
| `output.newFile`      | Boolean          | Whether The Archive will generate a filename, similar to _New File_ (<kbd>⌘+N</kbd>).                                                                                                                                                                                                         |
| `output.changeFile`   | String           | Basename (without extension) of a fixed file to change.                                                                                                                                                                                                                                       |
| `output.changeFile`   | Object           | `{"programmaticFilename":true}` to indicate the filename is determined by the plug-in during runtime.                                                                                                                                                                                         |
| `output.showPreview`  | [String]         | Optional preview output target. Display text without saving to a file. Only supports `"buffer"` for the built-in preview window at the moment.                                                                                                                                                |
| `output.pasteboard`   | Boolean          | Whether to enable system-wide pasteboard write access.                                                                                                                                                                                                                                        |
| `output.onCompletion` | String           | Which effect to apply after creating a file with `newFile` or `changeFile`: `"notify"` shows a notification without showing the file; `"showFile"` visits the file in the editor; `"showFileInNewTab"` visits the file in a new tab; `"showFileInNewWindow"` visits the file in a new window. |
| `releaseDate`         | String           | Release date of the plug-in in ISO format, `YYYY-MM-DD`.                                                                                                                                                                                                                                      |
| `title`               | String           | Title of the plug-in.                                                                                                                                                                                                                                                                         |
| `version`             | String           | Semantic version of the plug-in: `major.minor.patch`, e.g. `"1.3.0"`.                                                                                                                                                                                                                         |


### `main.js` Is the Runnable Entry Point

While your plug-in Manifest declares the capabiliddties that _The Archive_ should grant your code, the `main.js` file _is_ this code that will be executed. 

During execution, your code has access to exactly the functionality you request in the Manifest. This ensures that users can see, understand, and know the power and danger of running your plug-in. 

As a consequence, if you change the capabilities of your plug-in via its Manifest but forget to update your code, your plug-in may produce errors when you run it because the code cannot access the old `input`/`output` ports anymore.

- [See the API docs for details on available `input`/`output` ports](/the-archive/plug-ins/help/api/).
- [Read the tutorial](/the-archive/plug-ins/help/tutorial/) to get started writing your own plug-in.

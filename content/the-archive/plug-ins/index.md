---
title: Plug-Ins for The Archive
created_at: 2024-11-19 18:29:00 +0100
layout: the-archive
description: "Plug-in directory and help for The Archive."
updated_at: 2024-10-11 18:57:44 +0100
---
# Plug-Ins for The Archive

<a href="/the-archive/" class="back--link"><img src="/the-archive/img/appicon-sm.png" class="back--image" /><span class="back--text">Back to the Project Page</span></a>

Take control of your workflow with customizable plug-ins for The Archive:

- **Automate repetitive tasks:** Plug-ins can perform common actions for you, like assembling a list of links, or extracting a new note from selected text.
- **Review your notes:** Plug-ins can access all your notes and offer statistics, or help find lost notes and mis-typed tags.
- **Speed up your work:** Run plug-ins with a single shortcut, or even invoke them from other apps!

The plug-in system has been [added to The Archive v1.8.0](/the-archive/release-notes).

## Plug-Ins and Safety

We developed the plug-in with your data safety as the top priority: 

- Plug-ins need to declare what they access; there's _no_ way to bypass this.
- Plug-ins cannot delete notes.
- Plug-ins cannot connect to the internet to steal your data.

All plug-ins we share are a safe addition to your workflow.

## How to Work with Plug-Ins

Start by picking _Plug-Ins ▶ Manage Plug-Ins ..._ from the main menu to enable plug-ins that you want to try!

- **Any plug-in** can be run from the main menu.
- **Plug-Ins that operate on selected text** can be run from the contextual menu in the editor, by right-clicking on text in the editor.
- **Plug-Ins that operate on notes** can be run from the contextual menu in the search results, by right-clicking on notes there.

> 💡 **Pro Tip:** Assign shortcuts to plug-ins (after enabling them) to speed things up and save mouse clicks!

### Install New Plug-Ins 

Plug-ins are shipped as `.thearchiveplugin` bundle files. Double-click or open in Finder to install a plug-in.

They can be shared, and you can find community plug-ins in our forums:

**[Discover Community Plug-Ins](https://forum.zettelkasten.de/categories/community-plug-ins
)**

### Invoke Plug-Ins from Other Applications with the URL Scheme

Ever found yourself in a situation like this?

> When I go through my daily review routine, I want to obtain a list of notes created this day to add them to my journal and create tasks for the next day to continue some of these notes.

The solution is this:

1. Launch a plug-in directly from another app with the URL scheme! 
2. Have it put the result directly on the clipboard [(with `output.pasteboard.content = "..."`)](/the-archive/plug-ins/help/api/)

You can launch plug-ins from  e.g. browser bookmarks, links in your Mind-Maps or Reminders, or apps like Alfred and Keyboard Maestro.

The URL scheme's link format is similar to one of these examples:

    thearchive://plugin/PLUGIN_ID/run
    thearchive://plugin/PLUGIN_ID/run?param1=value1&param2=value2

- `PLUGIN_ID` is a placeholder for the actual plug-in ID, like `de.zettelkasten.extract-note`. Copy it from the plug-in list in the app's preferences.
- The `?parameter=value` part is optional. If you need to provide it depends on the plug-in: Most don't need it, but some may require you to pass values there to perform their actions at all (or otherwise require your input when being run, making execution semi-automatic).


## How to Create Your Own Plug-Ins
                                       
Start with the [Developer Tutorial](/the-archive/plug-ins/help).

Check out the plug-in help pages: [Plug-In Help Overview](/the-archive/plug-ins/help)

---
title: Using Trello as a Zettel note archive
created_at: 2017-01-10 10:15:07 +0100
kind: article
author: Nick
tags: [ software, archive, review, tool ]
image: 201612062100_trello-zettelkasten.png
toc: on
---

## What is Trello?

<%= insert_rel_image file: "trello-zettelkasten.png", title: "Zettel note archive in Trello", caption: %{Zettel note archive in Trello} %>

[Trello](https://trello.com/tour) is web-based knowledge management tool. It is commonly used for project management. However, it offers all the necessary elements to build a Zettel note archive. Your notes are kept in-sync between all your devices in real-time. And you can add multiple people to a Trello workspace to create collaborative note archives.

The Trello application is provided by Trello, Inc. through a [freemium pricing model](https://trello.com/pricing) and has been in development [since 2011](https://trello.com/about). They have over [10 million users](http://blog.trello.com/wahooo-free-gold-for-our-10-million-users), and promise data security and reliability. See the Trello [Privacy](http://help.trello.com/article/712-privacy) and [Security](https://trello.com/security) policies for further details.

I have used Trello for several projects in the past, and one day the similarities between an index card and a Trello card made me wonder if the Zettelkasten method would fit with Trello. So I decided to build a Zettel note archive to satisfy my curiosity. I will share what I learned with you.

A note of attribution: I borrowed liberally from the [Trello Documentation](http://help.trello.com/) and the [Trello Blog](http://blog.trello.com/) as I wrote this article.

### Trello Fundamentals

Trello is comprised of “boards”, “lists” and “cards”.

#### Boards

A board represents a workspace. A single board can contain an unlimited number of lists and cards. You can add multiple Trello users to a board to collaborate.

<%= insert_rel_image file: "trello-board.png", title: "A Trello board", caption: %{A Trello board}, link: "https://trello.com/b/DLr3FVxr" %>

#### Lists

Lists keep cards organized. They can be used to create a workflow, or to categorize cards. Cards can be moved from list to list.

<%= insert_rel_image file: "trello-list.png", title: "A Trello list", caption: %{A Trello list} %>

#### Cards

The basic unit of a board is a card. Think of them as digital index cards containing a single Zettel note. I’ll be using the terms “cards” and “notes” interchangeably in this article.

Clicking on a card opens the card and shows the back. Here you can edit card contents, add attachments and comments.

<%= insert_rel_image file: "trello-card.png", title: "A Trello card", caption: %{A Trello card}, link: "https://trello.com/c/1U2MjPS3" %>

### Example Trello Boards

I created an [example Trello Zettel note archive](https://trello.com/b/DLr3FVxr) for you to explore. All the screen-shots in this article were taken from this board, and some of the screen-shots link back to parts of this board.

I also created a Trello version of the article you are currently reading: [Using Trello as a Zettel note archive](https://trello.com/b/Mgo52VBw).

## Testing Trello with the Four Criteria

I’ll evaluate Trello against the [baseline criteria](http://zettelkasten.de/posts/baseline-zettelkasten-software-reviews/#criteria-i-will-consider):

* **Note creation:** does it take many clicks or keystrokes to create a new Zettel note?

* **Note retrieval:** for example, how fast and easy is full-text search?

* **Note connections:** which mechanisms does the app support to create connections?

* **Data export:** how does the application manage to get everything out without losing information? How does it manage to get stuff in?

### Note Creation

Adding, editing and manipulating cards in Trello is fast. Once you learn the keyboard shortcuts you can be even faster.

#### Adding Cards

Add cards via the “Add a card…” input at the bottom of lists. You can also add cards via the context menu at the top of lists.

* Press `n` to add a new card after the currently selected card. This key shortcut only works if there is a card currently selected. I wish it worked all the time.
* Press `shift-enter` while submitting a card to open it immediately after creating it.

<%= insert_rel_image file: "add-card.png", title: "Adding a card", caption: %{Click here to add a card, or press 'n'} %>

#### Navigating Cards

You can use the cursor or keys to move between the cards.

* Select a card by hovering over it with your cursor.
* Press the arrow keys (up, down, right, left) to select adjacent cards on a board.
* Press down-arrow or `j` to select the card below the current card.
* Press up-arrow or `k` to select the card above the current card.

#### Editing Cards

Click on a card to open it for editing. Click on the title and description to immediately edit them. Keep in mind there is no undo for card edits. Once you click “Save” the content is updated immediately.

<%= insert_rel_image file: "edit-card.gif", title: "Editing a card", caption: %{Editing a card} %>

Once you have navigated between cards, and selected a card:

* Press the left or right angle brackets (`<` and `>`) to move it to the adjacent left or right list.

* Press `e` to open quick edit mode, which lets you quickly edit the title and other card attributes.

* Press `t` to open the card, and edit the title.

* Press `enter` to open the card.

When you have a card open for editing:

* Press `t` to edit the title.

* Press `e` to edit the description.

* Press `m` to add or remove members.

* Press `ctrl-enter` (`cmd-enter` on Mac) to save any text you are writing. This works when writing or editing comments, editing the card title, list title, description, and other things.

* Press `esc` to close a card. Or to cancel any edits you are making.

See [Editing Cards](http://help.trello.com/article/784-editing-cards) and [Moving cards or lists](http://help.trello.com/article/806-moving-cards-or-lists) for more details.

#### Pasting Content

Paste content into Trello using `ctrl-v` (`cmd-v` for Mac) to add new cards. Paste a link, and Trello will use information from that link to fill out the card. I like this feature a lot and use it to quickly make lots of new cards from existing notes.

* Paste content into a card, and Trello will ask if you want each line of text to form a new card.

* Paste content anywhere else, and Trello will add everything from your clipboard into a single new card. The title of the new card will be set from the first line of text. (If you paste onto a board, Trello will add the new card to the nearest list)

<%= insert_rel_image file: "paste-cards.gif", title: "Pasting content to create cards", caption: %{Pasting content to create cards} %>

#### Adding Attachments

Card attachments are files uploaded to cards. Perhaps store a PDF document to reference for future use. Or upload some images to illustrate your note.

Drag and drop multiple files from your desktop to a card to upload them. You can drag images from other websites to your cards. Paste links onto a card, and Trello will add the link as an attachment. You can drag files directly onto a board to add them as a new card. See [Adding attachments to cards](http://help.trello.com/article/769-adding-attachments-to-cards).

You can add attachments from:

* Your Computer
* Google Drive
* Dropbox
* Box
* OneDrive
* Any Link

#### Adding Comments

Each card has a comments section to add additional information. Use it to track changes to the card over time. Or to make notes about the contents of the card. Or to have an argument with other members about the content of the card! See [Commenting on cards](http://help.trello.com/article/765-commenting-on-cards) for more.

#### Creating Cards By Email

Each board has a unique email address. Create new cards by sending an email to this address. Each card also has a unique email address, and you can add comments to that card in the same way. This feature is very useful for ubiquitous capture... just send a quick email to capture your thoughts.

When creating a new card by email, the subject of the email becomes the card’s title, the body of the email becomes the card’s description, and attachments in the email will be added to the card. You can also add labels and members by email. For more details see [Creating cards by email](http://help.trello.com/article/809-creating-cards-by-email).

#### Copying Cards, Lists and Boards

You might want to create a card, list or board as a template. When you copy it, the contents will be copied as well. See [Copying cards, lists, or boards](http://help.trello.com/article/802-copying-cards-lists-or-boards).

### Note Retrieval

You can quickly filter and search your note cards in Trello to find specific cards, and groups of cards. Here is an in-depth overview about the differences between [Filtering vs. Searching](http://help.trello.com/article/972-filtering-vs-searching).

#### Filtering Cards

Filtering allows you to search cards by titles, labels, and members, and is limited to the current board. Using filters allows you to quickly find and view groups of cards which have similarities.

<%= insert_rel_image file: "filtering.png", title: "Filtering cards on a board", caption: %{Filtering cards on a board} %>

Begin filtering cards on a board by pressing `f` and type into the filter field.

* To see the number of cards per list, filter for `*` or `/`, without any other text.

* Press `esc` to close the filter field. Press `w` to close the board menu.

* Press `q` to see all cards assigned to you.

* Press `x` to clear all active filters.

See [Filtering cards on a board](http://help.trello.com/article/787-filtering-cards-on-a-board) for more info.

#### Searching Cards

Searching allows you to search the full text of all cards on all boards. Trello offers special operators to refine your search. For example, `essay has:attachments` would show all cards containing the word `essay` and have attachments.

<%= insert_rel_image file: "searching.png", title: "Searching all cards", caption: %{Searching all cards} %>

* Start a search by pressing `/` on keyboard, or type into the search box at the top of page.

* Click on a card to open it. Sadly, the arrow keys do not the search results as I assumed they would.

* Click the arrow icon to go to the full search page.

* Press `esc` to close the search box.

See more details at [Searching for Cards](http://help.trello.com/article/808-searching-for-cards-all-boards), including a description of all special operators.

#### Saved Filters & Searches

Trello also offers [saved searches](http://help.trello.com/article/827-saved-search) if you have [Trello Gold](https://trello.com/gold). You can easily save a search to use it again in future.

If you don’t want to pay for Trello Gold, you can save filters and searches by using bookmarks in your web browser.

* Filter cards, and bookmark the board URL. Open that URL to reload those specific filters. You can add this URL into a card to link to this filtered board state.

* Search cards, open the full search page by clicking the arrow icon, and bookmark the search page URL. Open that URL to load that specific search.

### Note Connections

Since Trello is a web-application each card, board, comment and action has a unique URL allowing for complex interlinking. See [Sharing links to cards, boards, comments and actions](http://help.trello.com/article/824-sharing-links-to-cards-and-boards) for more details on types of links. See also [Labels & Tagging](#labels-tagging) for other types of note connections.

#### Card Links

Each card has a unique link. Open a card, click “Share and more…” from the lower right-hand corner of the card back and copy the link. You can also get the link by copying the card URL from the address bar of your browser.

<%= insert_rel_image file: "card-link.png", title: "A card link", caption: %{A card link} %>

Trello auto-formats card links when pasted into another card. Changing the title of the original card auto-updates any links referring to that card.

<%= insert_rel_image file: "card-link-paste.gif", title: "Trello auto-formats the pasted link", caption: %{Trello auto-formats the pasted link} %>

You can search and find card links from any card using the comment form. I wish this method worked when editing the description!

* Click the “Add card” button on the comment form, and search to find a card. Click on the card you want, and Trello will place the card link into the comment form. Move up and down the list using arrow keys. Press `tab` or `enter` to choose a card.

* Type `#` into the comment form, and Trello will use the next text you type to search for a card. Choose the card you want from the “Add card” popover.

<%= insert_rel_image file: "card-link-get.gif", title: "Search and find any card link", caption: %{Search and find any card link} %>

#### Comment Links

You can also link to individual card comments. Each comment has a unique date-stamped link.

<%= insert_rel_image file: "comment-link.png", title: "A comment link", caption: %{A comment link}, link: "https://trello.com/c/1U2MjPS3/#comment-5845687fd0be8a09e873a4a4" %>

### Data Import/Export

This is one of the weak areas for Trello. Data import and export requires technical solutions which might be challenging for most people.

#### Importing

Trello does not currently have a generic import feature. [Creating cards by email](#creating-cards-by-email) might be considered a form of importing, but you would need to send an email for each note.

You can import multiple cards from a spreadsheet using external services and the Trello API:

* [Use Zapier to import data from a spreadsheet](https://zapier.com/help/import-export/#using-google-sheets-for-import), and then send the data from Zapier to Trello
* [Use a Google Spreadsheet and a Google Apps Script](http://www.littlebluemonkey.com/blog/online-scrum-tools-part-3-upload-existing-product-backlog-into-trello) to import the data directly into Trello.

See [Importing data into Trello](http://help.trello.com/article/751-importing-data-into-trello) for further details.

#### Exporting

There are several options for exporting data from Trello, see [Exporting data from Trello](http://help.trello.com/article/747-exporting-data-from-trello) for a general overview.

* Print cards and boards to create a PDF. See [Printing in Trello](http://help.trello.com/article/812-printing-in-trello).

* Export cards and boards to JSON. You can [convert JSON to CSV or Excel spreadsheets](http://help.trello.com/article/828-getting-custom-data-from-trello-into-a-spreadsheet).

* Access the [Trello API](https://developers.trello.com/) and use [a script](https://github.com/search?utf8=%E2%9C%93&q=trello+markdown) to convert the resulting JSON into Markdown files.

## Additional Features

### Dates & Calendar

Each card can have a set due date. You can also search cards with the `due:day` operator to show cards due in the next 24 hours. Perhaps this is a way to bring note cards up for review. You might add a three month due date to every note card you create, and thus set a reminder to review that note in future.

<%= insert_rel_image file: "due-date.png", title: "A card due date", caption: %{A card due date} %>

Trello also has a Calendar Power-Up to display cards with due dates in a calendar format with optional iCalendar feed. See [Using the Calendar Power-Up](http://help.trello.com/article/811-viewing-cards-in-a-calendar-view).

### Keyboard Shortcuts

Trello offers multiple keyboard shortcuts to accomplish common tasks. Press `?` to view all keyboard shortcuts.

See [Using keyboard shortcuts in Trello](http://help.trello.com/article/798-using-keyboard-shortcuts-in-trello) to learn more. And here is a link to the list of current Trello Shortcuts: <https://trello.com/shortcuts>

### Labels & Tagging

Labels are a built-in feature of Trello, and Tags are an ad-hoc feature enabled by Trello’s [searching and filtering](#note-retrieval) features.

#### Labels

Trello offers labels to help categorize your cards. Add up to 10 colored labels, and unlimited uncolored labels per board. Press `l` when viewing a card to view all available labels. You can also [filter](#filtering-cards) the board by label, and use labels when searching to narrow down your results.

<%= insert_rel_image file: "card-labels.png", title: "Some card labels", caption: %{Some card labels} %>

When adding a new card, you can type `#` plus the label’s color or title and get a list of matching labels. Use the up and down arrows to navigate the resulting list. Pressing enter or tab will add the label to the composed card. The labels will be added to the card when you submit. See [Adding labels to cards](http://help.trello.com/article/797-adding-labels-to-cards) for more details.

#### Tags

You can also add hash-tags to card descriptions for an extra layer of tagging. [Searching](#searching-cards) by hash-tag will show all cards containing that tag. When added to a title, you can [filter](#filtering-cards) card titles by that hash-tag.

In the image below, I’ve added the tags `#essays`, `#notetaking`, `#writing` to a note title, and I am filtering the board to show only those cards with `#notetaking` in title.

<%= insert_rel_image file: "filter-hash-tag.png", title: "Filtering by hash-tag", caption: %{Filtering by hash-tag} %>

### Language Support

Trello is available in over 20 languages. See [Changing your language in Trello](http://help.trello.com/article/745-is-trello-available-in-other-languages).

### Markdown Support

Trello supports Markdown text formatting in card descriptions, checklists and comments. For more information, see [How To Format Your Text in Trello](http://help.trello.com/article/821-using-markdown-in-trello).

### Mobile Apps

Trello is available for Web, iPhone, iPad, Android and most mobile browsers: <https://trello.com/platforms>

### More Features

See [How to use Trello like a pro](http://help.trello.com/article/734-how-to-use-trello-like-a-pro) and the [Trello Resources Board](https://trello.com/b/nPNSBZjB/trello-resources) for more useful ways to work with your lists and cards.

## Conclusion

Trello offers a flexible set of tools to build a knowledge base. It is especially suited for collaborative note archives thanks to excellent multi-user support. Here are some of my thoughts on using Trello as a Zettel note archive.

### What I Like

* I like that Trello is a web application. I can access it from anywhere. I do not have to worry about backing up my data, and all my notes stay in sync no matter the device. Also, since Trello is on the web, I can link in and out of my note archives from locations around the web.

* I like that I can use email to add new cards. I have used (abused?) this feature to archive information into Trello from various places around the web.

* The workflow of navigating, selecting, opening and editing is well designed. I find the keyboard shortcuts mostly intuitive, and only find myself using the mouse or touchpad once in a while. It is easy to get into a flow with Trello.

* I like how easy it is to make connections between cards. Because Trello auto-formats a note link as the title of the card, I can place links throughout the text of a card and they appear as clickable words and phrases. I also like that I can link to a board in a filtered state, thereby linking to groups of cards.

* Filtering is very fast, and I am generally impressed with how easy it is to find what I am looking for, and how often I discover related things along the way.

* Being able to attach images and documents to a card to enhance a note is more useful than I anticipated.

* Trello has several integrations with other services, allowing me to build self-managing knowledge systems. I can pull data from around the internet and automatically add it to a board. I can give apps and bots access to my board to automatically take action on my cards (with my approval). I can use data from Trello to integrate into other systems, for example publishing cards as blog posts or mini-websites.

### What I Don’t Like

* I don’t like that Trello is a web application. I don’t like using my web browser for important knowledge work. If I lose internet access, I lose access to my note archives. Or even worse if I have intermittent connectivity problems thanks to a bad connection, I might be unable to save edits made to a card, thus losing the changes I am making to that card. (This does not happen very often, but when it does... the rage is real)

* There is no undo for most actions. (Yes, there is no undo!) Once I make a change, I cannot reverse that change. Trello does warn me when I am about to make a change that is irreversible, but still... there is no undo!

* There is no board versioning! I cannot roll back a board, list or card to a previous state. I use [git](https://git-scm.com/) everyday to version my notes... in some ways Trello feels like a huge step backwards.

* I wish Trello had a better import tool. I would rather not recreate each note from scratch if I am trying to import an existing Zettelkasten.

* I cannot open more than one card at a time. It would be nice to open several related cards as a group.

* Parts of the interface feel unintuitive. For example, I cannot use my arrow keys to navigate up and down the search results. And why is the search results page separate from the board view? It feels like a break in flow to leave the board view, and travel to the search results page.

* Why is searching and filtering separate? At first I assumed that filtering would give me full-text search of all the cards on a board. But no, it only searches within titles, labels and members. I have to use the search bar for full text search. I wish filtering and searching was a single unified function.

I think Trello can work well as a Zettel note archive. I know many people are already using it for daily knowledge work. For me the lack of undo and versioning is a problem, and I would rather not be so dependent on an internet connection for my work. So for now I am not using Trello as my Zettelkasten tool. But I still use it for project management and simple knowledge management on various team projects.

Give Trello a try, and let us know if you use it to build a Zettel note archive. And tell us if you have any questions or suggestions to improve this article. Thanks!

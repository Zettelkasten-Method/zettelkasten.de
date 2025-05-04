---
title: "Optimize Productivity by Measuring the Mightiness of your Zettelkasten"
created_at: 2025-05-04 09:37:00 +0200
kind: article
author: "sascha"
tags: [ quantification, measuring, productivity,   ]
rel_image: 2024-01-16_knoten-kanten.png
vgwort: https://vg08.met.vgwort.de/na/7258bc5ff799482f9e1c2ff976b430c2
description: "The mightiness of the Zettelkasten serves as a valuable metric for measuring Zettelkasten productivity."
lang: en
canonical: "/posts/optimize-measure-productivity/"
---
If you want to increase your productivity, you need a method to measure it. After all, you need information on how high your actual productivity is and what effect changes in your working methods have. 

The subjective feeling of whether you had a good day has a big advantage and a big disadvantage. 

The big advantage is that at the end of the day you have a surprisingly accurate sense of whether you were productive or not. In my personal experience, people who are really satisfied with their day and consider it productive are rarely wrong. 

The disadvantage of the subjective feeling is that you tend to notice big changes and cannot attribute them to individual factors. In short: every little helps. But we don't feel the little.

The solution is to take a more precise measurement. In this way, we can measure small changes in our productivity and link them directly to the way we work. This allows us to make a system of consistent and small improvements to the way we work.

<%=insert_rel_image file: "2023-06-07-kleine-verbesserung.jpg", caption: "Source: https://jamesclear.com/continuous-improvement" %>

If we want to measure our "Zettelkasten productivity", we can use the **mightiness of our Zettelkasten**. The power is the number of all notes and realized links. I chose this measure because it corresponds to the entities in a network graph: Notes are nodes, links are edges. We therefore use power to measure the number of thoughts and the number of links between them. Of course, you have to follow the [principle of atomicity](https://zettelkasten.de/atomicity/) so that each note corresponds to an idea and a link to a connection between two ideas.

<%=insert_rel_image file: "2024-01-16_knoten-kanten.png", caption: "Example for power: here I count a total of 8 notes and 5 connections" %>

If you use [our app *The Archive*](https://zettelkasten.de/the-archive) and our [recommended scheme for ID's](https://zettelkasten.de/posts/add-identity/), you can easily measure the daily change in mightiness: You search for today's date. To do this, remove the digits for minutes and hours from the complete ID. I use a [Keyboard Maestro macro](https://zettelkasten.de/the-archive/macros/) for this. I just type in `qheu` and Keyboard Maestro replaces the string with today's date. (e.g. `20230629` for June 29, 2023)

<%=insert_rel_image file: "2023-06-29-produktivitaet-messen.png", caption: "44 finds for notes I wrote on 2023-06-29 or that contain links (top two)" %>

This shows you the new notes and links for today: you get the notes that were created today because their ID contains the date. And you get all links to these new notes through the full text search, because these links work with the ID and also contain the date. The total amount of search results is therefore both all notes with the date in the title, i.e. the new ones from today, and all notes with the date in the full text (usually as a link). This can be used as a measure of daily productivity.

Of course, this method has a weakness: if you put a reference to a note that is not from today, this reference is not counted. However, if we assume that the number of references to the new notes of the day correlates with all links set for the day, we can trust the measurement despite this weakness.

Alternatively, the list could be sorted by modification date. Then you get all the notes that were touched and changed today. However, the weakness of this method is that we get false positive results. If you have accidentally typed in a note or just changed a spelling mistake, this note will be shown as recently edited and thus distort the result. Again, as long as this number correlates with actual productivity, we don't have a problem.

It's a bit like the "FM score" (Fat/Muscle Score) that I use to monitor my body composition: I divide my body weight by my waist circumference. This number tells me what my fat-to-muscle ratio is. This measurement is imprecise because the abdominal circumference cannot be measured precisely. However, it is precise enough to monitor major changes and the measurement is precise enough to give me an indication of my fat-to-muscle ratio. 

So I'm quite happy with the "change in mightiness" measure to gauge my productivity. Not only is it precise enough for me. I can also collect it quickly and easily using Keyboard Maestro Macro. 

## Something to Test for Yourself

You can try measuring your productivity right away: 

First measure your productivity for 2 weeks to determine your basic level. Count all new notes and links of the day for each day, i.e. the mightiness of your Zettelkasten. Then test changes in your workflow. If you need inspiration for actions, here are some that I find particularly useful:

- [ ] Switch your browser completely to black and white so that the internet is less of a distraction. Also set your smartphone to black and white.
- [ ] When you drink coffee, add a tablespoon of MCT oil. This leads to a short-term increase in ketone body production. This is beneficial for your brain's energy supply.

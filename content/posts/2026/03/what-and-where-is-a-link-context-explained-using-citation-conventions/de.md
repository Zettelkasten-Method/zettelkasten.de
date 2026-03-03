---
title: "Was und wo ist ein “Link-Kontext”? Erklärt am Beispiel korrekter Zitation"
created_at: 2026-03-03 15:54:05 +0100
kind: article
author: "christian"
tags: [ Wissenschaftliches-Arbeiten, Zitieren, Verweis,  ]
rel_image: ./thumb.png
description: "Wir schreiben viel über den Kontext, in dem man Links platziert. Die Idee ist angelegt an Fußnoten und Zitieren in wissenschatlichem Schreiben. Hier sind einfache Erklärungen und Beispiele dafür."
lang: de
canonical: /posts/what-and-where-is-a-link-context-explained-using-citation-conventions/
custom_path: "/de/posts/was-und-wo-ist-ein-link-kontext/"
---
Falls du nicht akademisch ausgebildet wurdest, ist die Wahrscheinlichkeit groß, dass dir nie jemand die grundlegenden Zitationskonventionen erklärt hat. Korrektes Zitieren ist nicht schwer, aber etwas, das man ein Mal lernen (und im Zettelkasten zur Referenz ablegen) muss.

Ich stelle drei Beispiele vor. Ich habe die Form einer Fußnote gewählt, da dies eine verbreitete Möglichkeit ist, Behauptungen zu belegen, die sich gut auf andere Kontexte übertragen lässt.

Diese Regeln gelten auch für Links innerhalb deines Zettelkastens. Sascha spricht [in der Einführung](https://zettelkasten.de/introduction) von "Link-Kontexten", und genau die sind hier auch gemeint. Link-Kontexte zu gestalten bedeutet, einen Satz mit einem Link darin so zu formulieren, dass du mit Sicherheit weißt, was du auf der anderen Seite des Links findest.

## Wortbezogener Kontext

<%= insert_rel_image file: "word.png", caption: %Q{Setze einen Verweis nach einem Wort, bezieht sich der Link auf das Wort} %>

Die <code><sup>1</sup></code> ist die Fußnote. Wenn du sie direkt hinter ein Wort setzt, bezieht sie sich nur auf dieses Wort. Verwende das, um Konzepte oder Begriffe zu erläutern.

Wie sieht es mit zusammengesetzten Bezeichnungen aus, wie Fachbegriffen oder Eigennamen, die aus mehreren Wörtern bestehen? In einer nützlichen Sprache wie Deutsch kannst du nach Belieben unendlich lange Substantive bilden, also gilt die gleiche Regel ;) Im Englischen musst du dich hingegen auf dein Sprachgefühl verlassen, um zusammengesetzte Begriffe als Einheit zu erkennen.

Beispiele, mit hervorgehobenem Kontext:

<pre>Ich mag <mark>Markdown</mark><sup>1</sup> sehr.</pre>

<pre>Mein <mark>Zettelkasten</mark><sup>2</sup> ist ein erstaunliches Werkzeug.</pre>

<pre>Es ist Zeit, die <mark>Steinzeit</mark><sup>3</sup> der Produktivität zu verlassen.</pre>

<pre>Der <mark>Cirque du Soleil</mark><sup>4</sup> besucht nächste Woche die Stadt.</pre>

Beachte, dass der Kontext in einem Fall "Cirque du Soleil" ist und nicht nur "Soleil". Wenn du das liest, stört dich die Wortlücke wahrscheinlich nicht. Intuition ist hier alles, was wir haben.

## Phrasen und Sätze

<%= insert_rel_image file: "./sentence.png", caption: %Q{Platziere einen Link nach einem Satzzeichen, dann ist der Satz(teil) der Bezug} %>

Sätze und Phrasen enden mit Satzzeichen wie `.` oder `,` oder `!`, und manchmal findest du zwischengelagerte Satzzeichen, die einen Bereich definieren, wie `(...)` für einen Einschub, `"..."` für ein Zitat oder `¡...!` für einen spanische Ausruf.

Satzzeichen machen das Auffinden des Bereichs einfach: Du musst nur nach dem nächsten Satzzeichen auf der gleichen Ebene suchen, um den Kontext zu kennen. Das könnte ein kompletter Satz, eine Klammer oder ein Nebensatz sein.

Beispiele, mit hervorgehobenem Kontext:

<pre>Wusstest du: <mark>Markdown wurde von John Gruber erfunden.</mark><sup>1</sup></pre>

<pre>Niklas Luhmann, <mark>der Pate des Zettelkastens,</mark><sup>2</sup> lebte in Oerlinghausen.</pre>

<pre>Höhlenmenschen <mark>(die eigentlich gar nicht so oft in Höhlen lebten)</mark><sup>3</sup> 
nutzten Steingeräte.</pre>

<pre>Der Cirque du Soleil entstand <mark>"als eine Künstlergruppe namens Les Échassiers"</mark><sup>4</sup> 
mit <mark>"[i]hrer ersten offiziellen Produktion Le Grand Tour du Cirque du Soleil [...] im Jahr 1984"</mark><sup>5</sup>.</pre>

Beachte, dass ich im letzten Beispiel zwei unabhängige Zitate eingebaut habe, um zu zeigen, wie du leicht mehrere Kontexte in einen Satz einbetten kannst.

## Blöcke und Absätze

<%= insert_rel_image file: "blockquote.png", caption: %Q{Zitatblöcke korrekt zu markieren ist am leichtesten, weil man im Zitatblock schon den Bezug sieht. Das ist beim Referenzieren mit Links nicht anders} %>

Blockzitate sind Zitate, die mehrere Zeilen umfassen und sich nicht einfach in den Textfluss einfügen lassen. Daher setzt man das Zitat in einen eigenen Absatz oder Block. Ich habe zwei Verfahrensweisen für die Zitation dort gesehen:

1. Das Zitat einleiten und die Einleitung mit einem Doppelpunkt `:` beenden und die Referenz dort platzieren, vor dem eigentlichen Zitat, oder
2. Das Zitat einleiten, das Zitat als Block einfügen und die Referenz am Ende dieses Blocks platzieren.

Während der erste Ansatz in gedruckten Texten funktionieren mag, würde ich im Zettelkasten den zweiten bevorzugen. Wenn die Zitation/Referenz/der Link im Blockzitat enthalten ist, kannst du den Block direkt so kopieren, und er bleibt dennoch eigenständig. Zugegeben, das ist eine sehr kleine Verbesserung der Ergonomie beim Kopieren und Einfügen. Aber es zeigt die Robustheit dieses Ansatzes.

Beispiele für beide Ansätze, beginnend mit "Referenz nach Einleitung":

<pre>
Sascha weist darauf hin, wie wichtig Link-Kontexte sind:<sup>1</sup>

&gt; <mark>Diese Art der Verbindung ist eine der Schlüsselmechanismen</mark>
&gt; <mark>der Wissensentstehung im Zettelkasten: Die Bedeutung des</mark>
&gt; <mark>Links, das Warum des Links, ist explizit. Durch die explizite</mark>
&gt; <mark>Aussage des Warums wird Wissen geschaffen.</mark>
</pre>

... und "Referenz nach Blockzitat":

<pre>
Sascha weist darauf hin, wie wichtig Link-Kontexte sind:

&gt; <mark>Diese Art der Verbindung ist eine der Schlüsselmechanismen</mark>
&gt; <mark>der Wissensentstehung im Zettelkasten: Die Bedeutung des</mark>
&gt; <mark>Links, das Warum des Links, ist explizit. Durch die explizite</mark>
&gt; <mark>Aussage des Warums wird Wissen geschaffen.</mark><sup>1</sup>
</pre>

## Anwendung auf deinen Zettelkasten

[Verbindungen zwischen Notizen herzustellen](https://zettelkasten.de/introduction/#connecting-zettel) ist das tägliche Brot beim Arbeiten mit deinem Zettelkasten.

Mit diesen drei einfachen Fällen zur Erkennung von Kontexten kannst du nun auch das Design deiner Notizen selbstbewusst gestalten, um die Lesbarkeit zu maximieren:

Du kannst mit einem Link beginnen und dann entscheiden, wie der Kontext aussehen muss:

- Erklärt die Ziel-Notiz ein Konzept? Setze den Link neben ein Wort.
- Stützt die Ziel-Notiz eine Behauptung? Setze den Link hinter den Satz, der deine Behauptung beinhaltet.
- Ist die Ziel-Notiz lediglich ein Punkt in einer Struktur wie einer Aufzählung, Liste oder Tabelle? Setze den Link neben den (falls nötig: gekürzten) Titel der Notiz.

----

**Saschas Kommentar:** Es gibt wenig hinzuzufügen. Ein äußerst praktischer Artikel von Christian. Aber es gibt einen Kontext, den ich euch noch bewusst machen möchte. Viele der Fähigkeiten, gute Notizen zu erstellen, sind nicht spezifisch für die Zettelkasten-Methode. Sie stammen vielmehr aus verschiedenen Bereichen. Ein weiteres Beispiel ist der Umgang mit Argumenten. Es gibt keinen Zettelkasten-spezifischen Ansatz. Stattdessen wendet ihr eure bestehenden Fähigkeiten an, um die Argumente zu verarbeiten, wie z.B.: Die Identifizierung der Prämissen, des Schlusses und der logischen Form; das Hinzufügen von Notizen zu den Stärken und Schwächen des Arguments; das Bereitstellen empirischer Belege für die Wahrheit der Prämissen.

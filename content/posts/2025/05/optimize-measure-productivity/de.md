---
title: "Optimiere deine Produktivität: Die Mächtigkeit des Zettelkastens als Maßzahl"
created_at: 2025-05-04 09:36:00 +0200
kind: article
author: "sascha"
tags: [ Produktivität, Messen, Quantifizieren ]
rel_image: 2024-01-16_knoten-kanten.png
vgwort: https://vg08.met.vgwort.de/na/7258bc5ff799482f9e1c2ff976b430c2
description: "Die Mächtigkeit des Zettelkasten ist eine nützliche Maßzahl, um die Zettelkastenproduktivität zu messen."
lang: de
canonical: "/posts/optimize-measure-productivity/"
---
Wenn man seine Produktivität verbessern will, braucht man eine Methode, um die Produktivität zu messen. Schließlich braucht man Informationen darüber, wie hoch die tatsächliche Produktivität ist und welchen Effekt Veränderungen in der Arbeitsweise haben. 

Dabei hat das subjektive Gefühl, ob man einen guten Tag hatte, einen großen Vorteil und einen großen Nachteil. 

Der große Vorteil ist, das man am Ende des Tages ein erstaunlich zutreffendes Gefühl dafür hat, ob man produktiv war oder nicht. Meiner persönlichen Erfahrung nach irren sich Menschen selten, die mit ihrem Tag wirklich zufrieden sind und ihn als produktiv einschätzen. 

Der Nachteil des subjektiven Gefühls ist, dass man damit eher große Veränderungen bemerkt und diese nicht auf einzelne Faktoren zurückführen kann. Kurz gesagt: Kleinvieh macht auch Mist. Aber wir wissen nicht, welche Ziege uns nun guten Dünger gibt und welche nicht.

Die Lösung ist, dass wir eine genauere Messung vornehmen. So können wir kleinere Veränderungen unserer Produktivität messen und im Falle von Experimenten an unserer Arbeitsweise direkt mit der Arbeitsweise in Verbindung bringen. Das erlaubt uns, ein System beständiger und kleiner Verbesserungen an unserer Arbeitsweise vorzunehmen.

<%=insert_rel_image file: "2023-06-07-kleine-verbesserung.jpg", caption: "Quelle: https://jamesclear.com/continuous-improvement" %>

Wenn wir unsere "Zettelkastenproduktivität" messen wollen, können wir die **Mächtigkeit unseres Zettelkastens** benutzen. Die Mächtigkeit ist die Anzahl aller Zettel und realisierter Verknüpfungen. Ich habe mich für diese Maßzahl entschieden, weil sie den Entitäten in einem Netzwerk entsprechen: Zettel sind Knoten, Verknüpfungen sind Kanten. Mit der Mächtigkeit messen wir also die Anzahl der Gedanken und die Anzahl ihrer Verknüpfungen untereinander. Natürlich muss man dafür dem [Prinzip der Atomizität](https://zettelkasten.de/atomicity/) folgen, damit ein Zettel einem Gedanken entspricht und eine Verknüpfung einer Verknüpfung zweier Gedanken.


<%=insert_rel_image file: "2024-01-16_knoten-kanten.png", caption: "Beispiel für Mächtigkeit: hier zähle ich insgesamt 8 Zetteln und 5 Verbindungen" %>

Wenn man [unsere App *The Archive*](https://zettelkasten.de/the-archive) und unser [empfohlenes Schema für ID's](https://zettelkasten.de/posts/add-identity/) verwendet, kann man die tägliche Veränderung der Mächtigkeit ganz einfach messen: Man sucht nach dem heutigen Datum. Dazu entfernt man von der vollständigen ID die Ziffern für Minuten und Stunden. Ich nutze dafür ein [Keyboard Maestro Makro](https://zettelkasten.de/the-archive/macros/). Ich tippe nur `qheu` ein und Keyboard Maestro ersetzt den String durch das heutige Datum. (z.B. `20230629` für 29. Juni 2023)

<%=insert_rel_image file: "2023-06-29-produktivitaet-messen.png", caption: "44 Funde für Zettel, die ich am 2023-06-29 verfasst habe, oder die Links enthalten (oberen zwei)" %>

Dadurch werden einem die neuen Zettel und Verknüpfungen des heutigen Tages angezeigt: man bekommt die Zettel, die am heutigen Tag erstellt wurden, weil deren ID das Datum enthält. Und man bekommt durch die Volltextsuche alle Links auf diese neuen Zettel, weil diese Links mit der ID funktionieren und auch das Datum enthalten. Die Gesamtmenge der Suchergebnisse ist also sowohl alle Notizen mit dem Datum im Titel, d.h. die neuen von heute, als auch alle Notizen mit dem Datum im Volltext (in der Regel als Link). Dies kann man als Maßzahl der täglichen Produktivität verwenden.

Natürlich hat diese Methode eine Schwäche: Setzt man einen Verweis auf einen Zettel, der nicht von heute ist, wird dieser Verweis nicht gezählt. Wenn wir jedoch annehmen, dass die Anzahl der Verweise auf die neuen Zettel des Tages mit allen gesetzten Verknüpfungen des Tages korreliert, können wir der Messung trotz dieser Schwäche vertrauen.

Alternativ könnte man die Liste nach Änderungsdatum sortieren. Dann erhält man alle Zettel, die man heute angefasst und verändert hat. Doch die Schwäche dieser Methode ist, dass wir falsch positive Ergebnisse erhalten. Hat man aus Versehen in einem Zettel getippt oder nur einen Rechtschreibfehler geändert, wird dieser Zettel als kürzlich bearbeitet angezeigt und verfälscht damit das Ergebnis. Auch hier gilt: Solange diese Zahl mit der tatsächlichen Produktivität korreliert, haben wir kein Problem.

Es ist ein klein wenig mit dem "FM-Score" (Fat/Muscle Score) vergleichbar, den ich benutze, um meine Körperzusammensetzung zu überwachen: Dabei teile ich das Körpergewicht durch den Bauchumfang. Diese Zahl gibt mir Auskunft darüber, wie es mit meinem Fett-Muskel-Verhältnis steht. Diese Maßzahl ist ungenau, weil der Bauchumfang nicht präzise zu messen ist. Doch sie ist präzise genug, um größere Veränderungen zu überwachen, und die Maßzahl ist präzise genug, um mir einen Aufschluss darüber zu geben, wie es mit meinem Fett-Muskel-Verhältnis steht. 

Daher bin ich recht zufrieden mit der Maßzahl "Mächtigkeitsveränderung", um meine Produktivität zu vermessen. Sie ist mir nicht nur präzise genug. Darüber hinaus kann ich sie per Keyboard Maestro Makro schnell und problemlos erheben. 

## Ausprobieren

Du kannst die Messung der Produktivität gleich ausprobieren: 

Miss deine Produktivität zunächst für 2 Wochen, um dein Grundniveau festzustellen. Zähle alle neuen Zettel und Links des Tages für jeden Tag, also den Zugewinn an Mächtigkeit deines Zettelkastens. Dann teste Maßnahmen. Falls du Inspiration für Maßnahmen brauchst, sind hier einige, die ich für besonders nützlich halte:

- [ ] Stelle deinen Browser komplett auf Schwarz-Weiß um, sodass das Internet einen geringeren Ablenkungsreiz bietet. Dein Smartphone stellst du ebenfalls komplett auf schwarz-weiß.
- [ ] Wenn du Kaffee trinkst, füg einen Esslöffel MCT-Öl hinzu. Das führt zu einer kurzfristig erhöhten Ketonkörperproduktion. Das ist förderlich für die Energieversorgung deines Gehirns.

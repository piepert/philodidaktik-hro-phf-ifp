#import "template.typ": *

// hacky, evtl. überarbeiten
#let orefh = refheading
#let refheading(key) = ["#orefh(key)"]

= Änderungsverlauf
Da der KÜK noch in Arbeit ist, werden hier die Änderungen jeder Version transparent aufgelistet.

*Die nächsten Ziele:*

- technisch:
    - Seitennummerierung im Index korrigieren (Ursache des Fehlers unklar)

== Version 2024-12
*Hinzugefügt:*

- Text, fachlich:
    - SPÜ-Teil
    - Hinweise für die Klausur zur Einführung in die Philosophiedidaktik
    - Abschnitt: #refheading(<ephid-dimensionen-problemreflexion>)
    - Definition "ephemere Medien" wieder in geänderter und belegter Form
    - Umgang mit ephemeren Medien erweitert
    - Belege für Sachnorm, individuelle und soziale Bezugsnorm anhand Literatur der pädagogischen Psychologie
    - Sokrates' elenktisches Verfahren in #refheading(<ephid-historische-standpunkte>)
    - neue #taskref("kritikMartens") und #taskref("bub-normen")
    - Lösung für #taskref("langer-diskursiv-präsentativ"), #taskref("kritikMartens"), #taskref("kompetenzbegriff-weinert"), #taskref("drei-aufgabenstellungen"), #taskref("methoden-martens"), #taskref("martens-vs-rohbeck"), #taskref("neosokr-ges-vs-inquiry"), #taskref("pest-vs-inquiry"), #taskref("bub-normen"), #taskref("intersubjektivität"), #taskref("philosophie-ersatzfach")
    - Hinweise für Cuts in #refheading(<ephid-unterrichtsplanung>)

- gestalterisch, strukturell:
    - Literaturverzeichnis

- technisch:
    - (automatisch generiertes) Literaturverzeichnis
    - Anpassungen am Template
    - automatisch halbe Leerzeichen zwischen Abkürzungen wie "z.B.", "o.ä.", etc.

*Geändert:*

- Text, fachlich:
    - *Fehlinterpretation der Anforderungsbereiche behoben*: Aufteilung in #refheading(<ephid-anforderungsbereiche>) und #refheading(<ephid-dimensionen-problemreflexion>)
    - Zielformulierung in #refheading(<ephid-ziele-aufgabenstellungen>) in Richtziele, Grobziele und Feinziele differenziert
    - Reihenfolge der Methodenschlange nur noch als sinnvoll, nicht mehr obligatorisch, mit Belegen ergänzt
    - PEST-Modell: Kompetenzausbildung muss nicht allein in der Erarbeitungsphase geschehen
    - Martens sokratisch-aristotelische Methoden: Zitation angepasst
    - Martens Kulturtechnik: Technik-Aspekt differenziert
    - Sozialformen einzelner Methoden angepasst
    - Anforderungen an Leistungsbewertung überarbeitet, Begrifflichkeiten allgemeiner und genauer definiert
    - Formulierung in #refheading(<ephid-missverständisse-der-leistungsbewertung>) verändert
    - Abkürzung "AFB" für "Anforderungsbereich" EPA-gemäß in "AB" geändert
    - Zitate sokratisches Gepsräch von Heckmann und Nelson, Umstrukturierung und Neuformulierung

- Text, sonstiges:
    - Einleitungstext, der KÜK ist nun nicht mehr nur für das Seminar "Einführung in die Philosophiedidaktik" gedacht, sondern auch für die SPÜ und folgende Veranstaltungen
    - Rechtschreibung und Grammatik hier und da angepasst
    - alphabetische Nummerierung (A, B, ...) von Aufgaben in arabische Nummerierung (1, 2, ...)
    - "Lösung" zu "Lösungsvorschlag" umbenannt

- gestalterisch, strukturell:
    - Änderungsverlauf nun genauer und ganz am Ende des Dokuments
    - #refheading(<ephid-grundfragen-der-philosophiedidaktik>) und #refheading(<ephid-selbstverständnis-der-philosophie>) getauscht

- technisch:
    - Austauschen aller händisch angelegten Literaturverweise durch automatisch erzeugte
    - technische Überarbeitung der fehlerhaften und nur eingeschränkt funktionierenden Umsetzung und Verlinkung von Endnoten, Aufgaben und Indexeinträgen
    - aufgr. technischer Probleme wurden die Kategorisierung in Seitenzahlen in den Anhängen entfernt, und werden evtl. in späteren Versionen wieder hinzugefügt
    - falsche Nummerierung von Aufgaben, die Beispiel-Lernerfolgskontrollen haben den Aufgabenzähler der KÜK-Aufgaben beeinflusst (das tun sie nun nicht mehr sondern sind nun unabhängige Zähler)

// Gelöscht:
// Sonstiges:

*Bekannte Fehler:*
    - falsche Seitennummerierung ab Index, Lösung hat hohe Priorität, jedoch bisher grundlegend keine Idee für eine Lösung vorhanden

== Version 2024-04

*Hinzugefügt:*

- Text, fachlich:
    - Belege im Abschnitt "Historische Standpunkte zur Philosophiedidaktik"

- Text, sonstiges:
    - Änderungsverlauf
    - Hinweis zur Zitierfähigkeit des KÜKs

- gestalterisch, strukturell:
    - Teile, Vorbereitungen für den SPÜ-Teil des KÜKs (in Aufbau)

*Geändert:*

- Text, fachlich:
    - "Transformationsphase" → "Transferphase"

*Gelöscht:*

- Text, fachlich:
    - Definition "ephemere Medien", da Belege fehlten und die Definition unsicher war

// Sonstiges:

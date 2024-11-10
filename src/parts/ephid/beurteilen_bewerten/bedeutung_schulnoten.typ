#import "/src/template.typ": *

== Bedeutung der Schulnoten

#set par(justify: false)
#grid(columns: 3,
    column-gutter: 0.5em,
    row-gutter: 1em,
    strong[Note], [#h(3cm)], strong[Bedeutung],
    [1], [sehr gut], [
        Die Leistung #underline[entspricht den Anforderungen in besonderem Maße], d.h. sie erbringt mehr als ursprünglich erwartet wurde.
    ],

    [2], [gut], [
        Die Leistung #underline[entspricht voll den Anforderungen], die Aufgaben wurde ausführlich und inhaltlich korrekt bearbeiet.
    ],

    [3], [befriedigend], [
        Die Leistung #underline[entspricht allgemein den Anforderungen], jedoch treten geringe Lücken oder Fehler auf.
    ],

    [4], [ausreichend], [
        Die Leistung #underline[entspricht im Ganzen noch den Anforderungen], wird jedoch durch Fehler und inhaltliche Lücken beeinträchtigt.
    ],

    [5], [mangelhaft], [
        Die Leistung #underline[entspricht nicht den Anforderungen]. Es häufen sich inhaltliche Fehler und die Darstellung ist lückenhaft.
    ],

    [6], [ungenügend], [
        Die Leistung #underline[entspricht nicht den Anforderungen]. Durch gravierende inhaltliche Fehler entsteht keine vermittelte Information.
    ])
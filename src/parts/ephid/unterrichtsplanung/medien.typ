#import "/src/template.typ": *

== #ix("Medien", "Medien", "Medium")

#def("Medien", [
    Medien sind Träger und Halter von Informationen.
])

#def("ephemere Medien", [
    Ephemere Medien sind kurzlebige, nur im Augenblick bestehende Medien. Im Gegensatz zu einem Bild ändert sich das Medium Film stetig und wirkt durch diese Kurzlebigkeit anders als ein Bild. Die Art der Wahrnehmung ist in beiden Fällen eine andere. Auch die Sprache ist ein ephemeres Medium.
], "Medium, ephemere")

Medien sind vielfältig und können im Unterricht verschiedene Aufgaben erfüllen. Unter anderem könnte man sie wie folgt einteilen:

#[
    #set par(justify: false)
#table(columns: 5,
    inset: 0pt,
    column-gutter: 1.125em,
    row-gutter: 1em,
    stroke: none, ..(
    [schriftliche Medien],
    [graphische Medien],
    [visuelle Medien],
    [akustische Medien],
    [Gegenstände]
    ).map(e => strong(e)),

    [Textauszüge],      [Tagelbilder],  [Bilder],       [Musik], [Statuen],
    [Schulbücher],      [Schemata],     [Karikaturen],  [Tonaufnahme], [Denkmäler],
    [Populärliteratur], [Diagramme],    [Kurzvideos],   [Hörspiele], [Modelle],
    [Gedichte],         [],             [Filme],        [Hörbücher], [],
    [],                 [],             [Comics],       [], [],
)
]

#todo[Im Bezug auf Descartes ergänzen: Reportage über Supersinne der Tiere, optische Täuschungen, Matrix, Inception, irgendwas zu Gehirn im Tank?]
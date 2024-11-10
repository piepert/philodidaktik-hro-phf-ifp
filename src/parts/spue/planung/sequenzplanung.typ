#import "/src/template.typ": *

== #ix("Sequenzplanung")

Eine Sequenzplanung (auch "Einheitenplanung") spezifiziert, wie viele Unterrichtsstunden einer gegebenen Länge sich mit welcher Thematik auseinandergesetzt wird. Es werden Richtziele genannt, die über die geplante Sequenz behandelt werden sollen. Die Thematik der Sequenz sollte -- genauso wie jede Unterrichtsstunde -- angemessen motiviert werden. Eine Sequenz "Gottesbegriffe" könnte etwa wie folgt aussehen:

#block(stroke: 1pt + black, inset: 1em)[
    #text(size: 0.75em)[
        Universität Rostock, Institut für Philosophie #h(0.5fr) Sequenzplanung \
        Schulpraktische Übung zum Philosophieren mit Kindern #h(0.5fr) [Namen der Lehrpersonen] \
        [Dozent*in] #h(0.5fr) [Datum] \
        [Schule], [Klasse] #h(0.5fr) \
    ]

    #align(center, text(size: 1.25em, strong[Sequenzplanung]))

    #show grid.cell.where(x: 0): align.with(right)

    #grid(
        columns: 2,
        row-gutter: 0.65em,
        column-gutter: 0.75em,

        strong[Thema:], [
            Gottesbegriffe
        ],

        strong[Richtziel:], [
            Die SuS setzen sich kritisch mit der Frage nach Gott und verschiedenen Gottesbegriffen auseinander.
        ],

        strong[Anzahl der Unterrichtsstunden:], [
            6
        ],

        strong[Dauer einer Unterrichtsstunde:], [
            45min
        ]
    )

    #let c = counter("no")

    #show table.cell.where(y: 0): strong
    #show table.cell.where(x: 0): it => locate(loc => {

        if c.at(loc).first() > 0 {
            block(inset: 5pt, c.display())
        } else {
            it
        }
    }) + c.step()

    #show table.cell.where(x: 0): strong

    #v(1em)

    #set par(justify: false)
    #set text(size: 0.9em)

    #table(
        columns: 6,
        stroke: none,

        ..range(5).map(e => {
            table.hline(y: e+2, stroke: (dash: "dotted"))
        }),

        table.header(
            [], table.vline(),
            [Datum], table.vline(),
            [Lehrperson(en)], table.vline(),
            [Thema], table.vline(),
            [Bemerkung],
            []
        ),

        table.hline(),

        // [], [
        //     Mi., 10.4.2024
        // ], [

        // ], [


        // ], [
        //     Hospitation
        // ],

        [], [
            Mi., 17.4.2024
        ], [
            C. Muster
        ], [
            Einführung: Gottesbegriffe
        ], [
            vorher Test,\
            restl. Zeit: etwa 20 min.

            Mindmap zu "Gott"
        ],

        table.cell(rowspan: 6, stroke: (left: 1pt + black), align: horizon, rotate(90deg, reflow: true)[
            *Gottesberiffe*
        ]),

        [], [
            Mi., 24.4.2024
        ], [
            A. Joe
        ], [
            Warum ist man auf der Suche nach Gott?
        ], [

        ],

        [], [
            Mi., 8.5.2024
        ], [
            B. Schmidt
        ], [
            Gotteswahrnehmung und Gottesbeweise -- (Wie) Nimmt man Gott wahr?
        ], [

        ],

        [], [
            Mi., 15.5.2024
        ], [
            C. Muster
        ], [
            Gottesbegriffe -- Was versteht man unter "Gott"?
        ], [

        ],

        [], [
            Mi., 22.5.2024
        ], [
            A. Joe
        ], [
            Gottesbilder -- Kann man Gott darstellen?
        ], [

        ],

        [], [
            Mi., 29.5.2024
        ], [
            B. Schmidt
        ], [
            Gottesbegriffe
        ], [
            Test
        ],
    )
]
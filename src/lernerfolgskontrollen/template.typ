#let project(
    topic: none,
    eh: false,
    stufe: 12,
    body
) = {
    set par(justify: false)

    grid(
        columns: (30%, 1fr, 30%),

        align(left)[
            #set text(size: 0.75em)
            Philosophie: Erkenntnistheorie \
            Klasse #stufe
        ],

        align(center + horizon, strong[
            #if not eh {[Lernerfolgskontrolle]} else {[Erwartungshorizont]} -- #topic
        ]),

        align(right)[
            #set text(size: 0.75em)
            [Name der Lehrkraft] \
            [Datum]
        ]
    )

    v(1em)

    set par(justify: true)
    body
}

#let citation(content, source) = {

    block(inset: (left: 1.75em, rest: 1em), stroke: (1pt))[
        #content

        #set text(size: 0.75em)
        #v(-0.5em)
        -- #source
    ]
}

#let task(points, content, number-format: n => numbering("1", n)) = {
    let c = counter("tasks")
    c.step()

    grid(columns: (auto, 1fr, auto),
        column-gutter: 1em,
        strong[A#context number-format(c.at(here()).first())],
        content,
        [#points P.]
    )
}
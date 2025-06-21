#let color-orange = rgb("#B85A22")
#let color-orange-light = rgb("#DD8047")
#let color-blue = rgb("#94B6D2")
#let color-brown = rgb("#775F55")

#let refpage(label) = link(label, context counter(page).at(label).first())
#let refheading(label) = link(label, context query(label).first().body)

#let index(name) = [#metadata((entry: name))<index>]

// todo: only first reference works
#let ix(b, ..args) = b + if args.pos().len() == 0 {
    if type(b) != str {
        panic("expected string, found "+str(type(b))+".")
    }

    index(b)
} else {
    args.pos().map(e => if type(e) != str {
        panic("expected string, found "+str(type(e))+".")
    } else {
        index(e)
    }).join([])
}

#let make-index(title: none) = context {
    let s = query(<index>)
    let last-first = none
    let last-word = none

    let pages = ()
    let pages-values = ()
    let entry

    for item in s.map(e => (e, lower(e.value.entry.replace("Ü", "ue")
            .replace("Ä", "ae")
            .replace("Ö", "oe")
            .replace("ü", "ue")
            .replace("ö", "oe")
            .replace("ä", "ae")
            .replace("ß", "ss"))))
        .sorted(key: e => e.at(1)) {

        let item = item.at(0)
        let loc = item.location()
        let pv = counter(page).at(loc).first() // page value

        entry = item.value.entry

        if last-word != none and last-word != entry {
            [
                #set par(spacing: 0.5em)
                #block(sticky: true, last-word)

                #set text(size: 0.75em, fill: color-brown)
                #block(grid(columns: (auto, 1fr), column-gutter: 0.5em)[#h(1.5em) --- ][S. #pages.join[, ]])
            ]

            pages-values = (pv, )
            pages = (link(loc.position(), [#pv]), )
            last-word = entry

        } else {
            if pv not in pages-values {
                pages-values.push(pv)
                pages.push(link(loc.position(), [#pv]))
            }

            last-word = entry
        }

        if last-first != lower(entry.first()) {
            last-first = lower(entry.first())
            heading(level: 2, last-first)
        }
    }

    [
        #set par(spacing: 0.5em)
        #block(sticky: true, last-word)

        #set text(size: 0.75em, fill: color-brown)
        #block(grid(columns: (auto, 1fr), column-gutter: 0.5em)[#h(1.5em) --- ][S. #pages.join[, ]])
    ]
}

#let note-note(state-key,
    key,
    number-format: numbering.with("1"),
    wrap-note: k => super(text(fill: color-brown, k))) = counter(state-key).step() + context {

    let counter-val = state(state-key, ()).at(here()).len()

    let origin = label(if key != none {
        key+"-ORIGIN"
    } else {
        state-key + "-ORIGIN-" + str(counter-val)
    })

    let target = label(if key != none {
        key+"-TARGET"
    } else {
        state-key + "-TARGET-" + str(counter-val)
    })

    [#link(target, wrap-note(number-format(counter(state-key).at(here()).first())))#origin]
}

#let note-content(state-key, body, key: none) = [#metadata((content: body, key: key))#label(state-key)]

#let add-note(key: none,
    number-format: numbering.with("1"),
    wrap-note: k => super(text(fill: color-brown, k)),
    state-key,
    body) = {

    note-note(state-key, key, wrap-note: wrap-note, number-format: number-format)
    note-content(state-key, body, key: key)
}

#let make-notes(state-key,
    title: [Anmerkungen],
    pretext: none,
    number-format: numbering.with("1"),
    wrap-all: k => k,
    wrap-note: k => super(text(fill: color-brown, k)),
    wrap-content: k => k) = context {

    if title != none {
        heading(title)
    }

    pretext
    set par(justify: true)

    let i = 1
    for item in query(label(state-key)) {
        counter(state-key).update(i)
        wrap-all(block({
            box(link(item.location(), wrap-note(number-format(i))))
            wrap-content[#item.value.content#if item.value.key != none {
                label(item.value.key+"-TARGET")
            } else {
                label(state-key + "-TARGET-" + str(counter(state-key).at(item.location()).first() - 1))
            }]
        }))

        i += 1
    }
}

#let en-note(key) = note-note("endnotes", key)

#let en-content(key, body) = note-content("endnotes", body, key: key)

#let en(key: none, body) = add-note(key: key, "endnotes", body)

#let ens(..args) = args.pos().map(e => en(e)).join(super[,])

#let enref(key) = context {
    for item in query(label("endnotes")) {
        if item.value.key == key {
            return en(item.value.content)
            // return [#link(key, super[#key])]
        }
    }

    panic("key '"+key+"' not found!")
}

#let make-endnotes() = make-notes("endnotes", title: [Anmerkungen])

#let todo(key: none, body) = add-note(
    key: key,
    number-format: numbering.with("(i)"),
    wrap-note: k => strong(text(fill: rgb("#ff0000"), super(k))),
    "todos",
    body
)

#let make-todos() = {
    make-notes("todos",
        title: [To Do],
        number-format: numbering.with("(i)"),
        wrap-note: k => strong(text(fill: rgb("#ff0000"), k+[ ])),
        pretext: [
            Einige Inhalte dieses Dokuments sind noch nicht gesichert mit dem Dozenten oder Quellen geklärt. Diese werden hier vermerkt und Folgefragen festgehalten.
        ]
    )
}

#let task(key: none, title, question, answer) = {
    show: block.with(inset: 1em, width: 100%, stroke: color-blue, breakable: false)

    set par(justify: false)
    add-note(
        key: key,
        wrap-note: k => strong[Aufgabe #k -- #title],
        number-format: numbering.with("1"),
        "tasks",
        [: ] + title + pad(left: 1.5em, answer))

    set par(justify: true)
    question
}

#let taskref(key) = context {
    for item in query(label("tasks")) {
        if item.value.key == key {
            return link(item.location(), [Aufgabe #numbering("1", ..counter("tasks").at(item.location()))])
        }
    }

    panic("key '"+key+"' not found!")
}

#let make-tasks() = {
    make-notes("tasks",
        title: [Lösungsvorschläge],
        wrap-note: k => strong[Lösungsvorschlag für #k],
        number-format: numbering.with("1")
    )
}

#let definition(name, content: none) = {
    let s = state("definitions")
    counter("definitions").step()

    return // none

    if name == none {
        name = repr(lower(content))
    }

    if content == none {
        content = name
    }

    context {
        let num = counter("definitions").at(here()).first()
        let lbl = name+"-"+str(num)

        [#s.update(k => {
            if type(k) != "dictionary" {
                k = (:)
            }

            if name in k {
                k.at(name).content.push(content)
                k.at(name).location.push((num, here()))
            } else {
                k.insert(name, ("content": (content,), location: ((num, here()),)))
            }

            k
        })#label(lbl)]
    }
}

#let def(key, body, ..ixs) = [
    #set par(hanging-indent: 1.5em)

    #if (ixs.pos().len() == 0) {
        definition(key)
        index(key)
    } else {
        definition(key)
        ixs.pos().map(e => index(e)).join([])
    }
    #strong[D#text(size: 0.8em)[EF].#box(place(left, dx: -3.5em, dy: -1em, text(size: 2em, fill: red, strong[!]))) #key]#definition(key) -- #body
]

#let make-definitions(title: none) = context {
    let s = state("definitions")
    let last-first = none

    if s.final() == none {
        return none
    }

    for item in s.final()
        .keys()
        .map(e => (e, lower(e)))
        .sorted(key: e => e.at(1)) {

        let original = item.at(0)
        let small = item.at(1)

        if last-first != small.first() {
            // if last-first != none {
            //     v(1em)
            // }

            last-first = small.first()

            // set text(fill: white)
            // block(width: 100%, fill: color-blue, inset: 0.5em, upper(upper(last-first)))
            heading(level: 2, upper(last-first))
        }

        let e = s.final().at(original)

        grid(columns: (1fr, auto),
            column-gutter: 0.5em,
        )[
            #e.content.dedup().first()
        ][
            #let i = 1
            #let pages = e.location.map(e => {
                // let lbl = original+"-"+repr(e.position().x)+"-"+repr(e.position().y)
                let lbl = original+"-"+str(e.first())
                (e.last().page(), link(label(lbl), str(e.last().page())))
            }).dedup(key: e => e.at(0)).map(e => e.at(1))

            #for p in pages {
                p

                if i < pages.len() {
                    [, ]
                }

                if calc.rem(i, 3) == 0 {
                    [\ ]
                }

                i += 1
            }
        ]
    }
}

#let make-title-page() = {
    grid(columns: (25%, 75%), column-gutter: 0.25cm, row-gutter: 0.5cm, [

        ], [
            #set text(size: 4.5em, fill: color-brown)
            #show: upper
            // #show: strong

            Aller\
            Anfang ist... \
            Klagerisch \
            #box(image(width: 100%, "titlepage_image.png"))

        ], block(fill: color-orange-light,
            width: 100%,
            height: 2.5cm,
            inset: 0.5cm)[

            #set text(fill: white, size: 2.75em)
            // #show: strong
            #align(center + horizon)[KÜK]

        ], block(fill: color-blue,
            width: 100%,
            height: 2.5cm,
            inset: 0.5cm)[

            #set par(justify: false, leading: 0.4em)
            #set text(fill: white, size: 1.75em)

            #show: align.with(center + horizon)

            [Klager-Überlebens-Koffer für das Lehramtsstudium der Philosophie an der Universität Rostock]

        ], [

        ], block(inset: 5pt)[
            Der KÜK umfasst grundlegende, methodische und inhaltliche Überlebenstipps für das Bestehen der Klausur "Einführung in die Philosophiedidaktik", die Seminarvor- und Nachbereitung und die Prügungsvorbereitung am Institut für Philosophie der Universität Rostock. Die #context {
                let headings = query(selector(heading.where(
                    outlined: true,
                    level: 1)))

                let headings-after-nosubs = state("headings", ()).final()
                    .map(e => int(e.parent.split("-").last()))
                    .filter(e => e > int(state("no-subs", (parent: "0-0")).final().parent.split("-").last()))

                // calculate number of headings without those, who are in the last part (no-subs-part, which is tagged)
                headings.len() - headings-after-nosubs.len()
            }-teilige Grundausrüstung richtet sich an alle Lehramtsstudent*innen der Philosophie und soll den Start in das Studium erleichtern. Der KÜK versteht sich prozessorientiert und erlaubt individuelle Ergänzungen. Die zusammengefassten Hinweise sind jedoch für das Lehramtsstudium der Philosophie als wichtig anzusehen. Diese Sammlung ersetzt nicht das Nachfragen und Nachdenken; wenn Inhalte, Formalia oder Methoden unklar erscheinen, sollten Dozierenden und Mitstudierenden um Rat gefragt werden.

            #set text(size: 0.8em)
            Verantwortung und Betreuung: Gruppe "#box(move(dy: 0.25em, circle(stroke: 0.5pt, radius: 0.6em, move(dx: -0.42em, dy: -1.15em, $phi$)))) Philo lernen" © 2023-2024

            Autor: Tristan Pieper, Version: #datetime.today().display("[year]-[month]")
        ])
}

#let add-outline(it-element, it-body, type) = {
    state("outline", ()).update(k => {
        k.push((
            origin: label("ref-outline-"+str(k.len())),
            type: type,
            content: it-body
        ))

        k
    })

    context {
        let origin = label("ref-outline-"+str(state("outline", ()).at(here()).len() - 1))
        block[#it-body#origin]
    }
}

#let add-part(it) = add-outline(it, it, "part")
#let add-heading(it) = add-outline(it, it.body, "heading")
#let add-subheading(it) = add-outline(it, it.body, "subheading")

#let make-part(p, subtitle: none) = {
    pagebreak(to: "odd")

    align(horizon, {
        set par(spacing: 0.5em, justify: false)
        show: align.with(horizon)

        {
            set text(size: 4.5em, fill: color-brown)
            add-part(p)
        }

        counter("parts").step()
        context {
            set text(size: 2em, fill: color-brown)
            set text(fill: color-orange)
            [Abschnitt #numbering("I", counter("parts").at(here()).first())]

            if subtitle != none {
                [ -- ]
                subtitle
            }
        }
    })

    pagebreak()
}

#let make-outline() = context {
    v(1em)
    heading(outlined: false)[Aller Anfang ist... klagerisch]
    v(-1em)
    text(fill: color-orange, tracking: 0.25em, strong(upper[Inhaltsverzeichnis]))

    show: pad.with(x: 1cm, y: 1.5cm)

    let part-counter = 1
    let heading-counter = 1
    let subheading-counter = 1

    let noheads = false
    let arr = ()

    let dotted-underline(item) = box(inset: (bottom: 0.25em),
        stroke: (bottom: (dash: "dotted")),
        link(item.origin, item.content +
        h(1fr) +
        str(query(item.origin).first().location().page())))

    for item in state("outline", ()).final() {
        if item == "noheads" {
            noheads = true
            continue
        }

        if item.type == "part" {
            if arr.len() > 0 {
                grid(columns: 3,
                    column-gutter: 7pt,
                    row-gutter: 4pt,
                    ..arr)

                arr = ()
            }

            arr.push(grid.cell(colspan: 3, v(1em) + link(item.origin, heading(outlined: false, level: 2)[#numbering("I.", part-counter) #item.content])))
            part-counter += 1

        } else if item.type == "heading" {
            arr.push(grid.cell(colspan: 1, [#(heading-counter).]))
            arr.push(grid.cell(colspan: 2, dotted-underline(item)))

            heading-counter += 1
            subheading-counter = 1

        } else if item.type == "subheading" and not noheads {
            arr.push(grid.cell[])
            arr.push(grid.cell([#(heading-counter - 1).#subheading-counter.]))
            arr.push(grid.cell(dotted-underline(item)))

            subheading-counter += 1
        }
    }

    if arr.len() > 0 {
        grid(columns: 3,
            column-gutter: 7pt,
            row-gutter: 4pt,
            ..arr)
    }
}

#let author(name) = {
    show: none
    counter("kuek-part").step()
    set text(fill: color-blue)
    show: strong

    // [KÜK -- Hilfe Nr. #counter("kuek-part").display() -- Autor: ]
    [KÜK -- Hilfe Nr. #context {
        str(state("headings").at(here()).len())

        if counter("subheadings").at(here()).first() > 0 {
            [.] + counter("subheadings").display()
        }
    } -- Autor: ]
    name
}

#let make-orange = text.with(fill: color-orange)

#let orange-list(..items) = {
    set text(fill: color-orange)
    list(tight: false, indent: 1.5em, marker: [■], ..items)
}

#let orange-list-with-body(parred: true, ..items) = {
    let index = 1
    let body = []
    let elements = ()

    for e in items.pos() {
        if calc.even(index) {
            let obody = text(fill: color-orange, body)

            elements.push({
                if parred {
                    block(obody)
                } else {
                    obody
                }

                text(fill: black, e)
            })
        } else {
            body = e
        }

        index += 1
    }

    orange-list(..elements)
}

#let project(body) = {
    set page(margin: 2cm)

    set text(font: "Tw Cen MT", size: 12pt, lang: "de")
    set par(justify: true, linebreaks: "optimized", leading: 0.5em)

    show heading.where(level: 1, outlined: true): it => add-heading(it)
    show heading.where(level: 1): set text(size: 1.75em)
    // show heading.where(level: 2): set block(above: 1.5em)
    show heading.where(outlined: true, level: 2): it => add-subheading(it)
    show heading.where(level: 2): upper

    show heading: set par(justify: false)
    show heading: set text(fill: color-brown, size: 1.25em, weight: "regular")

    set enum(numbering: "1.", indent: 1.5em)

    make-title-page()

    set page(margin: (bottom: 3cm, rest: 2cm), footer: {
        set text(size: 10pt, fill: color-brown)

        line(length: 100%, stroke: 0.5pt + color-blue)

        v(-0.75em)
        [KÜK -- Institut für Philosophie -- © 2023-2024
        #h(1fr)
        Seite \
        #h(1fr)
        #set text(size: 1.25em)
        #context counter(page).display()
        ]

    }, header: {
        set text(size: 10pt, fill: color-brown)

        h(1fr)
        strong[Aller Anfang ist... klagerisch]
        v(-0.75em)
        line(length: 100%, stroke: 0.5pt + color-blue)
    })

    include "/src/nutzung.typ"
    pagebreak(weak: true)

    make-outline()

    show heading.where(level: 1): it => pagebreak(weak: true) + it

    // make headings referable
    show ref: it => {
        if it != none and it.element != none and it.element.numbering == none and it.element.supplement == [Abschnitt] {
            link(it.target, strong[#it.element.body])
        } else {
            it
        }
    }

    let abbreviations = ("z. B.", "Z. B.", "D. h.", "d. h.", "d. i.", "o. ä.", "o. J.", "o. A.")
    show regex(abbreviations.join("|")
        .replace(" ", "")
        .replace(".", "\.")): it => {

        let res = abbreviations.filter(e => [#e.replace(" ", "")] == it)

        if res.len() > 0 {
            res.first().split(" ").join(" ")
        }
    }

    body

    state("outline", ()).update(k => {
        k.push("noheads")
        k
    })
    make-part[Anhang]

    make-tasks()

    make-endnotes()

    make-todos()

    bibliography("bibliography.bib", title: [Literaturverzeichnis], style: "kuek-zitierstil.csl")

    heading[Index]
    {
        set par(justify: false)
        // set text(hyphenate: false)
        columns(3, make-index(title: none))
    }

    pagebreak(weak: true)
    include "changelog.typ"
}
/*
Problem: Hin und wieder werden die Labels plötzlich nicht mehr gefunden, sie existieren angeblich nicht. Außerdem konvergiert das Dokument mittlerweile (Typst 0.11.0 (9b001e21)) gar nicht mehr, mit der Fehlermeldung "cannot format citation in isolation". Der KÜK ist absolut kaputt.

Ich weiß absolut nicht, was das Problem mit den links/labels/state-updates ist. Aber es muss gelöst werden. Meine Idee: Es sind zu viele Indizes/Endnote/Aufgaben/..., die verschiedenen Arten haben jeweils einen eigenen State und beeinflussen ihre Positionen gegenseitig, daher kommt es bei jeder Iteration des Compilers zu einem nicht-konvergierenden Layout.
*/

#let color-orange = rgb("#B85A22")
#let color-orange-light = rgb("#DD8047")
#let color-blue = rgb("#94B6D2")
#let color-brown = rgb("#775F55")

#let index(name, content: none) = {
    let s = state("indices", (:))

    if name == none {
        name = repr(lower(content))
    }

    if content == none {
        content = name
    }

    context {
        let num = s.at(here()).keys().len()

        let index_dict = (
            x: here().position().x,
            y: here().position().y,
            page: here().page(),
            number: num
        )

        let lbl = name+"-"+str(index_dict.number)+"-"+repr(index_dict.x)+"-"+repr(index_dict.y)

        [#s.update(k => {
            if name in k {
                k.at(name).content.push(content)
                k.at(name).location.push((num, index_dict))
            } else {
                k.insert(name, ("content": (content,), location: ((num, index_dict),)))
            }

            k
        })#label(lbl)]
    }
}

#let make-index(title: none) = {
    let s = state("indices", (:))

    context {
        let last-first = none

        for item in s.final()
            .keys()
            .map(e => (e, lower(e)))
            .sorted(key: e => e.at(1)) {

            let original = item.at(0)
            let small = item.at(1)

            if last-first != small.first() {
                last-first = small.first()
                heading(level: 2, upper(last-first))
            }

            let i = 1
            let e = s.final().at(original)
            let pages = e.location.map(l => {
                let lbl = original+"-"+str(l.first())+"-"+repr(l.last().x)+"-"+repr(l.last().y)

                (l.last().page, link(label(lbl), str(l.last().page)))
            }).dedup(key: k => k.at(0)).map(m => m.at(0))

            let page_numbers = []

            for p in pages {
                page_numbers += [#p]

                if i < pages.len() {
                    page_numbers += [, ]
                }

                if calc.rem(i, 3) == 0 {
                    page_numbers += [\ ]
                }

                i += 1
            }

            block(stroke: (bottom: 1pt + color-blue),
                inset: (bottom: 0.5em),
                grid(columns: (1fr, auto),
                    column-gutter: 0.5em,
                )[
                    #set text(hyphenate: true)
                    #e.content.dedup().first()
                ][
                    #show: align.with(right)
                    #set text(size: 1em)
                    #page_numbers
                ]
            )
        }
    }
}

// todo: only first reference works
#let ix(b, ..args) = b + if args.pos().len() == 0 {
    if type(b) != "string" {
        panic("expected string, found "+type(b)+".")
    }

    index(b)
} else {
    args.pos().map(e => if type(e) != "string" {
        panic("expected string, found "+type(e)+".")
    } else {
        index(e)
    }).join([])
}

#let add-note(key: none,
    number-format: numbering.with("1"),
    wrap-note: k => super(text(fill: color-brown, k)),
    state-key,
    body) = {

    let s = state(state-key, ())

    context {
        let counter-val = s.at(here()).len() + 1
        let key = key
        let orig-key = state-key + "-ORIGIN-" + str(counter-val)
        let page-num = here().page()

        if key == none {
            key = state-key + "-ALT-" + str(counter-val)
        }

        s.update(k => {
            k.push((
                page: page-num,
                counter: counter-val,
                "key": key,
                origin: orig-key,
                content: body
            ))

            k
        })

        [#link(label(key), wrap-note(number-format(s.at(here()).len() + 1)))#label(orig-key)]
    }
}

#let make-notes(state-key,
    title: [Anmerkungen],
    pretext: none,
    number-format: numbering.with("1"),
    wrap-note: k => super(text(fill: color-brown, k))) = context {

    if title != none {
        heading(title)
    }

    pretext
    // set par(hanging-indent: 1.5em, justify: true)
    set par(justify: true)

    let index = 1
    let current-page = none

    let arr = none
    let table-arr = ()

    for item in state(state-key, ()).final() {
        if current-page != item.page {
            current-page = item.page

            if arr != none {
                table-arr.push(arr)
            }

            arr = ([], [])
            arr.at(0) += [S. #current-page]
        }

        arr.at(1) += block({
            link(label(item.origin), wrap-note(number-format(index)))

            [#item.content#if item.key != none {
                label(item.key)
            }]
        })

        index += 1
    }

    if arr != none {
        table-arr.push(arr)
    }

    table(columns: 2, row-gutter: 1em, stroke: none, ..table-arr.flatten())
}

#let en(key: none, body) = add-note(key: key, "endnotes", body)

#let ens(..args) = args.pos().map(e => en(e)).join(super[,])

#let enref(key) = context {
    let index = 1

    for item in state("endnotes", ()).final() {
        if item.key == key {
            return en(item.content)
            // return [#link(key, super[#key])]
        }

        index += 1
    }

    panic("key '"+key+"' not found!")
}

#let taskref(key) = context {
    let index = 1

    for item in state("tasks", ()).final() {
        if item.key == key {
            return link(label(item.origin), [Aufgabe #numbering("A", item.counter)])
        }

        index += 1
    }
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
    show: block.with(inset: 1em, width: 100%, stroke: color-blue)

    set par(justify: false)
    add-note(
        key: key,
        wrap-note: k => strong[Aufgabe #k -- #title],
        number-format: numbering.with("A"),
        "tasks",
        [: ] + title + par(answer))

    set par(justify: true)
    par(question)
}

#let make-tasks() = {
    make-notes("tasks",
        title: [Lösungsvorschläge],
        wrap-note: k => strong[Lösung für #k],
        number-format: numbering.with("A")
    )
}


#let definition(name, content: none) = {
    let s = state("definitions")
    counter("definitions").step()

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

#let def(key, body, ..ixs) = par(hanging-indent: 1.5em, [
    #place(dx: -1.5em, dy: -0.25em, text(size: 2em, fill: red, strong[!]))

    #if (ixs.pos().len() == 0) {
        definition(key)
        index(key)
    } else {
        definition(key)
        ixs.pos().map(e => index(e)).join([])
    }

    #strong[D#text(size: 0.8em)[EF]. #key]#definition(key) -- #body
])

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

// #let important-index-words = (
//     "Philosophiedidaktik",
//     ("Kontroverse", "Kontroversen"),
//     "Martens", "Rehfus", "Rehfus-Martens-Kontroverse",
//     "Tiedemann", "Gefert", "Tiedemann-Gefert-Konstroverse",
//     "Lassahn", "Deppe", "Lassahn-Deppe-Kontroverse",
//     ("Ziel", "Ziels", "Ziele"),
//     ("Kompetenz", "Kompetenzen"),
//     "Induktion", "Deduktion", "Abduktion"
// ).map(e => {
//     if type(e) == "array" {
//         let p = ()

//         for i in e {
//             let l = (:)
//             l.insert(i, e.at(0))
//             p.push(l)
//         }

//         p

//     } else if type(e) == "string" {
//         let l = (:)
//         l.insert(e, e)

//         l
//     }
// }).flatten()

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
                    .filter(e => e > int(state("no-subs").final().parent.split("-").last()))

                // calculate number of headings without those, who are in the last part (no-subs-part, which is tagged)
                headings.len() - headings-after-nosubs.len()
            }-teilige Grundausrüstung richtet sich an alle Lehramtsstudent*innen der Philosophie und soll den Start in das Studium erleichtern. Der KÜK versteht sich prozessorientiert und erlaubt individuelle Ergänzungen. Die zusammengefassten Hinweise sind jedoch für das Lehramtsstudium der Philosophie als wichtig anzusehen. Diese Sammlung ersetzt nicht das Nachfragen und Nachdenken; wenn Inhalte, Formalia oder Methoden unklar erscheinen, sollten Dozent*innen und Kommiliton*innen um Rat gefragt werden.

            #set text(size: 0.8em)
            Verantwortung und Betreuung: Gruppe "#box(move(dy: 0.25em, circle(stroke: 0.5pt, radius: 0.6em, move(dx: -0.42em, dy: -1.15em, $phi$)))) Philo lernen" © 2023-2024

            Autor: Tristan Pieper, Version: #datetime.today().display("[year]-[month]")
        ])
}

#let add-part(it, s) = context {
    let key = "ref-part-"+str(s.at(here()).len())
    let page-num = here().page()

    [#s.update(k => {
        if k == none {
            k = ()
        }

        k.push((
            page: page-num,
            content: it,
            key: key
        ))

        k
    })#label(key)]
}

#let add-heading(it, s) = context {
    let key = "ref-heading-"+str(s.at(here()).len())
    let page-num = here().page()
    let parent = state("parts").at(here()).last().key

    [#s.update(k => {
        if k == none {
            k = ()
        }

        k.push((
            page: page-num,
            content: it,
            "key": key,
            parent: parent
        ))

        k
    })#label(key)]
}

#let add-subheading(it, s) = context {
    let key = "ref-subheading-"+str(s.at(here()).len())
    let page-num = here().page()
    let parent = state("headings").at(here()).last().key

    if state("no-subs").at(here()) != none {
        return
    }

    [#s.update(k => {
        if k == none {
            k = ()
        }

        k.push((
            page: page-num,
            content: it,
            "key": key,
            parent: parent
        ))

        k
    })#label(key)]
}

#let make-part(p, subtitle: none) = {
    pagebreak(to: "odd")

    align(horizon, {
        show par: set block(below: 0.5em)
        set par(justify: false)
        show: align.with(horizon)

        {
            set text(size: 4.5em, fill: color-brown)
            par(p)
        }

        context {
            set text(size: 2em, fill: color-brown)
            set text(fill: color-orange)
            [Abschnitt #numbering("I", state("parts", ()).at(here()).len()+1)]

            if subtitle != none {
                [ -- ]
                subtitle
            }
        }
    })

    add-part(p, state("parts", ()))
    pagebreak()
}

#let make-outline() = {
    v(1em)
    heading(outlined: false)[Aller Anfang ist... klagerisch]
    v(-1em)
    text(fill: color-orange, tracking: 0.25em, strong(upper[Inhaltsverzeichnis]))

    show: pad.with(x: 1cm, y: 2cm)
    context {
        let arr = ()
        let after-no-subs-arr = ()
        let no-subs = false
        let i = 0
        let pc = 0 // part counter

        for part in state("parts").final() {
            pc += 1
            arr.push(grid.cell(colspan: 2, if pc > 1 { v(1em) }+heading(outlined: false, level: 2)[#numbering("I.", pc) #part.content]))

            for it in state("headings", ()).final() {
                if it.parent != part.key {
                    continue
                }

                i += 1

                // place(move(dy: 0.95em,
                // line(stroke: (dash: "dotted"),
                //     length: 100%)))

                if not no-subs {
                    arr.push([#i.])

                    arr.push(box(inset: (bottom: 2pt), stroke: (bottom: (dash: "dotted")), {
                        link(label(it.key), box(it.content))
                        h(1fr)
                        box[#it.page]
                    }))
                } else {
                    after-no-subs-arr.push(grid.cell(colspan: 2, box(inset: (bottom: 2pt), stroke: (bottom: (dash: "dotted")), {
                        link(label(it.key), box(it.content))
                        h(1fr)
                        box[#it.page]
                    })))
                }

                let sub_i = 0
                let sub_arr = ()

                for sub in state("subheadings", ()).final() {
                    if sub.parent == it.key {
                        sub_i += 1

                        sub_arr.push([#i.#sub_i.])
                        sub_arr.push(box(inset: (bottom: 2pt), stroke: (bottom: (dash: "dotted")), {
                            link(label(sub.key), box(sub.content))
                            h(1fr)
                            box[#sub.page]
                        }))
                    }
                }

                if state("no-subs").final() != none and state("no-subs").final().key == it.key {
                    arr.push([])
                    arr.push(grid(columns: 2,
                        column-gutter: 7pt,
                        row-gutter: 5pt,
                        ..sub_arr))
                    no-subs = true

                } else if sub_arr.len() > 1 {
                    arr.push([])
                    arr.push(grid(columns: 2,
                        column-gutter: 7pt,
                        row-gutter: 5pt,
                        ..sub_arr))
                }
            }

        }


        grid(columns: 2,
            column-gutter: 5pt,
            row-gutter: 5pt,
            ..arr,
            ..after-no-subs-arr)

        // if after-no-subs-arr.len() > 0 {
        //     v(0.5em)
        //     grid(columns: 1,
        //         column-gutter: 5pt,
        //         row-gutter: 5pt,
        //         ..after-no-subs-arr)
        // }
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

#let orange-list(..items) = {
    set text(fill: color-orange)
    list(tight: false, indent: 1.5em, marker: [■], ..items)
}

#let project(body) = {
    let heads = state("headings", ())
    let subheads = state("subheadings", ())

    set page(margin: 2cm)

    set text(font: "Tw Cen MT", size: 12pt, lang: "de")
    set par(justify: true, linebreaks: "optimized", leading: 0.5em)

    show heading.where(level: 1, outlined: true): it => it + add-heading(it, heads)
    show heading.where(level: 1): set text(size: 1.75em)
    // show heading.where(level: 2): set block(above: 1.5em)
    show heading.where(outlined: true, level: 2): it => it + add-subheading(it, subheads) + counter("subheadings").step()
    show heading.where(level: 2): upper

    show heading: set par(justify: false)
    show heading: set text(fill: color-brown, size: 1.25em, weight: "regular")

    set enum(numbering: "1.", indent: 1.5em)

    make-title-page()

    // counter(page).update(0)
    set page(margin: (bottom: 3cm, rest: 2cm), footer: {
        set text(size: 10pt, fill: color-brown)

        line(length: 100%, stroke: 0.5pt + color-blue)

        v(-0.75em)
        [KÜK -- Institut für Philosophie -- © 2023-2024
        #h(1fr)
        Seite \
        #h(1fr)
        #set text(size: 1.25em)
        #context counter(page).display()]

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

    show heading.where(level: 1): it => pagebreak(weak: true) + it + counter("subheadings").update(0)

    // make headings referable
    show ref: it => {
        if it != none and it.element != none and it.element.numbering == none and it.element.supplement == [Abschnitt] {
            link(it.target, strong[#it.element.body])
        } else {
            it
        }
    }

    body

    locate(loc => {
        let e = state("headings", ()).at(loc)

        if e.len() > 0 {
            state("no-subs").update(k => e.last())
        }
    })
    make-part[Anhang]

    make-tasks()

    make-todos()

    set par(justify: false)

    make-endnotes()

    bibliography("bibliography.bib", title: [Literaturverzeichnis], style: "kuek-zitierstil.csl")

    heading[Index]
    columns(3, make-index(title: none))

    pagebreak(weak: true)
    include "changelog.typ"
}
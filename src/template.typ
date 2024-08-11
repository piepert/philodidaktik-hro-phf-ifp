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
        let num = s.at(here()).at(name, default: (
            origins: (),
            content: none)).origins.len()
        let origin = label("index-"+name+"-" + str(num))

        [#box[]#origin]
    }

    s.update(k => {
        let num = k.at(name, default: (
            origins: (), content: none)).origins.len()
        let origin = label("index-" +
            name + "-" +
            str(num))

        if name in k {
            k.at(name).content.push(content)
            k.at(name).origins.push(origin)

        } else {
            k.insert(name, (
                content: (content,),
                origins: (origin,)
            ))
        }

        k
    })
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
            let label-page-list = e.origins.map(e => (e, query(e).first().location().page()))
            let pages = label-page-list.map(o => {
                o.last()
            }).dedup().map(p => {
                label-page-list.filter(i => i.last() == p).first()
            })

            let page_numbers = []

            for p in pages {
                page_numbers += [#link(p.first(), str(p.last()))]

                if i < e.origins.len() {
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

#let note-note(state-key,
    key,
    number-format: numbering.with("1"),
    wrap-note: k => super(text(fill: color-brown, k))) = context {

    let counter-val = state(state-key, ()).at(here()).len() + 1

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

    [#link(target, wrap-note(number-format(counter(state-key).at(here()).first() + 1)))#origin]
}

#let note-content(state-key, body, key: none) = {
    state(state-key, ()).update(k => {
        let counter-val = k.len() + 1

        k.push((
            content: body,

            target: if key != none {
                label(key+"-TARGET")
            } else {
                label(state-key + "-TARGET-" + str(counter-val))
            },

            origin: if key != none {
                label(key+"-ORIGIN")
            } else {
                label(state-key + "-ORIGIN-" + str(counter-val))
            },
        ))

        k
    })
}

#let add-note(key: none,
    number-format: numbering.with("1"),
    wrap-note: k => super(text(fill: color-brown, k)),
    state-key,
    body) = {

    note-note(state-key, key, wrap-note: wrap-note, number-format: number-format)
    note-content(state-key, body, key: key)
    counter(state-key).step()
}

#let make-notes(state-key,
    title: [Anmerkungen],
    pretext: none,
    number-format: numbering.with("1"),
    wrap-all: k => k,
    wrap-note: k => super(text(fill: color-brown, k)),
    wrap-content: k => k) = context {

    // generierung in zwei schritten:
    // 1. alle mit origin, dadurch werden die neuen origins der endnoten in endnoten generiert
    // 2. danach alle ohne origin

    if title != none {
        heading(title)
    }


    pretext
    set par(justify: true)

    let i = 1
    for item in state(state-key, ()).final() {
        counter(state-key).update(i)
        wrap-all(block({
            link(item.origin, wrap-note(number-format(i)))
            wrap-content[#item.content#item.target]
        }))

        i += 1
    }
}

#let en-note(key) = note-note("endnotes", key) + counter("endnotes").step()

#let en-content(key, body) = note-content("endnotes", body, key: key) + counter("endnotes").step()

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
        [: ] + title + pad(left: 1.5em, answer))

    set par(justify: true)
    par(question)
}

#let taskref(key) = context {
    let index = 1

    for item in state("tasks", ()).final() {
        if item.target == label(key+"-TARGET") {
            return link(item.origin, [Aufgabe #numbering("A", item.counter)])
        }

        index += 1
    }

    panic("key '"+key+"' not found!")
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

    return none

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
                    .filter(e => e > int(state("no-subs", (parent: "0-0")).final().parent.split("-").last()))

                // calculate number of headings without those, who are in the last part (no-subs-part, which is tagged)
                headings.len() - headings-after-nosubs.len()
            }-teilige Grundausrüstung richtet sich an alle Lehramtsstudent*innen der Philosophie und soll den Start in das Studium erleichtern. Der KÜK versteht sich prozessorientiert und erlaubt individuelle Ergänzungen. Die zusammengefassten Hinweise sind jedoch für das Lehramtsstudium der Philosophie als wichtig anzusehen. Diese Sammlung ersetzt nicht das Nachfragen und Nachdenken; wenn Inhalte, Formalia oder Methoden unklar erscheinen, sollten Dozent*innen und Kommiliton*innen um Rat gefragt werden.

            #set text(size: 0.8em)
            Verantwortung und Betreuung: Gruppe "#box(move(dy: 0.25em, circle(stroke: 0.5pt, radius: 0.6em, move(dx: -0.42em, dy: -1.15em, $phi$)))) Philo lernen" © 2023-2024

            Autor: Tristan Pieper, Version: #datetime.today().display("[year]-[month]")
        ])
}

#let add-part(it, s) = context {
    return none

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
    return none

    let key = "ref-heading-"+str(s.at(here()).len())
    let page-num = here().page()
    let parent = state("parts", ((key: "0-0"),)).at(here()).last().key

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
    return none

    let key = "ref-subheading-"+str(s.at(here()).len())
    let page-num = here().page()
    let parent = state("headings", ((key: "0-0"),)).at(here()).last().key

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
            "key": "ref-subheading-"+str(k.len()),
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

        for part in state("parts", ()).final() {
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

    context {
        let e = state("headings", ()).at(here())

        if e.len() > 0 {
            state("no-subs").update(k => e.last())
        }
    }
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
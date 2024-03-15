#let the-date = datetime(
    year: datetime.today().year(),
    month: datetime.today().month(),
    day: datetime.today().day()
).display("[day].[month].[year]")

#let cheat-sheet = [

]

#let schedule(class: 9,
  title-lesson: none,
  title-series: none,
  justification: none,
  time: none,
  date: datetime.today(),
  schedule-context: none,
  main-objective: none,
  fine-objectives: (),
  ..args) = {
    set page(flipped: true, margin: (bottom: 2cm, rest: 1.5cm))

    grid(columns: (0.5fr, auto, 0.5fr))[
        Universität Rostock \
        Institut für Philosophie \
        Einführung in die Philosophiedidaktik \
        Dr. phil. Christian Klager \
    ][
        *Plan für eine Unterrichtsstunde*
    ][
        #align(right)[
            [Name der Lehrperson] \
            #the-date
        ]
    ]

    line(length: 100%)
    par[
        *Klasse:* #class,
        *Zeit:* #time,
        *Datum:* #the-date
    ]

    par[
        *Thema der Unterrichtsreihe:* #title-series \
        *Thema der Unterrichtsstunde:* #title-lesson

        *Begründung der Themenwahl:* #justification
    ]

    par[
        *Grobziel:* #main-objective \
        *Feinziele:* #list(..fine-objectives)
    ]

    par(schedule-context)

    line(length: 100%)

    // let definitions = (
    //     "Motivationsphase": [Die SuS werden intrinsisch motiviert, sich mit einem philosophischen Phänomen auseinanderzusetzen.],
    //     "Problematisierungsphase": [Die SuS erarbeiten ein Problem, das in der Erarbeitungsphase gelöst werden soll.],
    //     "Erarbeitungsphase": [Die SuS generieren eine Kompetenz und erarbeiten eine Lösung für das Problem der Stunde.],
    //     "Sicherungsphase": [Die erarbeiteten Lösungen werden verglichen, reflektiert und kritisiert.],
    //     "Transferphase": [Die generierte Kompetenz der SuS wird auf einen anderen Sachverhalt angewandt.],
    //     "Reservephase": [Die generierte Kompetenz der SuS wird auf einen anderen Sachverhalt angewandt.],
    // )

    // let phases = state("phases_shown", ())

    // show regex("("+definitions.keys().join("|")+")"): it =>  {
    //     let name = repr(it).replace("[", "").replace("]", "")

    //     locate(loc => {
    //         if name in phases.at(loc) {
    //             it + footnote(label("f"+name))

    //         } else {
    //             it
    //             [#footnote(strong(it+[: ]) + definitions.at(name)) #label("f"+name)]
    //         }
    //     })

    //     phases.update(k => {
    //         k.push(name)
    //         k
    //     })
    // }

    table(columns: (auto, auto, auto, 6cm, auto, auto),
        stroke: none,
        row-gutter: 0.5cm,
        strong[Zeit/Phase],
        strong[Inhalt],
        strong[Lehrerverhalten\ (geplant)],
        strong[Schülerverhalten\ (erwartet)],
        strong[Methoden\ /Sozialform],
        strong[Medien],
        ..args)

    // line(length: 100%)
}

#let task(body) = strong[Aufgabe: ] + body

#let todo(body) = text(fill: red, body)
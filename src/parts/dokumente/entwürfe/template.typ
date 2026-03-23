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
    [
        *Klasse:* #class,
        *Zeit:* #time,
        *Datum:* #the-date

        *Thema der Unterrichtsreihe:* #title-series \
        *Thema der Unterrichtsstunde:* #title-lesson

        *Begründung der Themenwahl:* #justification

        *Grobziel:* #main-objective \
        *Feinziele:* #list(..fine-objectives)

        #schedule-context
    ]

    line(length: 100%)

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
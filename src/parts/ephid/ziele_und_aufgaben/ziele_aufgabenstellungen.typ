#import "@preview/cetz:0.2.2"
#import "/src/template.typ": *

== #ix("Zielformulierung", "Ziel", "Zielformulierung") und #ix("Aufgabenstellungen", "Aufgabenstellung")

Jeder #ix("Unterrichtsplanung") geht eine #ix("Zielformulierung") voraus. Erst Ziele ermöglichen es nach der Unterrichtsstunde zu beurteilen, ob der Unterricht erfolgreich war, und machen es möglich, den Unterricht #ix("auszuwerten", "Unterrichtsauswertung"). Bei der #ix("Zielsetzung") für den Unterricht wird zwischen *#ix("Grob-", "Grobziel")* und *#ix("Feinzielen", "Feinziel")* unterschieden. In der #ix("Unterrichtsplanung") beschreiben *#ix("Grobziele", "Grobziel")* das Ziel einer gesamten Unterrichtsstunde und *#ix("Feinziele", "Feinziel")* die einzelnen Absichten, die mit den Aufgabenstellungen im Unterricht erreicht werden sollen.

Feinziele werden formuliert mit der folgenden Formel:

#align(center)[
    "SuS" + *Ausbildung einer Kompetenz* + "durch"/"indem" + *#ix("EPA-Operator", "Operator")*
]

Zur Planung einer #ix("zielorientierten", "Zielorientierung") Stunde wird das folgende Muster durchlaufen:

#align(center, cetz.canvas({
    import cetz.draw: *

    content((0, 0))[
        + Erfassung des *Ist-Standes*
        + Festlegung eines *Soll-Standes*, durch eine *Zielsetzung*
        + *Maßnahmenplanung* zur Erreichung des Soll-Standes
        + *Durchführung* der Maßnahmen
        + *Kontrolle* der Zielerrichung
    ]

    let x1 = 1
    let x2 = 6
    let y1 = -1.05
    let y2 = 1

    let p = (x1, y1)
    let q = (x2, y1)
    let r = (x2, y2)
    let s = (x1, y2)

    line(p, q)
    line(q, r)
    line(r, s, mark: (end: ">"))
}))

Es gibt einen Zusammenhang zwischen #ix("Feinzielen", "Feinziel") und Aufgabenstellungen: Zu jeder Aufgabenstellung muss es im Unterichtsentwurf auch ein #ix("Feinziel", "Feinziel") geben. Die dazugehörige Aufgabenstellung muss den #ix("EPA-Operator", "Operator") des #ix("Feinziels", "Feinziel") übernehmen, wie etwa hier für den Philosophieunterricht einer 10. Klasse:

#table(columns: 2, stroke: none)[
    #show: align.with(right)
    #show: strong
    Feinziel:
][
    Die SuS erwerben Methodenkompetenz, indem sie Descartes' erste Meditation in Form eines Abstracts #underline[zusammenfassen].
][
    #show: align.with(right)
    #show: strong
    Aufgabenstellung:
][
    #underline[Fassen] Sie Descartes' erste Meditation in Form eines Abstracts #underline[zusammen]!
]


#task[Feinziele][
    Entwerfen Sie drei Feinziele für eine Unterrichtsstunde zum Thema "Das Wachsbeispiel in Descartes' _Meditationes de prima philosophia_." in der Sekundarstufe II.
][
    + Die SuS erwerben Wahrnehmungs- und Deutungskompetenz, indem sie das Wachsbeispiel von Descartes in eigenen Worten wiedergeben.

    + Die SuS erwerben Darstellungskompetenz, indem Sie einen philosophischen Dialog zu Descartes' Wachsbeispiel gestalten.

    + Die SuS erwerben Argumentations- und Urteilskompetenz, indem Sie eine philosophische Problemreflexion zu Descartes' Wachsbeispiel durchführen.
]

#task(key: "drei-aufgabenstellungen")[Aufgabenstellung][
    Entwerfen Sie für jeden EPA-Anforderungsbereich je eine Aufgabenstellungen für eine Unterrichtsstunde zum Thema "Das Fremdpsychische in Descartes' _Meditationes de prima philosophia_." für die Sekundarstufe I.
][
    #grid(columns: 2,
        column-gutter: 0.5em,
        row-gutter: 1em,

        [AB I:], [
            Geben Sie die drei Stufen von Descartes' methodischem Zweifel in eigenen Worten wieder!
        ],

        [AB II:], [
            Erörtern Sie ein Problem der Erkenntnis aus der Wahrnehmung, das Descartes aufwirft!
        ],

        [AB III:], [
            Diskutieren Sie Descartes' Position zum Problem des Fremdpsychischen!
        ])
]
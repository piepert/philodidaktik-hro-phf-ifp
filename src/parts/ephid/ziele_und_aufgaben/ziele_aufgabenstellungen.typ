#import "@preview/cetz:0.2.2"
#import "/src/template.typ": *

== #ix("Zielformulierung", "Ziel", "Zielformulierung") und #ix("Aufgabenstellungen", "Aufgabenstellung") <ephid-ziele-aufgabenstellungen>

Jeder #ix("Unterrichtsplanung") geht eine #ix("Zielformulierung") voraus, denn "Lernziele [bezeichnen] die gewünschte inhaltlich-unterrichtliche Ausrichtung"#en[@Lehner2019_Didaktik[S. 104]]. Erst Ziele ermöglichen es nach der Unterrichtsstunde zu beurteilen, ob der Unterricht erfolgreich war, und machen es möglich, den Unterricht #ix("", "Unterrichtsauswertung")auszuwerten. Bei der #ix("Zielsetzung") für den Unterricht wird zwischen *#ix("Richt-", "Richtziel")*, *#ix("Grob-", "Grobziel")* und *#ix("Feinzielen", "Feinziel")* unterschieden. In der #ix("Unterrichtsplanung") beschreiben *#ix("Richtziele", "Richtziel")* das allgemeine Ziel einer gesamten Unterrichtseinheit, *#ix("Grobziele", "Grobziel")* das Ziel einer gesamten Unterrichtsstunde und *#ix("Feinziele", "Feinziel")* die einzelnen Absichten, die mit den Aufgabenstellungen im Unterricht erreicht werden sollen.#en[Vgl. @Lehner2019_Didaktik[S. 105 f]]

#orange-list-with-body[Richtziele][
    Richtziele müssen nicht operationalisiert sein, d.h. sie müsse nicht mit Hilfe von #ix("", "Operator")EPA-Operatoren formuliert werden. Sie stützen sich direkt auf den Rahmenplan#en[Vgl. @Lehner2019_Didaktik[S. 105]] und beschreiben allgemeine Fähigkeiten und Fertigkeiten, die erreicht werden sollen. Richtziele beziehen sich auf eine gesamte Unterrichtseinheit bzw. Sequenz. Beispiele können sein:
    - Die SuS sind in der Lage, eine philosophische Geisteshaltung in verschiedenen philosophischen Formen einzunehmen, die Philosophie zu charakterisieren und ihre Verknüpftheit aufzuzeigen.#en[Vgl. @MBWKMV2019_RP1112[S. 10 f]]
    - Die SuS setzen sich kritisch mit der Frage nach Gott und verschiedenen Gottesbegriffen auseinander.#en[Vgl. @MBWKMV2002_RP710[S. 31 f]]
    - Die SuS sind in der Lage, verschiedene Begriffe von Wissen und Verfahren der Wissensaneignung zu beschreiben und setzen sich dialektisch mit den Thesen des Rationalismus, Empirismus und Kritizismus des zur menschichen Erkenntnis auseinander.#en[Vgl. @MBWKMV2019_RP1112[S. 12]]

][Grobziele][
    Grobziele können *operationalisiert* sein, sie sind jedoch nicht kompetenzorientiert. Die Ausbildung einzelner Kompetenzen wird erst in den Feinzielen beschrieben. Grobziele beschreiben das Ziel einer gesamten Unterrichtsstunde. Z.B.:
    - Die SuS setzen sich kritisch mit den drei Stufen Descartes' methodischen Zweifels auseinander.
    - Die SuS lernen Gottesbeweise als Möglichkeit zu empirischen Beweisformen kennen, besonders anhand des Inhaltes des kosmologischen Gottesbeweises.

][Feinziele][
    Feinziele sind *operationalisiert* und *kompetenzorientiert*. Sie geben konkrete und nachprüfbare Ergebnissetzungen für den Unterricht an. Daher werden Feinziele mit der folgenden Formel formuliert:

    #align(center)[
        "SuS" + *Ausbildung einer Kompetenz* + "durch"/"indem" + *#ix("EPA-Operator", "Operator")*
    ]

    Beispiele könnten sein:
    - Die SuS verbessern ihre Methodenkompetenz, indem Sie zu Descartes' erster Meditation ein Exzerpt mit einer geeigneten Leitfrage gestalten.
    - Die SuS verbessern ihre Sachkompetenz, indem Sie Descartes' drei Stufen des methodischen Zweifels in eigenen Worten wiedergeben.

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

Einige Didaktiker kritisieren die "#emph[Indem]isierung" der Unterrichtsziele, doch sie bietet einen Vorteil für zwei verschiedene Phasen der Unterrichtsdurchführung: bei der Planung und bei der Auswertung. In der Planungsphase ist nach der Festlegung der auszubildenden Kompetenz durch die Verbindung mit dem Weg, der nach dem "indem" beschrieben wird, klar, wie dieses Ziel erreicht werden soll. Andersherum gilt für die Auswertungsphase nach der Unterrichtsstunde ein Kriterium, anhand dessen man zeigen kann, dass das Ziel adressiert und die Kompetenz entwickelt wurde, sollte man die zugehörige Aufgabe ausgeführt haben.

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
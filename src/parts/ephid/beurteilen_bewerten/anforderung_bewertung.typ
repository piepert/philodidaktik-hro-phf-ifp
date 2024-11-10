#import "/src/template.typ": *

== Anforderung an Leistungsbewertung

In der Didaktik des Philosophieunterrichts werden drei Anforderungen an Leistungsauswertungen herausgestellt: Leistungsbewertungen müssen #ix("valide", "Validität"), #ix("reliabel", "Reliabilität") und #ix("intersubjektiv", "Intersubjektivität") sein.#en[Vgl. @Klager2021_Bewertung[S. 5]]

#let colg = 1em
#grid(columns: (33.33%-(colg/2),)*3,
    column-gutter: colg,
    row-gutter: 1em,

    strong[#ix("Validität")],
    strong[#ix("Reliabilität")],
    strong[#ix("Intersubjektivität")],

    [
        Geprüft werden sollen hauptsächlich #ix("Kompetenzen", "Kompetenz"), die an bestimmten Kriterien festgemacht werden. Dinge, die nicht zum Fachunterricht gehören, sollen nicht Teil von Prüfungen des Faches sein.#en[Die #ix("Validität") ist ebenfalls unter dem Begriff der #ix("Gültigkeit bekannt"). Siehe dazu @SchmidtRuthendorf2017_PhilosophierenMessen]
    ], [
        Die Situation, in der die Leistung erfasst wird, soll angemessen sein.

        - situative Rahmenbedingungen
        - soziale Rahmenbedingungen
        - klare Aufgabenstellungen
        - Vermeiden von "Messfehlern"
    ], [
        Das Ergebnis sollte unabhängig der Prüfenden sein. Mögliche Fehlerquellen sind:

        - Halo-Effekt, Sympathie, Geschlecht, soziale Erwünschtheit
        - Vorurteile und subjektive Theorien
        - Projektion
        - Vor- und Zusatzinformationen, Pygmalioneffekt
        - Reihungs- und Kontrasteffekte
        - Tendenzfehler und Extremwertvermeidung
        - Rechenfehler
    ])

#task(key: "intersubjektivität")[Intersubjektivität][
    Wählen und erläutern Sie eine Fehlerquelle der Intersubjektivität in Leistungsbewertungen an einem Beispiel!
][
    Intersubjektivität in der Leistungsbewertung beschreibt das Kriterium, dass die Bewertung unabhängig der Prüfenden sein sollte. Rechenfehler beim Summieren nach der Punktevergabe sind Fehler, die bei unterschiedlichen Lehrkräften unterschiedlich auftreten können. Werden dieselben Tests von SuS von unterschiedlichen Prüfenden bewertet, so kann, selbst wenn sie komplett gleich bewerten würden, beim Aufsummieren der Punkte unterschiedliche Noten entstehen. Dies macht das Ergebnis der Prüfung abhängig von den Prüfenden. Damit sind sie eine mögliche Fehlerquelle für fehlende Intersubjektivität.
]

#task[Leistungsbewertung von #ix("Gruppenarbeit")][
    Erklären Sie an einem Beispiel, warum die Gruppenarbeit keine geeignete Sozialform für eine Leistungsbewertung ist!
][
    An die Leistungsbewertung werden drei Anforderungen gestellt: sie muss valide, reliabel und intersubjektiv sein. Die Validität und Reliabilität sind in der Gruppenarbeit bemängelbar. Besonders bei Gruppenarbeiten sind soziale Faktoren, wie das Umfeld oder die Situation, in der die Schüler leben, das Ergebnis stark beeinflussen. Beurteilt werden soll jedoch die Kompetenz, nicht die Umstände.

    Ein weiterer Punkt ist, dass die bewertete Leistung (im besten Fall) eine Aggregation der Einzelleistungen der SuS ist. Das Aufteilen in Einzelleistungen ist nicht möglich, da jedoch die SuS nur einzeln bewertet werden können (da sie jeder nur einzeln ein Zeugnis besitzen), ist auch aus dieser Perspektive die Gruppenarbeit keine geeignete Sozialform für eine Leistungsbewertung.
]

#task[Reliabilität von Bewertung][
    Erläutern Sie die #ix("Reliabilität") von Bewertungen an zwei Beispielen des Philosophieunterrichts.
][
    Angenommen eine mündliche Prüfung wird abgehalten und direkt außerhalb des Raumes ist durch Bauarbeiten eine starke Lärmbelästigung vorhanden. Die Geprüften wie auch die Prüfenden haben mit großen Konzentrationsproblemen kämpfen, was die Aufnahme- und Verarbeitungsfähigkeit und damit die erbrachte Leistung -- wahrscheinlich negativ -- beeinflusst.

    Etwas anderes wäre ein schriftlicher Test, jedoch werden die Aufgabenstellungen vor dem Test mündlich angesagt. Durch Unaufmerksamkeit der SuS kommt es in einigen Fällen zur Übernahme falscher Aufgabenstellungen und damit Punktverlusten.

    Diese Beispiele beziehen sich auf Situationen, in der eine Leistung erfasst wird. Diese muss der Leistung entsprechend angemessen sein und die Grundlagen bieten, sodass die Geprüften nicht in der Erbringung ihrer Leistung behindert werden.
]
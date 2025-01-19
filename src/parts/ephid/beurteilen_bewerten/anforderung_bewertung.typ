#import "/src/template.typ": *

== Anforderung an Leistungsbewertung

In der Didaktik des Philosophieunterrichts werden drei Anforderungen an Leistungsauswertungen herausgestellt: Leistungsbewertungen müssen #ix("valide", "Validität"), #ix("reliabel", "Reliabilität") und #ix("intersubjektiv", "Intersubjektivität") sein.#ens[Vgl. @Klager2021_Bewertung[S. 5]][Vgl. @Sacher2009_Lernstandsbeurteilung[S. 487]]

#let colg = 1em
#grid(columns: (33.33%-(colg/2),)*3,
    column-gutter: colg,
    row-gutter: 1em,

    strong[#ix("Validität")#en[Die #ix("Validität") ist ebenfalls als "#ix("Gültigkeit")" bekannt. Siehe dazu @SchmidtRuthendorf2017_PhilosophierenMessen[S. 10]]],
    strong[#ix("Reliabilität")#en[Die #ix("Reliabilität") ist ebenfalls als "#ix("Zuverlässigkeit")" bekannt. Siehe dazu @SchmidtRuthendorf2017_PhilosophierenMessen[S. 11]]],
    strong[#ix("Intersubjektivität")#en[Die #ix("Intersubjektivität") ist ebenfalls als "#ix("Nachvollziehbarkeit")" oder auch "#ix("Objektivität")" bekannt. Siehe dazu @SchmidtRuthendorf2017_PhilosophierenMessen[S. 11] Siehe auch @Sacher2009_Lernstandsbeurteilung[S. 487]]],

    [
        Ein valider Test erfasst tatsächlich das, was auch geprüft werden soll.

        Fachdidaktisch gilt der Vorsatz, dass nur #ix("Kompetenzen", "Kompetenz") geprüft werden sollen, deren Ausbildung vorher Teil des Unterrichtsprozesses war. Dinge, die nicht zum Fachunterricht gehören, sollen nicht Teil von Prüfungen des Faches sein.
    ], [
        Die Reliabilität bezeichnet, wie sicher und frei von Messfehlern ein Ergebnis ist. Reliabilität kann etwa auf Folgendes Bezug nehmen:

        - situative Rahmenbedingungen
        - soziale Rahmenbedingungen
        - klare Aufgabenstellungen
        - Vermeiden von "Messfehlern"

        Eine wiederholte Leistungsmessung führt bei hoher Reliabilität zum gleichen Ergebnis.
    ], [
        Die Intersubjektivität bezeichnet die Unabhängigkeit des Ergebnisses von den Prüfenden.

        Der Weg der Bewertung sollte anhand für andere Personen nachvollziehbaren Kriterien erfolgen.

        Eine Verletzung geschieht z.B. bei uneinheitlicher Bewertung durch den Halo-Effekt, Sympathie, Geschlecht, soziale Erwünschtheit, Projektion, Vorurteile und subjektive Theorien, Pygmalioneffekt, Rechenfehler, uvm.
    ])

#task(key: "intersubjektivität")[Intersubjektivität][
    Wählen und erläutern Sie eine Fehlerquelle der Intersubjektivität in Leistungsbewertungen an einem Beispiel!
][
    Intersubjektivität in der Leistungsbewertung beschreibt das Kriterium, dass die Bewertung unabhängig der Prüfenden sein sollte. Als Lehrperson ist die "Tendenz zur Mitte" etwa ein Phänomen, dass die Intersubjektivität beeinflusst. Eine Tendenz zur Mitte liegt vor, wenn die Extreme (volle Punktzahl, keine Punktzahl) vermieden und stattdessen mittlere Noten bevorzugt werden. Das macht das Ergebnis der Prüfung abhängig von den Prüfenden, die dem Effekt unterliegen, und bildet damit eine Fehlerquelle für fehlende Intersubjektivität. // Rechenfehler beim Summieren nach der Punktevergabe sind Fehler, die bei unterschiedlichen Lehrkräften unterschiedlich auftreten können. Werden dieselben Tests von SuS von unterschiedlichen Prüfenden bewertet, so kann, selbst wenn sie komplett gleich bewerten würden, beim Aufsummieren der Punkte unterschiedliche Noten entstehen. Dies macht das Ergebnis der Prüfung abhängig von den Prüfenden. Damit sind sie eine mögliche Fehlerquelle für fehlende Intersubjektivität.
]

#task[Leistungsbewertung von #ix("Gruppenarbeit")][
    Erklären Sie an einem Beispiel, warum die Gruppenarbeit keine geeignete Sozialform für eine Leistungsbewertung ist!
][
    An die Leistungsbewertung werden drei Anforderungen gestellt: sie muss valide, reliabel und intersubjektiv sein. Die Validität und Reliabilität sind in der Gruppenarbeit bemängelbar. Besonders bei Gruppenarbeiten sind soziale Faktoren gravierend -- wie das Umfeld oder die Situation, in der die Schüler leben --, die das Ergebnis stark beeinflussen. Beurteilt werden soll jedoch die Kompetenz, nicht die Umstände.

    Ein weiterer Punkt ist, dass die bewertete Leistung (im besten Fall) eine Aggregation der Einzelleistungen der SuS ist. Das Aufteilen in Einzelleistungen ist nicht möglich. Da jedoch die SuS nur einzeln bewertet werden können (da sie jeder nur einzeln ein Zeugnis besitzen), ist auch aus dieser Perspektive die Gruppenarbeit keine geeignete Sozialform für eine Leistungsbewertung.
]

#task[Reliabilität von Bewertung][
    Erläutern Sie die #ix("Reliabilität") von Bewertungen an zwei Beispielen des Philosophieunterrichts.
][
    Angenommen eine mündliche Prüfung wird abgehalten und direkt außerhalb des Raumes ist durch Bauarbeiten eine starke Lärmbelästigung vorhanden. Die Geprüften wie auch die Prüfenden haben mit großen Konzentrationsproblemen kämpfen, was die Aufnahme- und Verarbeitungsfähigkeit und damit die erbrachte Leistung -- wahrscheinlich negativ -- beeinflusst.

    Etwas anderes wäre ein schriftlicher Test, jedoch werden die Aufgabenstellungen vor dem Test mündlich angesagt. Durch Unaufmerksamkeit der SuS kommt es in einigen Fällen zur Übernahme falscher Aufgabenstellungen und damit Punktverlusten.

    Diese Beispiele beziehen sich auf Situationen, in der eine Leistung erfasst wird. Diese muss der Leistung entsprechend angemessen sein und die Grundlagen bieten, sodass die Geprüften nicht in der Erbringung ihrer Leistung behindert werden.
]
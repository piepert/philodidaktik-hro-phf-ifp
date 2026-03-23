#import "/src/template.typ": *

== Inquiry <u-inquiry>

*Klasse:* 10, *Zeit:* 90 min., *Datum:* #datetime.today().display("[day].[month].[year]")

*Thema der Unterrichtsreihe:* Recht und Staatsgewalt \
*Thema der Stunde:* Die Inquiry als Methode des Philosophierens

*Begründung:* Das Grundziel des Philosophieunterrichts ist das _Philosophieren mit Kindern_ und damit das Schulen spezifischer Kompetenzen. Die Inquiry bildet durch die analytische, dialektische und je nach aktuellem Problemstand weiteren Ansätzen wie Spekulation und Hermeneutik eine genuin philosophische Untersuchungsgemeinschaft und bietet niedrigschwelligen Zugang zum Philosophieren und der Philosophie spezifischer Sach- und Methodenkompetenz.#footnote[Vgl. Ministerium für Bildung, Wissenschaft und Kultur des Landes Mecklenbug-Vorpommern (Hrsg.): Rahmenplan Jahrgangsstufen 7-10. Philosophieren mit Kindern. Erprobungsfassung. Schwerin 2002. S. 13.] Daneben bietet die Inquiry eine Konfrontation heterogener Voraussetzungen und Weltansschauungen, was eine durch den Rahmenplan gewollte Förderung der Selbst- und Sozialkompetenz zur Folge hat.#footnote[Vgl. Ministerium für Bildung, Wissenschaft und Kultur des Landes Mecklenbug-Vorpommern (Hrsg.): Rahmenplan Jahrgangsstufen 7-10. Philosophieren mit Kindern. Erprobungsfassung. Schwerin 2002. S. 8, S. 11.] Inhaltlich wird ein Fokus auf "Recht und Staatsgewalt" erwartet, kann jedoch aufgrund der Natur der Methode nicht sichergestellt werden.#footnote[Vgl. Ministerium für Bildung, Wissenschaft und Kultur des Landes Mecklenbug-Vorpommern (Hrsg.): Rahmenplan Jahrgangsstufen 7-10. Philosophieren mit Kindern. Erprobungsfassung. Schwerin 2002. S. 35.] Eine Abweichung von diesem Thema widerspricht jedoch nicht den grundlegenden Zielen und der Intention des Rahmenplans und dem Sinn des Philosophieunterrichts an sich.

*Grobziel:* Die SuS sind in der Lage, eine philosophische Problemreflexion in Form einer Inquiry durchzuführen.#footnote[Man beachte die Strukturierung der Unterrichtsstunde, die mit dem Rahmen der Inquiry als Methode eine vollständige philosophische Problemreflexion ergeben, indem die philosophischen Implikationen eines vorliegenden Materials in Form einer philosophischen Problemfrage beschrieben werden, folgend das Problem erörtert und integrativ in diesem Schritt auch die vorgeschlagenen Lösungen beurteilt werden und im letzten Schritt erneut eine Beurteilung am Ende der Inquiry entsteht.] // #todo[Feinziele? Kann ich alle Kompetenzen unterbringen?]

*Feinziele:* Die SuS generieren ...
- Methodenkompetenz, indem sie in Form einer Frage zusammenfassen, welches philosophische Problem sie in einem vorliegenden Bild erkennen.
- Methodenkompetenz, indem sie ein philosophisches Problem erörtern.
- Sozial- und Selbstkompetenz, indem sie eigene und fremde Argumente reflektierend beurteilen.

#let task(body) = pad(left: 1.5em, h(-1.5em) + strong[Aufgabe:] + body)

#[
// #set page(flipped: true, margin: (top: 2.25cm, bottom: 2.5cm, x: 1.5cm))
#set par(justify: false)
#set text(hyphenate: true)

=== Verlaufsplan

#set enum(indent: 0em)
#set text(size: 0.75em)
#set list(indent: 0em)
#set rotate(reflow: true)
#set table.hline(stroke: (thickness: 1pt, dash: "dashed"))
#table(
    columns: (auto, 10%, auto, auto, auto, 10%, 10%),
    stroke: none,

    table.header(
        strong[], table.vline(),
        strong[Zeit /\ Phase], table.vline(),
        strong[Inhalt], table.vline(),
        strong[Lehrerverhalten\ (geplant)], table.vline(),
        strong[Schülerverhalten\ (erwartet)], table.vline(),
        strong[Methoden /\ Sozialformen], table.vline(),
        strong[Medien]),

    table.hline(stroke: (dash: "solid")),
    table.cell(rowspan: 5, rotate(90deg, strong[Motivation])), [
        *Stimulus* \
        (10 min.)
    ], [
        - kurzes Aufwärmen per Kommunikationsspiel: Zip-Zap-Boing
        - Geben des Stimulus: Anwerfen von @ah-stimulus
    ], [
        - Moderation zur Beschreibung des Bildes
        - ggf. Übersetzungshilfe
    ], [
        Kernpunkte der Beschreibung:
        - comichafter Stil, Karikatur
        - Unterteilung in drei Ebenen:
            + Vordergrund: Person mit Handy, macht Foto von Kindern
            + zwei spielende Kinder im Pool, Wasserspielzeug, ein Kind hat eigene Unterhose auf dem Kopf
            + Hintergrund: weitere, nicht erkennbare spielende Kinder, Szene ist ein Garten
        - Text:
            - Sprechblase des Kindes: "Papi! Hast du Mami das Foto geschickt?"
            - Handy des Mannes: "Deine Fotos wurden durch unsere Kri-?mi-?na-?li-?täts-?er-?ken-?nungs-?soft-?ware als kriminell eingestuft. Die Polizei wurde informiert und alle deine Onlinedienste wurden deaktiviert."
    ], [
        Zip-Zap-Boing, UG
    ], [
        Stimulus, Smartboard
    ],

    table.hline(),
    [
        *Denkzeit* \
        (3 min.)
    ], [
        - Erarbeiten der möglichen philosophischen Problemfragen

        // #todo[Aufgabe rausnehmen?]
        // #task[
        //     Fasse in Form einer Frage zusammen, welches philosophische Problem Sie in dem vorliegenden Bild erkennen.
        // ]
    ], [
        // #todo[Aufgabe rausnehmen?]
        // - Vorlesen der Aufgabe
        // - Klären von Fragen
    ], [
        mögliche Problemfragen:
            - Sollte der Staat meine Chatnachrichten lesen dürfen, um Gefahren abzuwenden?
            - Sollte jeder das Recht haben, geheime Nachrichten zu verschicken?
            - Sollten Eltern Bilder von ihren nackten Kindern machen dürfen?
            - Warum will die Polizei unsere Nachrichten lesen?
            - Wie viel Sicherheit darf Freiheit ersetzen?
            - Sollte man Geheimnisse haben dürfen?
    ], [
        PA
    ], [
        Zettel, Stifte
    ],

    table.hline(),
    [
        *Fragen sammeln* \
        (15 min.)
    ], [
        - erarbeitete Fragen sammeln
    ], [
        - Sammeln der Fragen nach Diktat an der Tafel
        - Bemühen, genauen Wortlaut der SuS zu behalten

    ], [
        Siehe oben.
    ], [
        UG
    ], [
        Whiteboard, Marker
    ],

    table.hline(),
    [
        *Analyse der Fragen* \
        (15 min.)
    ], [
        - Fragen auf gemeinsame Kriterien untersuchen:
            + *Offenheit und Problemgrad:* verschiedene Lösungsmöglichkeiten müssen argumentativ abgewägt werden können

            + *Präzision:* der Umfang der Bearbeitung sollte erahnbar und in der gegebenen Zeit bewältigbar sein

            + *Beantwortbarkeit:* es muss die Möglichkeit, die Frage in einer gemeinsamen Untersuchung im philosophischen Gespräch zu beantworten

            + *Systematisierung:* betreffen das Wesen bzw. die Gültigkeit von Theorien

            + *Verknüpfbarkeit:* Verortung der Frage in bekannte philosophische Disziplinen und Probleme

        - Aussortieren bzw. Umformulieren von nicht geeigneten Fragen
        - Systematisierung nach Themenschwerpunkten
    ], [
        - Moderation und Strukturierung der Kriterienprüfung für einzelne Fragen

    ], [
        mögliche Systematisierung:

        - Recht und Staatsgewalt:
            - Sollte der Staat meine Chatnachrichten lesen dürfen, um Gefahren abzuwenden?

        - Recht auf Privatsphäre:
            - Sollte jeder das Recht haben, geheime Nachrichten zu verschicken?
            - Sollten Eltern Bilder von ihren nackten Kindern machen dürfen?
            - Sollte man Geheimnisse haben dürfen?

        - nicht den Kriterien entsprechend:
            - _(nicht im Gespräch beantwortbar)_ Warum will die Polizei unsere Nachrichten lesen?
            - _(zu offen)_ Wie viel Sicherheit darf Freiheit ersetzen?
    ], [
        UG
    ], [
        Whiteboard, Marker
    ],

    table.hline(),
    [
        *Auswahl einer Frage* \
        (5 min.)
    ], [
        - Auswahl einer Frage nach Mehrheitsprinzip
    ], [
        - Stimmerfassung für jede Frage
        - Mehrfachstimmen sind möglich
        - ggf. Stichwahl durchführen
    ], [
        "Sollte der Staat meine Chatnachrichten lesen dürfen, um Gefahren abzuwenden?"
    ], [
        LV
    ], [
        Whiteboard, Marker
    ],

    table.hline(stroke: (dash: "solid")),
    table.cell(rowspan: 3, rotate(90deg, strong[Erarbeitung & Sicherung])), [
        *Denkzeit* \
        (2 min.)
    ], [
        - erste intuitive Beantwortung der Problemfrage
    ], [

    ], [
        - Ja, denn ...
            - Terrorismus muss abgewendet werden.
            - so kann man Betrug und Straftaten vorbeugen.
            - wer nichts falsch gemacht hat, hat auch nichts zu verbergen.

        - Nein, denn ...
            - jeder hat ein Recht auf Privatsphäre.
            - es könnte zu einem Überwachungsstaat oder Missbrauch führen.
            - es werden auch unschuldige Menschen gescannt.
            - es können Fehler auftreten.
            - der Staat sollte nicht so eine Macht haben.
    ], [
        EA
    ], [

    ],

    table.hline(),
    [
        *Unter-\ suchung* \
        (30 min.)
    ], [
        - philosophische Auseinandersetzung und Argumentation zur Problemlösung
    ], [
        - Einsammeln der Antwortzettel, Auswahl per Losverfahren
        - Anschreiben an Whiteboard
        - Moderation mit folgenden Schwerpunkten:
            - Moderation der Redeliste
            - das Gespräch am Leben erhalten (z.B. durch Würfeln)
            - Einhaltung der Gesprächsregeln einfordern
            - Prüfen auf Stichhaltigkeit der Argumente
            - Einfordern von Begründungen
            - ...

        - Sicherung von Zwischenresultaten auf der Tafel
    ], [
        - Siehe @ah-eh-diskussion.
    ], [
        UG
    ], [
        Whiteboard, Marker
    ],

    table.hline(),
    [
        *Meta-\ gespräch* \
        (10 min.)
    ], [
        - Reflexion des Gesprächs und der Einhaltung der Gesprächsregeln
        - Zusammenfassung der erarbeiteten Erkenntnisse
        - Beurteilung der Antwort und der ggf. offen gebliebenen Probleme/Fragen
    ], [
        - Grundfragen:
            - Was hast du heute gelernt?
            - Welche Fragen sind dir geblieben?
            - Wo könnten wir bei der Diskussion weitermachen?
            - Wie hast du das Gespräch wahrgenommen?
    ], [
        - Was hast du heute gelernt?
            - "dass ich wohl doch was zu verbergen habe."
            - "dass Sicherheit Freiheit einschränken kann."
            - "dass Privatsphäre ein Grundrecht ist."

        - Welche Fragen sind dir geblieben?
            - "Kann man Sicherheit ohne eine Einschränkung von Freiheit erreichen?"
            - "Muss "

        - Wo könnten wir bei der Diskussion weitermachen?

        - Wie hast du das Gespräch wahrgenommen?
    ], [
        UG
    ], [
        Whiteboard, Marker
    ],

    table.hline(stroke: (dash: "solid")),
    table.cell(colspan: 2, strong[Reserve]), [
        - Fortführen mit einer weiteren Inquiry, entweder mit einer anderen Frage vom selben Stimulus oder dem neuen Stimulus aus @ah-reserve
    ]
)
]

#set heading(supplement: "Anlage")
=== Stimulus <ah-stimulus>
#figure(image(width: 50%, "image.png"))

o.~A.: _Stop the proposal on mass surveillance of the EU._ Internet: https://mullvad.net/en/blog/stop-the-proposal-on-mass-surveillance-of-the-eu. Letzter Zugriff: 10.1.2025, 17:25 Uhr.

=== Erwartungshorizont zur Untersuchung <ah-eh-diskussion>
#show table: set list(indent: 0em)
#show table: set par(justify: false)
#show table: set text(hyphenate: true)

Da die konkrete Frage nicht vorhergesagt werden kann, wird die Inquiry anhand der antizipierten Frage "Sollte der Staat meine Chatnachrichten lesen dürfen, um Gefahren abzuwenden?" durchgeführt.

#table(columns: 2, stroke: none,
    [*Aspekt*], table.vline(), [*Erwartungshorizont an Standpunkten*], table.hline(), [
        *Predictive Policing*
    ],[
        #set list(marker: "+")
        - Es ermöglicht, dass Straftaten schneller antizipiert und bei Vollzug aufgeklärt werden können.

        #set list(marker: ([--], "•"))
        - Es bestehen viele Gefahren: z.B.
            - dass falsch Informationen im System gespeichert werden und Personen so schwere Folgen in der Realität erleiden.
            - ... dass Dinge zukünftig kriminalisiert werden, die aktuell noch nicht kriminell sind und Menschen somit nachträglich als krimineller klassifiziert werden.
            - ... von Stereotypen. Wenn jemand gewisse Eigenschaften erfüllt, kann er durch Stereotypen leichter ins Visier geraten.
            - ... ein enormes Missbrauchspotential, besonders für autoritäre und extreme Regime.
        - Das präventive Scannen von Inhalten verletzt die Unschuldsvermutung.

    ], table.hline(), [
        *Privatsphäre und\ Geheimnisse*
    ], [
        #set list(marker: "+")
        - Wer "Wer nichts falsch gemacht hat, hat nichts zu verbergen." vertritt, muss logisch auch "Wer etwas zu verbergen hat, hat etwas falsch gemacht." vertreten. Der letztere Satz ist jedoch falsch.
        - Das Geheimnis ist ein Grundprinzip der freiheitlich-demokratischen Staatsordnung, in Form z.~B. des Wahlgeheimnisses.
        - Es ist ein grundsätzliches menschliches Bedürfnis, nicht alles von sich preiszugeben, das nicht ohne guten Grund verletzt werden darf.
        - Privatsphäre ist ein Grundrecht.
        - Ohne Geheimnisse wird Identitätsdiebstahl erleichtert.
        - Geheimnisse retten Leben: Z.~B. haben Stalker es besonders leicht, wenn ihr Opfer keine Geheimnisse haben dürften.

        #set list(marker: [--])
        - Eine transparente Gesellschaft könnte alle Informationen liefern, um viele Probleme zu lösen.  Geheimnisse erschweren es z.~B. Straftaten aufzuklären.

    ], table.hline(), [
        *Aufgaben des\ Staates*
    ], [
        - ein "liberaler" Staat:
            - Der Staat sollte nur minimale Aufgaben erfüllen und Infrastruktur bereitstellen.
            - Der Staat sollte Menschen vor lebensgefährlichen Gefahren zu schützen.
            - Der Staat hat sich aus allen Entscheidungen von Individuen rauszuhalten, die andere Menschen nicht einschränken.
            - Es gilt, Grundrechte gegeneinander abzuwägen: Statt Terrorismus mit weitreichenden Grundrechtseingriffen zu bekämpfen, gilt es, Terrorismus präventiv vorzubeugen.
            - Ein möglichst liberaler Staat kann nur schwerlich Unterdrückung fördern, auch bei einem Regierungswechsel zu extremistischen Parteien.

        - ein "starker" Staat:
            - Der Staat sollte alle abwendbaren Gefahren abwenden.
            - Terrorismus ist einer der größten Einschnitte in die minimalsten Sicherheitsleistungen, die ein Staat zu bieten hat und muss mit allen Mitteln bekämpft werden.
            - Nur der Staat hat alle nötigen Kompetenzen und Mittel, alle Gefahren abzuwenden.
    ]

    /*
    - Das Recht auf Privatsphäre und Geheimnis
        - als Persönlichkeitsrecht
        - als Prinzip der Autonomie
        - als freiheitlich-demokratisches Grundprinzip


    - Aufgaben des Staates
        - Sicherheitsleistungen
    */
)

=== Reserve <ah-reserve>
#figure(image(width: 50%, "cartoon-tod.png"))
Stefan Roth: Gibt es ein Leben nach dem Tod? Internet: https://roth-cartoons.de/projekt/cartoon-comic-karikatur-leben-nach-dem-tod/ (letzter Zugriff: 13.1.2026).

=== Literatur
#set par(hanging-indent: 1.5em, spacing: 1em)


Bleisch, Barbara: _Das Ende der Autonomie?_ Internet: https://www.philomag.de/artikel/das-ende-der-autonomie (letzter Zugriff: 7.4.2024, 10:00 Uhr) // https://archive.is/4udd6

Simon, Leena: Nichts zu verbergen? Ein moderner Mythos und 12 Argumente dagegen. https://www.kuketz-blog.de/nichts-zu-verbergen-ein-moderner-mythos-und-12-argumente-dagegen/ (letzter Zugriff: 12.1.2026)

#import "/src/template.typ": *

== #ix("Modelle für den Stundenaufbau", "Stundenaufbau", "Ablaufplanmodelle", "Stundenmodelle", "Unterrichtsstundenmodelle")

#def("Problem")[
    Der Problembegriff bezeichnet in der Fachdidaktik eine "bestimmte Art von Schwierigkeit und enthält -- das ist wichtig -- eine Art Suchanleitung für den Lösungsversuch: Er lenkt nämlich den Blick auf die beiden anscheinend widersprüchlichen Thesen und ihr Verhältnis zueinander."#en[@Engels1990_Problembegriff[S. 126-134]]
]

#def("Problemorientierung")[
    Problemorientierter Unterricht bezeichnet eine Art und Weise, in der der Unterricht mit Fokus auf ein bestimmtes philosophisches Problem gerichtet ist. Zu Beginn der Stunde steht eine Problemfrage, am Ende der Stunde wird diese nach bestimmten Kriterien beantwortet.#en[Vgl. @Beugholt2021_ProblemorientierterPU[S. 117]]
]

Es folgen einige standardmäßige Modelle für den Aufbau einer Unterrichtsstunde.

#show grid.cell.where(x: 1): set align(right)
#orange-list-with-body[*#ix("Methodenschlange"):*#en[@Martens2003_MethodenPU[S. 55-58]] #h(1fr) #ix("Martens", "Martens, Ekkehard")][
    #grid(columns: (1fr, 10%), column-gutter: 1em, [
        Mit der Einteilung der #ix("Methoden", "Methode") in #ix("sokratisch-aristotelische Kategorien", "Kategorien, sokratisch-aristotelisch"), entfaltet #ix("Martens", "Martens, Ekkehard") das Prinzip seiner Unterrichtsplanung: die #ix("Methodenschlange"). Martens sieht hier die folgende Reihenfolge der philosophischen Methoden als sinnvoll, jedoch nicht als notwendig an.#en[Vgl. @Martens2003_MethodenPU[S. 56]] Die angegebenen Methoden sind die wichtigsten, jedoch nicht die einzigen, die folgende Liste wird als erweiterbar und veränderbar angesehen:#en[Vgl. @Martens2003_MethodenPU[S. 56]]

        1. *phänomenologische Methode*: Zuerst wird das philosophische Problem phänomenologisch betrachtet. Die Eindrücke der SuS sind hier von Bedeutung.

        2. *hermeneutische Methode*: Danach wird das Problem gedeutet, Verständnisfragen geklärt und es in einen Kontext eingebettet.

        3. *analytische Methode*: Die vorkommenden Begriffe und Argumente werden geklärt.

        4. *dialektische Methode*: Die verschiedenen Perspektiven werden dialektisch gegenübergestellt.

        5. *spekulative Methode*: Eigene Lösungsvorschläge und Ideen kommen hinzu.


    ], image("mod_methodenschlange.png", height: 3cm)+en[@Martens2003_MethodenPU[S. 57]])

][*#ix("Bonbon-Modell"):* #h(1fr) #ix("Sistermann", "Sistermann, Rolf")][
    #grid(columns: (1fr, 10%), column-gutter: 1em, [
            Das #ix("Bonbon-Modell") nach #ix("Sistermann", "Sistermann, Rolf") ist ein Kernmodell für den #ix("problemorientierten", "Problemorientierung") Philosophieunterricht. Es unterscheidet sechs Phasen, die besonders das Interesse und die Probleme der SuS in den Vordergrund stellen und diese dazu anleiten, selbständig Lösungen zu finden, jedoch auch bekannte Positionen mit einbeziehen können. Die sechs Phasen sehen wie folgt aus:#todo[Zitation für Sistermann fehlt, bisher nur unseriöse Quellen/graue Literatur vorhanden.]

            1. *Hinführung:* Das Interesse der SuS wird als Grundlegung für folgende Phasen aktiviert, ein geeignetes philosophisches Problem wird herausgestellt.

            2. *Problemstellung:* Aus den Interessen wird eine verständliche Problemstellung erarbeitet.

            3. *selbstgesteuerte, intuitive Problemösung:* Das Vorwissen der SuS zur Beantwortung der Frage in Probierbewegungen wird aktiviert, sodass diese selbständig einzeln oder gemeinsam die Problemstellung bearbeiten können.

            4. *angeleitete, kontrollierte Problemlösung:* Es wird eine Auseinandersetzung mit bereits bestehenden philosophischen Lösungsansätzen ermöglicht.

            5. *Festigung (Sicherung):* Die Lösungsversuche der kontrollierten Phase werden verglichen und mit den Lösungsversuchen der intuitiven Phase in Verbindung gesetzt. Fehlversuche werden eliminiert und gelungene Lösungen herorgehoben.

            6. *Transfer/Stellungnahme:* Die SuS wenden das Gelernte zuerst mit Rückbezug auf die ursprüngliche Problemfrage und dann auf neue Beispiele oder offene Fragen an und/oder beziehen kritisch Stellung zur gefundenen Lösung.

            Das #ix("Bonbon-Modell") ist nicht nur für einzelne Unterrichtsstunden gedacht, sondern soll sich ebenfalls über mehrere Unterrichtseinheiten erstrecken können.

    ], image("mod_bonbon.png", height: 3.25cm)+en[@Runtenberg2016_EPhiD[S. 139]])

][*#ix("PEST"):*#en[Vgl. @Klager2016_SpielAlsWeltzugang[S. 302-309]] #h(1fr) #ix("Klager", "Klager, Christian")][
    #grid(columns: (1fr, 10%), column-gutter: 1em, [
        Das #ix("PEST")-Modell ist ein didaktisches Standardmodell zur Unterrichtsplanung und besteht aus vier Phasen.

        + *Problematisierungsphase:* In der Problematisierungsphase wird das Thema der Stunde motiviert, durch die SuS erarbeitet und kontrovers dargestellt.

        + *Erarbeitungsphase:* Nachdem das Problem herausgestellt wurde, wird es durch die SuS inhaltlich bearbeitet und Kompetenzen werden generiert.

        + *Sicherungsphase:* Die Sicherungsphase ermöglicht es den SuS die Inhalte zu vergleichen und zu festigen.

        + *Transferphase:* In der Transferphase wird das erarbeitete Wissen auf ein neues Beispiel angewendet, um sicherzugehen, dass die gewonnen Fertigkeiten anwendbar sind.
    ], image("mod_pest.png", height: 1.75cm))

][*#ix("Backward Design") / #ix("PETF"):*#en[@Poerschke2021_BackwardDesign]  #h(1fr) #ix("Sistermann", "Sistermann, Rolf"), #ix("Pörschke", "Pörschke, Tim")][
    #grid(columns: (1fr, 10%), column-gutter: 1em, [
        #ix("Rolf Sistermann", "Sistermann, Rolf") empfiehlt das #ix("Backward Design", "Backward Design", "PETF") in Verbindung mit seinem Bonbon-Modell als Planungsmethode für eine Unterrichtsstunde. Das Ziel der Unterrichtsstunde wird dabei in den Vordergrund stellt.

        + *Festigungsphase:* Welche Inhalte sollen gefestigt werden?

        + *Problemstellung:* Welche Problemstellung führt zu den Inhalten der Festigungsphase?

        + *Materialien:* Welche Materialien unterstützen dabei?

        + *intuitive Phase:* Wie werden die SuS motiviert, das Problem intuitiv zu lösen?

        + *Transferphase:* Wie kann mit dem Problem weitergearbeitet werden?

        + *Hinführung:* Was eignet sich als Hinführung?

        #ix("Tim Pörschke", "Pörschke, Tim") empfiehlt eine Erweiterung des Modells, erweitert den Vorschlag damit um eine curriculare Legitimation und Einbettungen anderer didaktischer Konzepte:#en[Vgl. @Poerschke2021_BackwardDesign[S. 112-120]]

        + *Formulierung des Lernziels:* Anhand des Rahmenplans und dem Thema der Unterrichtsreihe wird ein Lernziel formuliert.

        + *Ergebnissicherung/Material:* Variabel kann entweder zuerst geeignetes Material für das Lernziel gesucht oder die Planung der Ergebnissicherung stattfinden.

        + *Problemstellung:* Es wird eine Problemstellung entworfen, deren Antwort die Inhalte der Ergebnissicherung/Festigungsphase sind.

        + *Hinführung:* Für die gegebene Problemstellung wird eine geeignete Hinführung für den Stundeneinstieg entworfen.

        + *Unterrichtssetting:* Für die SuS wird eine Umgebung gestaltet, die die Notwendigkeit zum weiteren Arbeiten verdeutlicht.

        + *Methoden/Sozialformen:* Es werden geeignete Methoden und Sozialformen gewählt.

        + *Transfer:* Für die Weiterarbeit mit den Inhalten werden geeignete Aufgaben für den Wissenstransfer vorbereitet.

        #ix("Backward Design") als Ansatz kann daher mit anderen Methoden für die Planung Unterrichtsstunden kombiniert werden. Es geht hier um eine Anpassung des Prozesses der Planung, nicht um die konkrete Unterrichtsstruktur, die dann von anderen Modellen wie der #ix("Methodenschlange") oder dem #ix("Bonbon-Modell") festgelegt werden. // entfernbar
    ], image("mod_petf.png", height: 1.75cm))
]

#task(key: "pest-vs-inquiry")[PEST vs. Inquiry][
    Vergleichen Sie den klassischen Aufbau einer Unterrichtsstunde nach dem PEST-Modell mit der Methode der Inquiry!
][
    Das klassiche PEST-Modell beginnt mit einer Problematisierung, in der das Thema der Stunde motiviert und als Problem durch die SuS erarbeitet wird. Danach folgt die Erarbeitungsphase, in der es gelöst und in der Sicherungsphase verglichen und festgehalten wird. In der abschließenden Transferphase wird das erlangte Wissen auf einen neuen Sachverhalt angewandt.

    Die Inquiry hat im Gegensatz zum PEST-Modell sieben statt vier Phasen, jedoch lassen sich diese sieben Phasen teilweise in das PEST-Modell übersetzen: Die ersten vier Phasen -- das Geben des Stimulus, das Stellen philosophischen Fragen, das Sammeln dieser und die Auswahl der Frage -- lässt sich als Problematisierung im PEST-Modell sehen, da hier das Problem aufgeworfen und zur Bearbeitung ausgewählt wird. Die darauffolgende Denkzeit und Untersuchung kann als fünfte und sechste Phase, welche im PEST-Modell die Bearbeitungsphase darstellt, betrachtet werden. Das Metagespräch und die Evaluation sind wie eine Sicherung, besonders das schriftliche Festhalten dieser ist eine typische Form der Sicherung. Was fehlt, wäre die anschließende Transferphase, die in der Grundform der Inquiry nicht gegeben ist. Durch eine anschließende Aufgabe wäre diese jedoch auch gegeben und die Inquiry könnte eine vollwertige Unterrichtsstunde im PEST-Modell dartellen.
]
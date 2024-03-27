#import "/src/template.typ": en
#set heading(outlined: false)

= Nutzungshinweise

== Inhalt

Auch wenn die Gestaltung und der Name des KÜKs als Parodie an den MÜK angelehnt sind, soll hier versucht werden die Inhalte der Philosophiedidaktik-Seminare an der Universität Rostock ernsthaft aufzuarbeiten und zusammenzufassen, zu belegen und weitere Hinweise und Tipps zu darzulegen. Arbeiten Sie aktiv mit den Inhalten, um sie sich anzueignen und in den Prüfungen wiedergeben und anwenden zu können!

== Zusatzelemente

Die Zusatzelemente des KÜKs bieten weitere Informationen und Belege. Außerdem sollen Sie die Navigation innerhalb des KÜKs erleichtern, sowohl in der Digital- als auch in einer Print-Version.

#table(columns: (33.33%, 33.33%, 33.33%),
    stroke: none,

    strong[Aufgaben und Lösungen],
    strong[Anmerkungen],
    strong[Index],

    [
        Einige Abschnitte enthalten Aufgaben inklusive Lösungsvorschläge. Diese setzen sich zusammen aus den Aufgaben innerhalb des Seminars, aus den fakultativen Hausaufgaben, den bereitgestellten Beispielklausuraufgaben und einigen eigenen Ideen. Die Aufgaben sind als Anwendungsmöglichkeit der Seminarinhalte gedacht. Aufgaben werden mit Großbuchstaben nummeriert und sind in hellblauen Boxen eingerahmt.
    ], [
        Anmerkungen werden durch hochgestellte, arabisch nummerierte Endnotenverweise dargestellt, wie z.B. hier.#en[Hier eine Beispiel-Anmerkung!] Auf die hochgestellten Zahlen können sie in der digitalen Version klicken, um zu der Anmerkung zu gelangen. Die Anmerkungen werden am Ende des Dokuments mit der Seitenzahl, auf der sie auftreten, aufgelistet. Klicken Sie erneut auf die Zahl in dieser Anmerkungsliste, gelangen Sie zurück zu dem Ort, an dem die Anmerkung verwendet wird.
    ], [
        Der Index ist am Ende des KÜKs eine alphabetisch sortierte Liste von Fachbegriffen und Namen, die hier im KÜK verwendet werden. Hinter jedem Begriff sind die Seitenzahlen aufgelistet, wo er verwendet wird. Dies ist besonders nützlich, sollte der KÜK ausgedruckt werden.
    ]
)

== To Do

Der KÜK ist nicht abgeschlossen. Auch für die bisher erarbeiteten Inhalte gibt es noch zu ergänzende Themengebiete. Hauptsächlich handelt es sich dabei um fehlende Lösungsvorschläge zu Aufgabenbeispielen. Um Stellen zu markieren, die ergänzt werden müssen

== Versionierung

Da der KÜK kein abgeschlossenes Werk ist und auch weiterhin daran gearbeitet werden soll, muss sichergestellt werden, dass die unterschiedlichen Versionen des KÜK gut erkannt und die neuste Version leicht auffindbar ist. Die Version ist auf dem Deckblat notiert und setzt sich aus dem Veröffentlichungsjahr und -monat zusammen. Dieses Dokument ist die *Version #(str(datetime.today().year())+"-"+if datetime.today().month() < 9 { "0" } else { "" } +str(datetime.today().month()))*.

Die aktuellste Version dieses Dokuments finden Sie immer hier: #strong(link("https://piepert.github.io/philodidaktik-hro-phf-ifp/KÜK.pdf")). Eine archivierte Version dieser Datei finden Sie unter #strong(link("https://piepert.github.io/philodidaktik-hro-phf-ifp/KÜK-"+str(datetime.today().year())+"-"+if datetime.today().month() < 9 { "0" } else { "" } +str(datetime.today().month())+".pdf")).
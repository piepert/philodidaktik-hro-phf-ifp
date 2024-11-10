#import "/src/lernerfolgskontrollen/template.typ": *

#set page(flipped: true)
#set text(size: 0.675em)
#show: columns.with(2)

#show: project.with(
  topic: "Schriftlicher Dialog",
  stufe: 9
)

*Aufgabe* #h(1fr) (20 P.) \
Wähle von den folgenden zwei Situationen eine aus. Gestalte anschließend einen philosophischen Dialog, in welchem sich die Dialogpartner*innen begründet mit ihrer Position zur jeweiligen Situation auseinandersetzen!

+ Der Nihilist Nils und die Hedonistin Heidi sprechen über die bevorstehende Party ihrer Klassenkameradin Lucy. Diese soll am kommenden Samstag stattfinden. Einen besonderen Anlass für die Party gibt es nicht. Beide haben eine Einladung bekommen, sind sich jedoch uneinig, ob sie diese annehmen.

+ Der Hedonist Heinrich und die Nihilistin Nadja unterhalten sich über die neue Umweltkampagne der Schule. Diese ruft dazu auf, dass sich alle Schüler:innen jeden Sonntag im Schuljahr zum Müllsammeln im Park treffen sollen. Beide haben eine andere Meinung zu dieser Kampagne.

*Zusatzaufgabe* #h(1fr) (+ 2 P.) \
Maja, ein Vertreterin der Mesoteslehre, bekommt das Gespräch zwischen den beiden mit und möchte eine Lösung finden, mit der beide zufrieden sind. Ergänze den Lösungsvorschlag von Maja in deinem Dialog.

#h(1fr)

#show table.cell: block.with(breakable: false)
#table(columns: (1fr, auto),
    strong[Dialog],
    strong[P.],


    table.cell(fill: black.lighten(80%), strong[Formales -- allgemein]),
    table.cell(fill: black.lighten(80%), strong[2 P.]),
    [
        Grammatik
    ],
    [\_\_ / 1],

    [
        Orthographie
    ],
    [\_\_ / 1],

    table.cell(fill: black.lighten(80%), strong[Formales -- dialog-spezifisch]),
    table.cell(fill: black.lighten(80%), strong[4 P.]),
    [
        Eine Gliederung des Dialoges ist erkennbar (in Hinführung, These aufstellen, Argumentation, Fazit).
    ],
    [\_\_ / 2],
    [
        Der Text ist in reiner Gesprächsform. Nur die Figuren sprechen, es gibt keinen Erzähler oder sonstigen Text, der nicht durch Figuren gesagt wird.
    ],
    [\_\_ / 1],

    [
        Es sind mindestens 2 Gesprächsteilnehmer vorhanden.
    ],
    [\_\_ / 1],

    table.cell(fill: black.lighten(80%), strong[Inhaltliches -- generell]),
    table.cell(fill: black.lighten(80%), strong[2 P.]),
    [
        Der in der Aufgabenstellung gegebene Kontext wird eingehalten.
        - keine vom Thema abschweifenden Bemerkungen
        - Bezug zum gegebenen Thema erkennbar
    ],
    [\_\_ / 2],

    table.cell(fill: black.lighten(80%), strong[Inhaltliches -- Problematisierung/Thesenfindung]),
    table.cell(fill: black.lighten(80%), strong[3 P.]),
    [
        Mindestens eine These zur Prüfung wird aufgestellt. Z.B.:
        - "Wir sollten auf die Party, da es uns allen Spaß bereitet!"
        - "Ob ich mich nun im Park treffe oder nicht, ist egal, denn die Umwelt befindet sich eh nicht in meiner Kontrolle."
    ],
    [\_\_ / 1],
    [
        Die bearbeiteten Thesen bieten eine Problematik des moralischen Handelns, der philosophischen Lebensgestaltung oder bzgl. der Sinndeutung des Lebens. Z.B.:
        - Sollten wir nur handeln, wenn es uns Freude bereitet?
        - Inwiefern muss ich Verantwortung übernehmen, wenn meine Umgebung scheinbar nicht unter meiner Kontrolle ist?
    ],
    [\_\_ / 2],

    table.cell(fill: black.lighten(80%), strong[Inhaltliches -- Diskussion/Argumentation]),
    table.cell(fill: black.lighten(80%), strong[6 P.]),
    [
        Die bearbeiteten Thesen werden durch Argumente kritisch geprüft. Argumente bleiben nicht "im leeren Raum", sondern die Gesprächspartner reagieren darauf.
    ],
    [\_\_ / 3],
    [
        Die Argumente sind formal logisch-gültig oder mindestens plausibel.
    ],
    [\_\_ / 3],

    table.cell(fill: black.lighten(80%), strong[Inhaltliches -- Fazit]),
    table.cell(fill: black.lighten(80%), strong[3 P.]),
    [
        Die Argumente werden abgewogen und eine stärkere Position wird herausgestellt. Es handelt sich nicht um ein reines Aufzählen von Argumenten, sondern die Argumente bauen sich auf und kommen schließlich zu einer Beantwortung der These.
    ],
    [\_\_ / 1],
    [
        Das Problem wird gelöst (die These wird beantwortet) oder offene Fragen werden angesprochen.
    ],
    [\_\_ / 2],

    table.cell(fill: black.lighten(80%), strong[Zusatzaugabe]),
    table.cell(fill: black.lighten(80%), strong[2 P.]),
    [
        Das Argument macht sich die Mesotes-Lehre zunutze, um das Problem zu beantworten.
    ],
    [\_\_ / 1],
    [
        Das Argument ist eine mögliche Lösung des Problems.
    ],
    [\_\_ / 1],
)

/*
#line(length: 100%)

#set enum(numbering: "A)")
*Aufgabe 1* #h(1fr) (6 P.) \
Beschreibe eine Religion deiner Wahl anhand der folgenden Kriterien:
- Prophet
- Name des Gottes
- wichtige Feste
- Gebote
- Vorstellung

*Aufgabe 2* #h(1fr) (8 P.) \
Wähle von den folgenden zwei Aufgaben eine aus und bearbeite sie.

#grid(columns: 2)[
    1. Erläutere das Kausalitätsprinzip anhand eines selbstgewählten Beispiels.
][
    2. Erläutere anhand eines selbstgewählten Beispiels, inweifern Gott den Menschen laut Nietzsche Orientierung geboten hat.
]

*Aufgabe 3* #h(1fr) (6 P.) \
Wähle von den folgenden zwei Aufgaben eine aus und bearbeite sie.

#grid(columns: 2)[
    1. Nimm begründet Stellung dazu, ob ChatGPT als "Gott" bezeichnet werden kann.

        _Hinweis: Du kannst dich auf Jonas oder Nietzsche beziehen._
][
    2. Entwirf als Thomas v. Aquin eine Antwort auf die folgende These. Berücksichtige dabei seinen Gottesbeweis.

        _"Wert Gott nicht sieht, kann ihn auch nicht beweisen."_
]

*Zusatzaufgabe* #h(1fr) (+ 1 P.) \
Beschreibe eine Religion deiner Wahl anhand der folgenden Kriterien:
- Prophet
- Name des Gottes
- wichtige Feste
- Gebote
- Vorstellung
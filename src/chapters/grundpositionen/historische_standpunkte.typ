#import "/src/template.typ": *

== Historische Standpunkte zur Philosophiedidaktik

// Es folgen einige historische Grundpositionen, die jeweils zwei Dinge derjenigen Vertreter charakterisieren sollen: zuerst den Philosphiebegriff und darauf folgend eine didaktische Grundhaltung. Die didaktische Grundhaltung kann ein thematischer und/oder methodischer Schwerpunkt sein.
// Von der Antike bis zur Moderne sind die folgenden Philosophie- und Philosophiedidaktikbegriffe vertreten:#en[Vgl. C. Runtenberg: Philosophiedidaktik. Lehren und Lernen. Paderborn 2016. S. 18 ff.]

#let stances = (
    "#1 Sokrates": [
        #ix("", "Sokrates")Die Philosophie ist eine öffentliche Angelegenheit, kritisches Denken, Entwickeln von Problembewusstsein. Die didaktische Methode ist die _#ix("Hebammenkunst", "Mäeutik", "Hebammenkunst")_: durch geziehlte Verwirrung wird der Mensch zu selbständigem Denken angeregt, der Philosophielehrer ist die Hebamme, die den Sus hilft die Erkenntnis, die bereits in ihnen steckt, hervor zu bringen.
    ],

    "#2 Platon": [
        #ix("", "Platon")Die philosophische Erforschung der Wahrheit und die Prüfung des Selbst führen dazu, für die eigene Seele zu sorgen. Philosophieren findet an praktischen Fragen statt, es ist der _Umgang mit den Ideen_. Die #ix("Dialektik") ist die Primärmethode des Philosophierens. Ziel der Philosophie ist das gute Leben.
    ],

    "#3 Aristoteles": [
        #ix("", "Aristoteles")Philosophie hat das gute, sittliche Leben und das Leben in der Wissenschaft zum Gegenstand. Ziel ist die Ausbildung von Klugheit in einer passenden Lernumgebund (entfernt vom Alltag), ein _#ix("Phronimos")_ (ein Weiser) zu werden, der das gute Leben zu organisieren weiß und die rechte Mitte zwischen zwei Extremen findet.
    ],

    "#4 Epikur": [
        #ix("", "Epikur")Philosophie ist das Schulen der Vernunft und soll zu einer reflektierten Genussfähigkeit und einer _rationalen Auseinandersetzung mit irrationalen Ängsten_, Vorstellungen und Vorurteilen und damit zu einem insgesamt gelingendem Leben führen. Der Mensch ist selbstbestimmt und handelt verantwortungsbewusst.
    ],

    "#5 Kant": [
        #ix("", "Kant, Immanuel")Philosophie ist öffentlich und praktisch. Sie dient der Ausbildung der Urteilskraft, des Verstandes und der Vernunft als Reflexion. Im Mittelspunkt steht das Selbstdenken angeleitet durch die _induktive Methode_. Deduktive Methoden werden abgelehnt, da bei ihnen die Selbständigkeit im Lernprozess fehlt. Ziel ist die Bildung eines Autonomen, aufgeklärten, moralisch-urteilsfähigen Menschen. Der Mensch lernt nicht Philosophie, er lernt _zu philosophieren_.
    ],

    "#6 Hegel": [
        #ix("", "Hegel, Georg W. F.")Die Philosophie wird deduktiv gelernt, durch die Methode des _verstehenden Nachvollzugs_. Bereits bestehende Inhalte klassischer Philosophen müssen erlernt und nachvollzogen werden. Die Primärmethode des Philosophieunterrichts ist der Lehrervortrag, der die philosophischen Inhalte vermittelt. Es um das Erlernen formaler Denkfähigkeiten anhand klassischer Positionen zur Auseinandersetzung mit philosophischen Themen.
    ],

    "#7 Nietzsche": [
        #ix("", "Nietzsche, Friedrich W.")Philosophieren ist relativ an die Philosophie umgebenden Verhältnisse gebunden, die sie und ihre historische Entwicklung versucht kritisch zu betrachten. Philosophieren ist ein schmerzhafter Vereinsamungsprozess, sich von der gewohnten Lebenswelt abzutrennen, und soll zu einer Neugeburt des einsamen Denkers führen, bis nur die Liebe zum Leben, ein selbstdenkendes und kritisches Individuum mit einer neuen Perspektive auf die Welt zurückbleibt.
    ],

    "#8 Foucault": [
        #ix("", "Foucault, Michel")Philosophie ist ein Ethos, eine Lebensgewohnheit, eine permanente Haltung. Das Selbstdenken steht auch hier im Vordergrund, Aufklärung ist eine Kritik der Weltanschauung, eine kritisch-historische Untersuchung. Die philosophische Bildung soll ein permanentes, freies und das Individuum im Einzelnen förderndes Angebot sein. Selbstauseinandersetzung steht im Mittelpunkt. Ziel ist die Arbeit an einer Bildung einer eigenen Identität durch Entledigung schlechter Gewohnheiten und falscher Ansichten.
    ]
)

// #grid(columns: 1, column-gutter: 1em, row-gutter: 1em,
//     ..(stances.keys().map(e => {
//         block(breakable: false, {
//             strong(e)+[\ ]
//             stances.at(e)
//         })
//     })).flatten()
// )

#[
    #show: columns.with(2)
    #(stances.keys().slice(0, -1).map(e => {
        block(breakable: false, {
            strong(e)+[\ ]
            stances.at(e)
        })
    })).flatten().join([])
]

#(stances.keys().slice(stances.keys().len()-1).map(e => {
    block(breakable: false, {
        strong(e)+[\ ]
        stances.at(e)
    })
})).flatten().join([])
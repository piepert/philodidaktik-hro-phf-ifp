#import "/src/template.typ": *

#let med(page) = en[Vgl. Descartes, Renè: AT VII. S. #page.]

== #ix("Das cogito-Argument", "cogito-Argument")

Ausgehend vom #ix("methodischen Zweifel", "Zweifel, methodisch") setzt #ix("Descartes", "Descartes, René") fort und sucht nach Erkenntnis, an der es nicht möglich ist zu zweifeln. Er kommt zu dem Schluss, dass der Satz "Ich bin, ich existiere"#med[25] nicht falsch werden kann, wenn er ausgesprochen oder gedacht wird. Selbst wenn es einen allmächtigen #ix("Täuschergott", "Genius malignus") gäbe, so wäre auch er nicht in der Lage diesen Satz, wenn er vom Getäuschten gedacht wird, falsch zu machen. Denn wenn ein Täuscher jemanden täuscht, gibt es jemanden, der getäuscht wird. Es handelt sich dabei jedoch nicht um das _#ix("cogito-Argument")_. Der berühmte Satz "Cogito ergo sum." (dt. "Ich denke, also bin/existiere ich.") kommt nicht in den Meditationen vor. Ausschlaggebend ist jedoch, dass #ix("Descartes", "Descartes, René") als erste, feste Erkenntnis findet: "Ich existiere."

#set par(justify: false)
#grid(columns: (10%, 45%, 45%).map(e => e - 1.5em),
    row-gutter: 1em,
    column-gutter: 1.5em,
    strong[Stufe], strong[Thema im Rahmenplan], strong[Thema bei Descartes],

    [5], align(center + horizon)[/], align(center + horizon)[/],

    [6], align(center + horizon)[/], align(center + horizon)[/],

    [7], align(center + horizon)[/], align(center + horizon)[/],

    [8/9], align(center + horizon)[/], align(center + horizon)[/],

    [10], [
        - *Regeln logischen Denkens:* Wie urteile und schließe ich korrekt?#en[Vgl. @MBWKMV2002_RP710[S. 34]]
    ], [
        - Ist das #ix("cogito-Argument") gültig, schlüssig und/oder rein intuitiv?
    ],

    [11/12], [
        - *Erkenntnis:* dialektische Auseinandersetzung mit Thesen zur menschlichen Erkenntnis, Rationalismus#en[Vgl. @MBWKMV2019_RP1112[S. 12]]
    ], [
        - Denken und Vernunft als reine Methode der Erkenntnis
    ])
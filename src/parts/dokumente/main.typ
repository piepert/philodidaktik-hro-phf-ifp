#import "/src/template.typ": *


#metadata("noheads")<outline>
#make-part([Dokumente und Praxisbeispiele], subtitle: [Entwürfe, Kurzkontrollen, ...], l: "dokumente")

#show heading.where(level: 2): it => pagebreak(weak: true) + it
#include "entwürfe/main.typ"
#include "leks/main.typ"

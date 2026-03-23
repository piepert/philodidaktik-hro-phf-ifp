#import "/src/template.typ": *

= Lernerfolgskontrollen

#todo[]

#counter(heading).update(0)
#set heading(supplement: [Lernerfolgskontrolle])
#set heading(numbering: (..n) => {
    let n = n.pos().slice(1)

    numbering("L1.1.", ..n)
})

#include "uebung01/main.typ"
#include "spue01/main.typ"

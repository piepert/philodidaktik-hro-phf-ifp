#import "/src/template.typ": *

= Entwürfe

#todo[]

#set heading(supplement: [Entwurf])
#set heading(numbering: (..n) => {
    let n = n.pos().slice(1)

    numbering("E1.1.", ..n)
})

#include "uebung01/main.typ"
#include "inquiry01/main.typ"

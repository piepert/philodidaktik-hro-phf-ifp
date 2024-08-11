#let note-number(key: none) = counter("endnotes").step() + context {
  let counter-val = state("endnotes", ()).at(here()).len() + 1

  let origin = label(if key == none {
    "en-"+str(counter-val)+"-origin"
  } else {
    key+"-origin"
  })

  let target = label(if key == none {
    "en-"+str(counter-val)+"-target"
  } else {
    key+"-target"
  })

  [#link(target, super[#counter("endnotes").at(here()).first()])#origin]
}

#let note-content(key: none, body) = {
  state("endnotes", ()).update(k => {
    k.push((
      target: label(if key == none { "en-"+str(k.len() + 1)+"-target" } else { key+"-target" }),
      origin: label(if key == none { "en-"+str(k.len() + 1)+"-origin" } else { key+"-origin" }),
      content: body
    ))
    k
  })
}

#let note(body) = {
  note-number()
  note-content(body)
}

#let make-notes() = context {
  heading[Endnotes]
  let i = 1
  for note in state("endnotes", ()).final() {
    counter("endnotes").update(i)
    block[#super[#i]#note.content#note.target]
    i += 1
  }
}

#note[A]
#note[B#note-number(key: "E")#note-number(key: "F")]
#note-content(key: "E")[E]
#note-content(key: "F")[F]
#note[C]
#note[D]

#make-notes()
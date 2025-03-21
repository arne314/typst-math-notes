#import "./utils.typ": *
#import "./localization.typ": get-translation

// see: https://typst.app/universe/package/fontawesome
#import "@preview/fontawesome:0.5.0": *

// see: https://typst.app/universe/package/rich-counters
#import "@preview/rich-counters:0.2.2": rich-counter

// see: https://typst.app/universe/package/showybox
#import "@preview/showybox:2.0.3": showybox

// -----------------------
// theorems 🔬
// -----------------------

#let thboxcounter = rich-counter(identifier: "thboxcounter", inherited_levels: 1)

#let thbox(type: none, title: none, content: lorem(10), footer: none, color: maincolor) = [
  #showybox(
    title-style: (
      weight: 900,
      color: color.darken(20%),
      sep-thickness: 0pt,
    ),
    footer-style: (
      sep-thickness: 0pt,
      color: color.darken(20%)
    ),
    frame: (
      title-color: color.lighten(80%),
      border-color: color.darken(20%),
      footer-color: color.lighten(80%),
      body-inset: 1em,
      thickness: (left: 1.5pt),
      radius: 0pt,
    ),
    shadow: (
      color: color.lighten(80%),
      offset: (x: 2pt, y: 2pt)
    ),
    title: (
      if type != none [
        #(thboxcounter.step)()
        #type #context (thboxcounter.display)(). #hs(0.2) #title
      ] else [
        #title
      ]
    ),
    ..if footer == none { (:) } else { (footer: [#footer]) },
    spacing: 1em,
    breakable: false,
    [#content]
  )
]

#let axiom(..args) = {
  let name = if args.pos().len() > 1 { args.pos().first() } else { none }
  let it   = args.pos().at(-1)

  thbox(
    type: get-translation("axiom"),
    title: name,
    content: it,
    color: orange
  )
}

#let definition(..args) = {
  let name = if args.pos().len() > 1 { args.pos().first() } else { none }
  let it   = args.pos().at(-1)

  thbox(
    type: get-translation("definition"),
    title: name,
    content: it,
    color: green
  )
}

#let theorem(..args) = {
  let name = if args.pos().len() > 1 { args.pos().first() } else { none }
  let it   = args.pos().at(-1)

  thbox(
    type: get-translation("theorem"),
    title: name,
    content: it,
    color: red
  )
}

#let lemma(..args) = {
  let name = if args.pos().len() > 1 { args.pos().first() } else { none }
  let it   = args.pos().at(-1)

  thbox(
    type: get-translation("lemma"),
    title: name,
    content: it,
    color: blue
  )
}

#let corollary(..args) = {
  let name = if args.pos().len() > 1 { args.pos().first() } else { none }
  let it   = args.pos().at(-1)

  thbox(
    type: get-translation("corollary"),
    title: name,
    content: it,
    color: purple
  )
}

#let exercise(..args) = {
  let name = if args.pos().len() > 2 { args.pos().first() } else { none }
  let it   = if args.pos().len() > 2 { args.pos().at(1) } else { args.pos().first() }

  thbox(
    type: get-translation("exercice"),
    title: name,
    content: it,
    color: red,
    footer: [*#fa-pen-to-square() #hs(0.2) Correction* #vs(0.5)] + if args.pos().len() > 2 { args.pos().at(2) } else { args.pos().at(1) }
  )
}

#let tip(it) = thbox(
  title: fa-lightbulb(), 
  content: it, 
  color: orange
)

#let info(it) = thbox(
  title: fa-circle-info(), 
  content: it, 
  color: blue
)

#let remark(it) = thbox(
  title: fa-message(), 
  content: it, 
  color: gray
)

#let important(it) = thbox(
  title: fa-triangle-exclamation(), 
  content: it, 
  color: orange
)

#let caution(it) = thbox(
  title: fa-circle-exclamation(), 
  content: it, 
  color: red
)

#let proof(it) = [
  *#text(maincolor)[#get-translation("proof")]*
  
  #it
      
  #align(right)[#rect(width: 7pt, height: 7pt, fill: maincolor, radius: 15%)]
]

#let example(it) = [
  *#text(maincolor)[#get-translation("example")]*
  
  #it
]

// -----------------------
// packages 📦
// -----------------------

// see: https://typst.app/universe/package/rich-counters
#import "@preview/rich-counters:0.2.2": *

// see: https://typst.app/universe/package/showybox
#import "@preview/showybox:2.0.3": showybox

// see: https://typst.app/universe/package/codly
#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.1": *

// see: https://typst.app/universe/package/cetz
#import "@preview/cetz:0.3.2": *

// see: https://typst.app/universe/package/mannot
#import "@preview/mannot:0.2.1": *

// see: https://typst.app/universe/package/fontawesome
#import "@preview/fontawesome:0.5.0": *

// -----------------------
// utils 🔨
// -----------------------

#let red    = rgb(177, 109, 104)
#let green  = rgb(151, 194, 134)
#let blue   = rgb(90, 124, 166)
#let orange = rgb(220, 159, 80)
#let purple = rgb(160, 150, 221)
#let gray   = rgb(151, 163, 146)

#let maincolor = blue

#let N = $upright(bold(N))$
#let Z = $upright(bold(Z))$
#let Q = $upright(bold(Q))$
#let R = $upright(bold(R))$
#let C = $upright(bold(C))$
#let K = $upright(bold(K))$

#let vs(size) = { v(size * 10pt) }
#let hs(size) = { h(size * 10pt) }

// -----------------------
// translation 🌍
// -----------------------

#let lang = "fr"

#let lexicon = (
  en: (
    axiom:      "Axiom",
    definition: "Definition",
    theorem:    "Theorem",
    lemma:      "Lemma",
    corollary:  "Corollary",
    exercice:   "Exercice",
    proof:      "Proof",
    example:    "Example",
    solution:   "Solution",
  ),
  fr: (
    axiom:      "Axiome",
    definition: "Définition",
    theorem:    "Théorème",
    lemma:      "Lemme",
    corollary:  "Corollaire",
    exercice:   "Exercice",
    proof:      "Démonstration",
    example:    "Exemple",
    solution:   "Correction",
  ),
)

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
    type: lexicon.at(lang).at("axiom"),
    title: name,
    content: it,
    color: orange
  )
}

#let definition(..args) = {
  let name = if args.pos().len() > 1 { args.pos().first() } else { none }
  let it   = args.pos().at(-1)

  thbox(
    type: lexicon.at(lang).at("definition"),
    title: name,
    content: it,
    color: green
  )
}

#let theorem(..args) = {
  let name = if args.pos().len() > 1 { args.pos().first() } else { none }
  let it   = args.pos().at(-1)

  thbox(
    type: lexicon.at(lang).at("theorem"),
    title: name,
    content: it,
    color: red
  )
}

#let lemma(..args) = {
  let name = if args.pos().len() > 1 { args.pos().first() } else { none }
  let it   = args.pos().at(-1)

  thbox(
    type: lexicon.at(lang).at("lemma"),
    title: name,
    content: it,
    color: blue
  )
}

#let corollary(..args) = {
  let name = if args.pos().len() > 1 { args.pos().first() } else { none }
  let it   = args.pos().at(-1)

  thbox(
    type: lexicon.at(lang).at("corollary"),
    title: name,
    content: it,
    color: purple
  )
}

#let exercise(..args) = {
  let name = if args.pos().len() > 2 { args.pos().first() } else { none }
  let it   = if args.pos().len() > 2 { args.pos().at(1) } else { args.pos().first() }

  thbox(
    type: lexicon.at(lang).at("exercice"),
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
  *#text(maincolor)[#lexicon.at(lang).at("proof")]*
  
  #it
      
  #align(right)[#rect(width: 7pt, height: 7pt, fill: maincolor, radius: 15%)]
]

#let example(it) = [
  *#text(maincolor)[#lexicon.at(lang).at("example")]*
  
  #it
]

// -----------------------
// mannot ✍🏻
// -----------------------

#let frame(tag: none, body, color) = {
  let underlay(width, height, color) = {
    rect(width: width, height: height, stroke: color + 0.5pt, radius: 10%, fill: color.lighten(90%))
  }
  
  return core-mark(text(color)[#body], tag: tag, color: color, underlay: underlay, padding: .2em)
}

#let label(
  tag,
  annotation,
  pos: top,
  yshift: .5em,
) = annot(tag, annotation, pos: pos, yshift: yshift, text-props: (size: .9em), show-arrow: false)

// -----------------------
// document 🖨️
// -----------------------

#let doc(
  title: [],
  subtitle: [],
  chapter: 0,
  doc
) = {
  set text(
    lang: lang,
    size: 10pt,
  )  
  
  set page(
    paper: "a4",
    margin: (
      x: 4em,
      y: 4.5em,
    ),
    header: [
      *#subtitle*
      #h(1fr)
      *#title*
      #vs(-0.5)
      #line(
        length: 100%,
        stroke: 0.5pt,
      )
    ],
    footer: context [
      _ #title _
      #h(1fr)
      #counter(page).display(
        "1",
      )
    ]
  )
  
  set par(
    leading: 0.65em, 
    spacing: 1.2em, 
    justify: true,
  )

  // -----------------------
  // codly 💻
  // -----------------------
  
  show: codly-init.with()
  
  codly(
    languages: (
      python: (name: " Python", icon: fa-python(), color: orange),
    ),
    inset: 3pt,
    zebra-fill: maincolor.lighten(90%),
  )
  
  // -----------------------
  // tables 🏓
  // -----------------------
  
  set table(
    align: center + horizon,
    stroke: none,
    gutter: 0.2em,
    fill: (x, y) =>
      if x == 0 or y == 0 { maincolor }
      else { maincolor.lighten(90%) },
    inset: 10pt,
  )
  
  show table.cell: it => {
    if it.x == 0 or it.y == 0 {
      set text(white)
      strong(it)
    } else {
      it
    }
  }
  
  // -----------------------
  // figures 👻
  // -----------------------
  
  show figure.caption: it => [
    #vs(0.3)
    *#it.body*
  ]
  
  // -----------------------
  // lists ✅
  // -----------------------
  
  set list(
    marker: ([•], [‣]),
    spacing: 1.2em
  )
  
  set enum(
    numbering: "1.",
    spacing: 1.2em
  )

  // -----------------------
  // headings 🗿
  // -----------------------

  set heading(outlined: false)

  [
    #text(20pt)[= Chapitre #chapter]
  
    #vs(-0.7)
    
    #text(18pt, maincolor)[ == #title ]
    
    #vs(1)
  ]

  set heading(
    numbering: "1.1.1. ",
    outlined: true
  )
  
  show heading: set text(maincolor)
  show heading: set block(spacing: 1.3em, sticky: true)

  // -----------------------
  // table of contents 📝
  // -----------------------

  show outline.entry: set block(above: 1.2em)

  outline(
    title: none,
  )

  vs(1)

  doc
}

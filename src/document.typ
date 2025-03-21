#import "./utils.typ": *

// -----------------------
// document 🖨️
// -----------------------

#let document-init(
  title: [],
  subtitle: [],
  chapter: 0,
  lang: "en",
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

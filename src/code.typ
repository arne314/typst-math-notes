#import "./utils.typ": *

// see: https://typst.app/universe/package/fontawesome
#import "@preview/fontawesome:0.5.0": *

// see: https://typst.app/universe/package/codly
#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.1": *

// -----------------------
// codly 💻
// -----------------------

#let init-code() = {
  show: codly-init.with()

  codly(
    languages: (
      python: (name: " Python", icon: fa-python(), color: orange),
    ),
    inset: 3pt,
    zebra-fill: maincolor.lighten(90%),
  )
}

// see: https://typst.app/universe/package/cetz
#import "@preview/cetz:0.3.2": *

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

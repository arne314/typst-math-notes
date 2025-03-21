// see: https://typst.app/universe/package/mannot
#import "@preview/mannot:0.2.1": *

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


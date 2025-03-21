#import "./src/code.typ": *
#import "./src/document.typ": *
#import "./src/localization.typ": *
#import "./src/mannot.typ": *
#import "./src/theorems.typ": *

#let note(
  title: [],
  subtitle: [],
  chapter: 0,
  lang: "en",
  body,
) = {
  init-code()
  init-localization(lang)
  document-init(title: title, subtitle: subtitle, chapter: chapter, lang: lang, body)
}


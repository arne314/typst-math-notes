#import "template.typ": note
#import "chapters/entries.typ": *

#let chapter = 1

#show: note.with(
  title:    chapters.at(chapter - 1).title,
  subtitle: chapters.at(chapter - 1).subtitle,
  chapter:  chapter,
  lang: "fr"
)

#include "chapters/" + chapters.at(chapter - 1).filename + ".typ"

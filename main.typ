#import "template.typ": *
#import "chapters/entries.typ": *

#let chapter = 1

#show: doc.with(
  title:    chapters.at(chapter - 1).title,
  subtitle: chapters.at(chapter - 1).subtitle,
  chapter:  chapter,
)

#include "chapters/" + chapters.at(chapter - 1).filename + ".typ"

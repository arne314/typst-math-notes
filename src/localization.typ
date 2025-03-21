// -----------------------
// translation 🌍
// -----------------------

#let current-lang = state("current-lang", "en")

#let translations = (
  de: (
    axiom:      "Axiom",
    definition: "Definition",
    theorem:    "Satz",
    lemma:      "Lemma",
    corollary:  "Korollar",
    exercice:   "Übung",
    proof:      "Beweis",
    example:    "Beispiel",
    solution:   "Lösung",
  ),
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

#let get-translation(key) = {
  return context translations.at(current-lang.get()).at(key)
}

#let init-localization(lang) = {
  current-lang.update(lang)
}



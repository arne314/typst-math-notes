#import "../template.typ": *

Dans ce chapitre, #K désigne l'un des corps #R ou #C.

= Espaces vectoriels normés

#definition("Espace vectoriel normé")[
  Soit $E$ un $#K$-espace vectoriel. On appelle *norme* sur $E$ toute application $norm(dot)$ de $E$ dans $#R^+$ vérifiant les propriétés suivantes :

  - $forall x in E, #hs(0.4) norm(x) = 0 <=> x = 0_E$ _(séparation)_
  - $forall x in E, #hs(0.4) forall λ in #K, #hs(0.4) norm(lambda x) = abs(lambda) times norm(x)$ _(homogénéité)_
  - $forall x, y in E, #hs(0.4) norm(x + y) <= norm(x) + norm(y)$ _(inégalité triangulaire)_

  Le cas échéant, le couple $(E, #hs(0.3) norm(dot))$ est appelé un *espace vectoriel normé*.
]

Les couples $(#R, abs(dot))$ et $(#C, abs(dot))$ sont des espaces vectoriels normés et ce chapitre leur est consacré.

= Boules et sphères

Le vocabulaire des boules et des sphères évoque l'espace $#R^3$ plutôt que la droite #R et le plan #C, mais l'usage de ces mots est aujourd'hui fixé en topologie et utilisé dans tout espace vectoriel normé indépendamment de la dimension. Pour tous $a in #K$ et $r > 0$, on appelle :

- *boule ouverte de centre $a$ et de rayon $r$* l'ensemble
$ cal(B)(a, r) = {x in #K | abs(x - a) < r} $

- *boule fermée de centre $a$ et de rayon $r$* l'ensemble
$ cal(overline(B))(a, r) = {x in #K | abs(x - a) <= r} $

- *sphère de centre $a$ et de rayon $r$* l'ensemble
$ cal(S)(a, r) = {x in #K | abs(x - a) = r} $

#important[
  Les boules fermées de rayon $0$ sont autorisées, ce sont des *singletons* : $ cal(overline(B))(a, 0) = cal(S)(a, 0) = {a} $
]

#info[
  On a représenté ci-dessus des boules dans #C et on représentera souvent les objets dans #C plutôt que dans #R dans ce chapitre, mais les boules ne sont jamais que des *intervalles* dans #R : 
  $ cal(B)(a, r) = #hs(0.3) ]a - r, a + r[ #hs(1) #text[et] #hs(1) cal(overline(B))(a, r) = [a - r, a + r] $
]

= Voisinages

#definition("Voisinage d'un point")[
  Soit $a in #K$. On appelle voisinage de a *toute partie de #K contenant une boule ouverte de centre* $a$. On notera parfois $cal(V)_#K (a)$ l'ensemble des voisinages de $a$ dans #K, mais la notation n'est pas universelle.
]

Nous n'aurons pas de voisinages de $plus.minus oo$ dans R dans ce chapitre car nous nous efforçons de comprendre ce que #R et #C ont de commun d'un point de vue topologique.

#theorem("Propriétés des voisinages")[
  + Pour tout $a in #K$, toute intersection *FINIE* de voisinages de $a$ est un voisinage de $a$ ;

  + Deux points distincts de #K possèdent des voisinages disjoints. En d'autres termes, pour tous $a, b in K$ distincts, il existe un voisinage $cal(V)_a$ de $a$ et un voisinage $cal(V)_b$ de $b$ pour lesquels $cal(V)_a inter cal(V)_b = emptyset$.
]

#proof[
  + Soient $a in #K$ et $cal(V)_1, dots, cal(V)_k$ des voisinages de $a$. Pour tout $i in [|1, k|]$, il existe un réel $r_i > 0$ pour lequel $cal(B)(a, r_i) subset cal(V)_i$, donc $cal(B)(a, r_0) subset cal(V)_1 inter dots inter cal(V)_k$ pour $r_0 = min{r_1, dots, r_k} > 0$, ainsi $cal(V)_1 inter dots inter cal(V)_k$ est un voisinage de $a$.

  + Soient $a, b in #K$. #hs(0.1) Pour $r = abs(a - b) / 3 > 0$, #hs(0.1) $cal(B)(a, r)$ est un voisinage de $a$, #hs(0.1) $cal(B)(b, r)$ est un voisinage de $b$, et bien sûr $cal(B)(a, r) inter cal(B)(b, r) = emptyset$.
]

== #lorem(10)

#axiom(lorem(10))[#lorem(50)]
#lemma(lorem(10))[#lorem(50)]
#corollary(lorem(10))[#lorem(50)]
#caution[#lorem(50)]
#tip[#lorem(50)]
#remark[#lorem(50)]

= Équations homogènes du second ordre

#figure(
  table(
    columns: (auto, auto, auto),
    table.header(
      [], [Racines de $X^2 + a X + b$], [Forme des solutions],
    ),
    $ Delta > 0 $, [$r$ et $r'$], $ x --> lambda e^(r x) + lambda' e^(r'x) $,
    $ Delta = 0 $, $ r $, $ x --> (lambda x + mu)e^(r x) $,
    $ Delta < 0 $, $ r plus.minus omega $, $ x --> e^(r x) (lambda cos(omega x) + mu sin(omega x)) $
  ),
  caption: [Équations homogènes $y′′ + a y′ + b y = 0$ pour $#K = #R$]
)

= Codly

#figure(
  ```python
    def fib(n):
      if n <= 1:
        return n
      else:
        return fib(n - 1) + fib(n - 2)
    print(fib(25))
  ```,
  caption: [Calcul du $n$-ième terme $F_n$ de la suite de Fibonacci]
)

= Cetz

#figure(
  canvas({
    import draw: *
  
    ortho(y: -30deg, x: 30deg, {
      on-xz({
        grid((0,-2), (8,2), stroke: gray + .5pt)
      })
  
      let wave(amplitude: 1, fill: none, phases: 2, scale: 8, samples: 100) = {
        line(..(for x in range(0, samples + 1) {
          let x = x / samples
          let p = (2 * phases * calc.pi) * x
          ((x * scale, calc.sin(p) * amplitude),)
        }), fill: fill)
  
        let subdivs = 8
        for phase in range(0, phases) {
          let x = phase / phases
          for div in range(1, subdivs + 1) {
            let p = 2 * calc.pi * (div / subdivs)
            let y = calc.sin(p) * amplitude
            let x = x * scale + div / subdivs * scale / phases
            line((x, 0), (x, y), stroke: rgb(0, 0, 0, 150) + .5pt)
          }
        }
      }
  
      on-xy({
        wave(amplitude: 1.6, fill: rgb(0, 0, 255, 50))
      })
      on-xz({
        wave(amplitude: 1, fill: rgb(255, 0, 0, 50))
      })
    })
  }),
  caption: [🏄]
)

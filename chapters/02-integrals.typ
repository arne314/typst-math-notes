#import "../template.typ": *

= Intégration par parties

#definition("Intégration par parties ou IPP")[
  Soient $f, g in cal(C)^1(I, #C)$ et $a, b in I$, nous avons
  $ integral_a^b f'(x)g(x) dif x = [f g]_a^b - integral_a^b f(x)g'(x) dif x $
]

#important[
  Ce sont les fonctions $f$ et $g$ à l'intérieur du crochet qui doivent être de classe $cal(C)^1$, pas les fonctions $f'$ et $g$ qu'on a au départ dans l'intégrale de gauche.
]

#proof[
  Comme $f$ et $g$ sont de classe $cal(C)^1$, les fonctions $(f g)'$, $f'g$ et $f g'$ sont continues, donc d'après le théorème fondamental du calcul intégral et par linéarité de l'intégrale nous avons
  $ [f g]_a^b = integral_a^b (f g)'(x) dif x = integral_a^b (f'(x)g(x) + f(x)g'(x)) dif x = integral_a^b f'(x)g(x) dif x + integral_a^b f(x)g'(x) dif x $
]

#example[
  $
    integral_0^pi t cos t dif t #hs(0.6) &= integral_0^pi frame(tag: #<cos>, cos t, maincolor) #hs(0.3) dot #hs(0.3) frame(tag: #<t>, t, red) #hs(0.2) dif t = #hs(0.6) frame(tag: #<ipp>, [t sin t]_(t = 0)^(t = pi) #hs(0.3) - integral_0^pi sin t dif t, orange) #hs(0.6) = - integral_0^pi sin t dif t = - [- cos t]_(t = 0)^(t = pi) = -2
    
    #label(<cos>)[$f'(t)$]
    #label(<t>)[$g(t)$]
    #label(<ipp>, yshift: .7em)[$[f g]_a^b - integral_a^b f(x)g'(x) dif x$]
  $
]

#info[
  On peut faire des intégrations par parties sur des intégrales sans borne inférieure. La formule prend dans ce cas la forme suivante :
  $ frame(integral^x f'(t)g(t) dif t = f(x)g(x) - integral^x f(t)g'(t) dif t, red) $
]

= Changement de variable

#theorem("Changement de variable")[
  Soient $phi in cal(C)^1(I, #R)$ à valeurs dans $J$ et $f in cal(C)(J, #C)$ ainsi que $a, b in I$, nous avons
  $ integral_a^b f(phi(t))phi'(t) dif t = integral_phi(a)^phi(b) f(x) dif x $
]

#exercise("Utilisation de l'exponentielle complexe")[
  Calculer grâce à l'exponentielle complexe l'intégrale 
  $ integral_0^pi e^t sin(3t) dif t $
][
  Nous avons
  $ sin(3t) = (e^(3i t) - e^(-3i t)) / (2i) $
  ce qui permet d'écrire :
  $ 
  integral_0^pi e^t sin(3t) dif t = integral_0^pi e^t [(e^(3i t) - e^(-3i t)) / (2i)] dif t #hs(0.5) &= integral_0^pi (e^(t + 3i t) - e^(t - 3i t)) / (2i) dif t \ 
  &= integral_0^pi (e^(t + 3i t)) / (2i) dif t #hs(0.3) - integral_0^pi e^(t - 3i t) / (2i) dif t \ 
  &= 1/(2i) [integral_0^pi e^(t + 3i t) dif t #hs(0.3) - integral_0^pi e^(t - 3i t) dif t] \
  &= 1/(2i) ([e^(t(1 + 3i)) / (1 + 3i)]_0^pi - #hs(0.4) [e^(t(1 - 3i)) / (1 - 3i)]_0^pi) \
  &= 1/(2i) ((1 + e^pi) / (1 - 3i) - (1 + e^pi) / (1 + 3i)) \
  &= 3/10 (1 + e^pi) tilde.eq 7.24
  $
]

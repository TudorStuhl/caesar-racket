# caesar-racket
A Computer Science project in 12th grade that visualizes concepts of functional programming in a caesar-encryption implementation.

This project is made for a 12th grade presentation that replaces an exam. The presentation aims at introducing the class into functional programming and visualizing some of its key conceps by implementing a familiar algorithm in racket.

[Concepts of functional programming that this project covers](Concepts.md)

[Racket Documentation](https://docs.racket-lang.org/)

[Caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher)

## Disclaimer
The main code does not always necessarily use the best/easiest implementations, since the goal is not to simply implement the ceasar cipher but to depict the usage of several concepts of functional programming.

## Functionality
The algorithm decomposes a string into a list of characters which then each get converted into an index of the corresponding letter of the alphabet. This index gets shifted and afterwards converted back to a character, resulting in a list of new characters. Those then get composed back into a string. Since recursion is a key concept of functional programming, however not needed in this context, racket's "index-of"-function gets rebuilt in [caesar-recursion.rkt](caesar-recursion.rkt) to include this concept.

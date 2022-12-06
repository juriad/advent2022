# Progress

Each day I use a different programming language.

## Day 1 - Simula

Simula feels a lot like Pascal with its `begin` and `end`.
The language has a pretty decent PDF documentation.
I mainly struggled with the IDE; yes the modern distribution comes with an IDE which was pretty hard to use.
The only benefit was highlighting keywords.
The compiler is moody, does not work in all situations especially when standard input was needed.

The task was trivial; I mostly just fought with the language.
I wanted to start the program from the command line instead of the IDE.

## Day 2 - Genie

I chose Genie because I tried a few languages before it and none worked - compilation problems mostly.
Genie is a pretty ugly language.
It does not have much of documentation but has lots of possibilities due to its binding and Vala ecosystem.
I fought with passing two dicts to a function - there were too many commas.

The task itself was fine.
I expected bigger deviation and search through the space of all options, but it is just the second day.

## Day 3 - BQN

BQN tries a lot - has a great documentation, it is easy to install, may even be readable after some practice.
But the language is hard to write casually - I ended up copying individual characters.
Its REPL was nice as well the ease of working with input and output.
I struggled most in how to calculate an intersection but luckily there were examples.
I mostly missed a `filter` function as a counterpart to `map`.

The task was screaming - use arrays of characters, so I sed an array-based language.
Not dealing with cycles was refreshing.

## Day 4 - Chapel

Chapel is nice language with intuitive syntax and many features.
The documentation was a bit confusing - hard to find which procedures exist for range or how to write if statement.
The built-in support for ranges and tuples was very appreciated as well as the way `coforall` reduces its result.

It looked like the type of task that can use some map-reduce.
The language that I chose supports it natively, so task was easy.

## Day 5 - Neko

Being embeddable and considering itself a competition of Lua, I expected a bit more.
Some parts are not well (or at all) described - how to use `$loader`.
In the end I just needed one function from the standard library - `file_contents`.
I had to dig through the source code to find how to get it.
The documentation covers a good bit of the language but more examples would be welcomed.

This is significantly harder than the previous tasks.
Parsing input took way too long because I had to traverse the whole string character by character.
The actual algorithm (even second part) were then easy.
I was even surprised that that is it in the end.

## Day 6 - Seed7

A very verbose language with clear syntax (although you can define your own extension).
Its documentation is well-structured and full of examples.
Some of the declarations were annoying and error-prone.
The compiler pointed at the errors but failed to explain clearly what is going on.

The task was easy.
I was getting behind and worried that something more intensive like yesterday could come.
My original implementation trivially used 6 inequalities but I had to rewrite it to a function with loops.

# Lists

## Language pool

- ABC
- Algol
- Alice
- AmbientTalk
- AMPL
- Assembly language
- ATS
- BCPL
- BeanShell
- BETA
- Boo
- C--
- C#
- Carbon
- CDuce
- Cilk
- CLIPS
- CLU
- Closure
- CoffeeScript
- Comal
- Constraint Handling Rules
- Cool
- Csh
- Cuneiform
- Cyclone
- E
- eC
- Eel
- Elixir
- Elm
- Euphoria
- Ezhil
- F#
- F*
- Fetlang
- Fish
- Fleng
- FlooP
- Futhark
- Gambas
- Gri
- Hamler
- Harbour
- High Level Assembly
- Hume
- Hy
- Icon
- Idris
- Ivy
- J
- J#
- K
- Ksh
- Limbo
- LogTalk
- LoLa
- m4
- ML
- Modula
- MoonScript
- Mouse
- Nemerle
- Nial
- Nickel
- Nu
- o:XML
- Occam
- Oxygene
- Oz
- ParaSail
- Pico
- PicoLisp
- Pizza
- Processing
- rc
- Rebol
- ReasonML
- Ring
- S#
- S-Lang
- SAC
- Sather
- SETL
- Solidity
- Standard ML
- Swift (parallel scripting language)
- Tea
- TeX
- TXL
- TypeScript
- Umple
- Unison
- Whiley
- WolframScript
- Wyvern
- X10
- xHarbour
- Xtend
- Zsh

## Used languages

- Ada
- APL
- AWK
- Ballerina
- Bash
- (Free)Basic
- BC
- BQN
- C
- C++
- Ceylon
- Chapel
- Cobol
- Cobra
- ColdFusion Markup Language (CFML)
- Concurnas
- Crystal
- D
- Dart
- Dylan
- Eiffel
- Erlang
- Factor
- Fantom
- Flix
- Forth
- Fortran
- Genie
- Go
- Golo
- Gosu
- Groovy
- Haskell
- Haxe
- Io
- Java
- JavaScript
- jq
- JudoScript
- Julia
- Kotlin
- LDPL
- (Common)Lisp
- (UCB)Logo
- Lua
- Matlab (Octave)
- Mercury
- Minizinc
- Neko
- Nim
- Objective-C
- OCaml
- OSTRAJava
- (Free)Pascal
- Perl
- PHP(7)
- PostScript
- Powershell
- (SWI)Prolog
- PureScript
- Python
- R
- Racket
- Raku
- Red
- Rexx
- Ruby
- Rust
- Scala
- Sed
- Seed7
- Simula
- SNOBOL
- SQL
- Squirrel
- Swift
- TCL
- Vala
- Vim Script
- XSLT
- Yeti
- Yoix
- Zig

## Missing letters

- Q
- U
- W

## Banned languages

- Self - does not have 64bit distribution
- XQuery - not powerful enough
- Pony - ld: unrecognised emulation mode: cx16
- Oberon - cannot compile standard library
- Goby - Does not have documentation (404)
- Smalltalk - Could start GUI but could not do anything; poor documentation maybe
- Scratch, Snap! - Cannot be run from a command line
- Oz, Mozart - incompatible with Boost 1.7
- FoxPro - not for Linux
- ActionScript - Cannot be downloaded
- Pure - requires different version of LLVM which fails to compile
- Eta - too close to Haskell on JVM
- Joy - does not compile, almost no documentation
- Whiley - could not make the example to work; it does not produce a class file
- Kit - discontinued, crucial parts of documentations are missing
- Snowball - not really a programming language
- Unicon - cannot compile
- Jelly - not standalone language
- Miranda - fails to build
- Noop - you can't code anything interesting in Noop yet

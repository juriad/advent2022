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

## Day 7 - Ivy

Ivy is a very simple language with a pretty decent single-page documentation.
It is minimalistic but supports everything that I needed.
There was an issue with building the it but that was solved.
The small input works well but the big one segfaults unless I keep some `print`s in the code.
I liked that `print` could handle recursive structures.
I could not make `match` work at all and there were no tests for it.

I was worried that I will need some parsing but simple comparison of fixed (sub-)strings was enough.
Propagating the `size` up the tree turned out to be a good idea which made the final searches easy.

## Day 8 - Nial

Nial is an array processing language.
It is easier to use than BQN because its script uses regular characters.
It does not have such advanced operators.
Sometimes it gave errors that were hard to read - I resorted to rewriting the offending line.
The comments do not work as I would expect - it looks like they somehow affect the lines before/after.

I liked the first tasks; it was an easy application of maximum to a 2D array.
The second task forced me to write a new operator which was fun.

## Day 9 - Ring

I really wanted a language that can represent a set; Ring satisfied that.
Ring is a pretty easy language with a decent documentation.
Although it makes itself a bit confusing by allowing multiple styles.
I was surprised how slow it was.
I missed a note in the documentation that there may not be any global code after a definition of a function.

The hardest part was to pick a language that would support everything I needed.
The task is then just a bunch of ifs and for loops.
The first part was implemented without definition of any function.
I had to introduce them later; the generalization was nice.

## Day 10 - S-Lang

Today I found hard to find a language to choose; I am running out of them.
S-Lang language has quite a pleasant syntax and good documentation.
I had issues finding the list of builtin (intrinsic) functions but Google helped.

Another emulation of instructions?
I hoped there will not be any such tasks this year.
When reading that the second part is about drawing pictures I was a bit worried.
But it turned out to be easy, just debugging off-by-one errors.

## Day 11 - Boo

I wanted an object-oriented language that can represent lists.
Boo runs on top of .Net (Mono).
Its syntax is simplified to make it look like Python.

Both parts were entertaining; I liked the need to represent the monkeys and parsing the input.
The second part made my choice of language extra beneficial.
And the bit of algebra was very satisfying.

## Day 12 - (Open)Euphoria

The language is pretty neat, has a minimalistic set of data types.
All its constructs are easy to use.
It has decent documentation.
The compiler shows reasonable error messages.

I wanted to implement a more sophisticated algorithm but BFS could do it as easily.
The second part was pleasant, just look at the problem from the other side.

## Day 13 - TXL

What a ride.
This language is unlike any other that I tried before.
It is based on grammars and transformations.
It has a good documentation in PDF.

It was a roller-coaster of easy and hard bits - always hard where they were not expected.
Parsing input - totally easy; algorithm for comparison - hard, recursion - easy, indexing and summing result - hard.
In the second part; introduction of markers and sorting - easy and computing product - hard.

## Day 14 - SETL

Being behind meant that I need a more high-level language.
SETL looked like having nice primitives and it even had a decent standard library.
I liked tuple and set semantics, compound operators.

I immediately recognized the task from years ago and remembered how long it took me to debug it.
This time, the solution was much more straightforward.
The second part made me worried for a minute - that is how long the program was running.

## Day 15 - Gambas

Gambas is a dialect of Basic but because I did not remember Basic much and there are clear differences, I considered it.
The language has a decent but badly structured documentation - hard to find its syntax.
The compiler was not very helpful with errors.

Immediately when I saw the task I worried that I'll need to work with intervals in 2D.
Even in 1D the data structure for unioning of intervals required some thinking.
Luckily, the second part could be easily brute-forced in just 46 seconds.

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
- C--
- C#
- Carbon
- CDuce
- CLIPS
- CLU
- Closure
- CoffeeScript
- Comal
- Constraint Handling Rules
- Csh
- Cuneiform
- Cyclone
- E
- Elixir
- Elm
- F#
- F*
- Fetlang
- Fish
- Fleng
- FlooP
- Futhark
- Hamler
- Harbour
- High Level Assembly
- Hy
- Icon
- Idris
- Ivy (there are multiple)
- J
- J#
- K
- LogTalk
- LoLa
- m4
- ML
- Modula
- MoonScript
- Mouse
- o:XML
- Occam
- Oxygene
- Oz
- Pico
- PicoLisp
- Pizza
- rc
- Rebol
- ReasonML
- S#
- SAC
- Solidity
- Standard ML
- Swift (parallel scripting language)
- TeX
- TypeScript
- Umple
- Unison
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
- Boo
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
- (Open)Euphoria
- Erlang
- Factor
- Fantom
- Flix
- Forth
- Fortran
- Gambas
- Genie
- Go
- Golo
- Gosu
- Groovy
- Haskell
- Haxe
- Io
- Ivy (jhallen)
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
- Nial
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
- Ring
- Ruby
- Rust
- Scala
- Sed
- Seed7
- SETL
- Simula
- S-Lang
- SNOBOL
- SQL
- Squirrel
- Swift
- TCL
- TXL
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
- Cilk - just a library for C++ which adds parallelism
- Gri - can only work with constant memory
- Hume - only on archive
- Processing - just a Java "library"
- Limbo - language for Inferno operating system
- Nu - could not figure out input
- Eel - incomplete and outdated
- Sather - no doc how to work with strings
- Ksh - too close to a regular Shell/Bash
- Whiley - cannot handle input
- Cool - school course, does not exists
- eC - almost no documentation
- ParaSail - could not figure out standard library (input)
- Tea - archived; does not have documentation
- Nickel - configuration, does not have input
- Ezhil - non ascii, non English
- Nemerle - Mono crashes
- Futhark - unusable input

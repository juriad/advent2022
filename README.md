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

## Day 16 - E

It took a while to choose a language.
I wanted one that hsa constant access to an element of a list.
The biggest issue I encountered with E was the assignment operator `:=` which I kept misspelling.

The task asked for multi-source-multi-target shortest path computation to avoid visiting intermediate valves.
The algorithm itself was them pretty easy.
The second part required much more scheduling of visits and potential non-visits.
I ran the program for a few minutes and it did not finish.
After some optimizations and having started to rewrite it to Java, it finally finished in 55 minutes.

## Day 17 - Icon

Icon introduces the notion of success and failure, and makes them common primitives that the programmer shall use.
I did not see the appeal of them, nor of generators and nulls.
Icon's documentation is sparse but the linked books (PDF) are very useful to fill the gaps. 

I wished so much for a language with bitwise operators/functions.
The task is so natural to implement in terms of them.
The second part of the task was no surprise; this theme repeats every year.

## Day 18 - Standard ML

The language feels easy but has a lot of surprises.
It does not have composition operators and especially `$` that in Haskell helps avoiding lots of parentheses.
On the other hand being white-space independent was better than the rather complicated rules in Haskell.
The standard library had everything I needed and foremost it had arrays.

I am running out of languages and so I had to find one which supports arrays because indexing lists may be slow.
I am not entirely satisfied with the solution of the second task.
It feels too brute-forcey - I wished for something more clever than just flooding the 3D array.

## Day 19 - Unison

Unison has a nice concept of separating names from the actual code which makes it suitable for distributed setups.
The documentation is good, the standard library as well.
The online UI could be faster but it is easy to run one locally.

What a ride this was.
Describing the domain was easy, writing the DFS search was also.
But the program was slow; some estimates were in days of runtime than minutes.
Lots of optimizations (and hard-coding constants) made it work.
It is still slow; the second task alone takes 217 minutes.

## Day 20 - MoonScript

Vaguely remembering Lua and its verbosity, this language seamed interesting.
Its documentation is focused on differences from Lua and does not describe most standard functions.
Some rules about indentations or multiple different syntaxes felt weird when I was reading about them.
Using them felt more natural; only rarely I had to go back to documentation.

This task asked for a languages which can model references.
For that reason, it would be pretty hard to solve in most functional languages.
The task was vague about placement of the value when it wraps and becomes first/last.
Luckily it did not matter because the result was defined relative to another value.
The second part only required minor changes and realization that we need to subtract 1.

## Day 21 - PicoLisp

PicoLisp is just a regular Lisp but its simplistic implementation changes your mindset.
Programming was comfortable; I missed more advanced tools from modern functional languages such as pattern matching.

I was wondering whether this task can be solved in a functional fashion without some graph structures.
Iterating through all equations and gradual simplification worked pretty well.
It was not fast but 14 seconds was not bad.
The second part required some "algebra".

## Day 22 - Algol 68

The language is verbose (although there are ways to write in a bit denser way).
It has weird terminology from today's perspective but in the end supports everything.
I gave up on reading from a file and used standard input instead.
The way how variables are in fact references to memory is interesting.

My first implementation simply traversed through an array of lines.
That worked bt was not feasible for the second task.
I needed to reimplement it to work with faces and define transition over edged which contained quite a few errors.

## Day 23 - Elixir

Elixir is a fine modern language with good documentation and rich standard library.
Its functional aspect was pleasant in comparison to Standard ML.

I liked the task; it took me a bit to find a language that can access an element of a map in constant time.
The second part was an expected extension.

## Day 24 - Closure

I heard praise about Closure - how cleverly it bring together the List and JVM world.
To me it felt like a chore to use it.
Syntax - mainly `let` is too verbose; I liked other languages where simply the last expression of a block is returned.
The support for transient structures was welcomed.

Another maze puzzle with the standard tricks - pruning and memorization.
The second part required just minor changes in structure representation because the start and end became parameters.

## Day 25 - Rebol

Rebol is a simplistic language that is pleasant to use.
I like how much you can do with a few syntactic means - blocks.
The call convention of functions is pleasant as are optional arguments (aka refinements).
Rebol does not handle large integers but luckily all arithmetics works well even with decimals.

The task was tricky; it required reevaluating how number systems work.
The decoding is pretty simple but encoding requires a bit of a though. 

# Lists

## Language pool

- Assembly language
- C#
- CDuce
- CLIPS
- CoffeeScript
- Constraint Handling Rules
- Csh
- Elm
- F#
- F*
- Fetlang
- Fish
- Fleng
- FlooP
- Harbour
- High Level Assembly
- Hy
- J
- K
- LogTalk
- m4
- Mouse
- o:XML
- Occam
- Oz
- Pizza
- rc
- Swift (parallel scripting language)
- TeX
- TypeScript
- Umple
- WolframScript
- xHarbour
- Xtend

## Used languages

- Ada
- Algol 68
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
- Closure
- Cobol
- Cobra
- ColdFusion Markup Language (CFML)
- Concurnas
- Crystal
- D
- Dart
- Dylan
- E
- Eiffel
- Elixir
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
- Icon
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
- MoonScript
- Neko
- Nial
- Nim
- Objective-C
- OCaml
- OSTRAJava
- (Free)Pascal
- Perl
- PHP(7)
- PicoLisp
- PostScript
- Powershell
- (SWI)Prolog
- PureScript
- Python
- R
- Racket
- Raku
- Rebol
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
- Standard ML
- Swift
- TCL
- TXL
- Unison
- Vala
- Vim Script
- XSLT
- Yeti
- Yoix
- Zig

## Missing letters

- Q
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
- SAC - poor documentation, crashing compiler
- LoLa - cannot build
- Carbon - not ready for use
- Cyclone - only 32bit
- Oxygene - non-free
- Cuneiform - no documentations
- BETA - no download, discontinued
- BeanShell - fails with NPE
- S# - cannot find it again
- AMPL - non-free
- C-- - no input/output
- X10 - cannot compile - cannot find type Array
- Comal - cannot build OpenComal
- Pico - too weak input
- Ivy (for Bitcoin) - no input/output
- Solidity - no input/output
- Zsh - just a shell
- AmbientTalk - not much of input, cannot work with files
- Alice - dialect of Standard ML
- ML - just a family of languages
- Modula-2 - does not download
- J# - discontinued
- Wyvern - too poor documentation
- Hamler - did not manage to build
- ReasonML - not even tutorial can be build
- ABC - cannot make work with termcap/curses
- ATS - cannot install
- BCPL - almost no documentation; cannot find how to do input
- CLU - cannot make run
- Idris - version 2 is incomplete, version 1 does not run (missing library)

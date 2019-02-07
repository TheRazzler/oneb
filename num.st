"Defining a Num object which is a subclass to the Magic object
 found in my.st."
Magic sub: #Num has: 'n mu m2 sd id lo hi txt w'

"Initialize all the variables. I left out the text part because
 it doesn't seem to do anything. Can be added back in later easy."
!Num methodsFor: 'Initialization'!
init
  n := 0.
  mu := 0.
  m2 := 0.
  sd := 0.
  lo := -1 * 10 raisedTo: 32.
  hi := 10 raisedTo: 32.
  w = 1.
!!

!Num methodsFor: 'Messing with numbers'!
"Basically just follows the pseudocode exactly. d is a local
 vairable and t is self. The only variable actually passed in
 is x."
numInc: x
    | d |
    (x = '?') ifTrue: [^x].
    n := n + 1.
    d := x - mu.
    mu := mu + (d / n).
    m2 := m2 + (d * (x - mu)).
    (x > hi) ifTrue: [hi := x].
    (x < lo) ifTrue: [lo := x].
    (n >= 2) ifTrue: [sd := (m2 / (n - 1 + (10 raisedTo: -32))) raisedTo: 0.5].
    ^x
!

numDec: x
  | d | 
  (x = '?') ifTrue: [^x].
  (n = 1) ifTrue: [^x].
  n := n - 1.
  d := x - mu.
  mu := mu - (d / n).
  m2 := m2 - (d * (x * mu)).
  (n >= 2) ifTrue: [sd := (m2 / (n - 1 + (10 raisedTo: -32))) raisedTo: 0.5].
  ^x
!

"Had to define a method for nextPutAll since that's what the test is.
 I figured it just runs through the list of numbers with a method and
 after some testing discovered the expected numbers matched numInc."
nextPutAll: numbers
    numbers do: [:x | self numInc: x].
!!
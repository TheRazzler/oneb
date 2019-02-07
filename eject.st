!Collection methods! 

"Defining a method in smalltalk that does the same thing as reject
 but using select. Reject takes a condition and removes all values 
 in a list that meet that condition. Select takes a condition and
 keeps only the values that meet that condition."
eject: aBlock
    "By reversing the condition defined as x by using the term 
     not, then the list returned by select should be the same 
     as the list returned by reject since they are virtually 
     opposites."
    ^self select: [:x | (aBlock value: x) not].
!!
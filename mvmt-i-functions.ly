\version "2.20.0"

rc =
#(define-music-function
  (apart together)
  (ly:music? ly:music?)
  #{
    \partcombineApart 
    #apart
    \partcombineUnisono 
    #together
   #})

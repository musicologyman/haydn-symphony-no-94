\version "2.20.0"


unisonoQuaverRest = {
  \partcombineUnisono r8
  \partcombineApart
}

globalExposition = {
  \once \override Score.RehearsalMark #'X-offset = #5
  \once \override Score.RehearsalMark #'Y-offset = #5
  \mark "Vivace assai"
  \time 6/8
  \partial 4.
}

ExpoI = {
  \globalExposition
  r4 r8
  R2. * 3
}

ExpoII = \relative g, {
  \override Beam.auto-knee-gap = #1
  \override Beam.positions = #'(-0.5 . -0.5)
  g8 \f g' g g g g 
  \repeat unfold 2 { g, g' g g g g }
  \repeat unfold 8 { g, g' g }
  g, r g' g, r g' |
  g, r g' g, r r |
  \revert Beam.auto-knee-gap
  \revert Beam.positions
}

fluteExpoI = {
  g8 \f g16 (fis g a) b4 r8
  b8 b16 (a b c) d8-. b-. g-. |
  e'-. c-. a-. fis-. a-. d,-. |
  g4. a |
  g a |
  \repeat unfold 2 { g8 g g a4 r8 }
  g8 r a [(b)] r a
  (b) r8 a [(b)] r8 g16 (a) |
  b4. \sf g |
  fis8 fis fis fis4 r8 |
  d'8 d d d4 r8 |
  d,8 d d d4 r8 |
  c'8 c c c4 r8 |
}

bassoonExpoI = \relative g, {
   \ExpoI
   \ExpoII
   e'4. \sf a |
   \repeat unfold 2 {
     d,8 d d d d d
   }
   \repeat unfold 4 { 
     d4 r8
   }
}
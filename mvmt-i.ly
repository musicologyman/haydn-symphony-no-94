\version "2.18.2"

\include "../lilypond-page-sizes/paper-sizes.ily"

\header {
  tagline = ##f
}

\paper {
  #(set-paper-size "size 5.5-8.5")
  indent = .75 \in
  short-indent = 0.375 \in
}

#(set-global-staff-size 11.22)

globalIntro = {
  \once \override Score.RehearsalMark #'X-offset = #5
  \once \override Score.RehearsalMark #'Y-offset = #5
  \mark "Adagio cantabile"
  \key g \major
  \time 3/4
}

introTacet = {
  R2. * 17
}

introAI = {
  <<
    { d4 (g e) }
    { s4 \p \<  s8 \! s8 \> s4\! }
  >>
  d8. (e32 c) b8 r r4
}

introAII = {
  <<
    { b4 \p (e c) }
    { s4 \p \<  s8 \! s8 \> s4\! }
  >>
  b8. (c32 a) g8 r r4
}

introAIII = {
  <<
    { c2. ~ c4 }
    { s4 \p \< s8 \! s8 \> s4\! s }
  >>
  r r
}

fluteI = \relative d''' {
  \globalIntro
  R2. * 4
  \introAI|
  R2. * 5
  r4 r8
  <<
    {
      \partcombineApart g, (a bes)
      a8
    }
    % ADHOC
    % { s8 \p \< s4 s8 \! }
    { s4. s8 }
  >>
  \partcombineAutomatic r8 r4 r |
  R2. * 2
  \partcombineApartOnce
  <<
    { fis'2 }
    % ADHOC
    % { s2 \sf }
    { s2 }
  >>
  r4 |
  R2.
}

fluteII = \relative b'' {
  \globalIntro
  R2. * 4
  \introAII
  R2. * 5
  r4 r8 g, \p \< (a bes) |
  a8 \! r8 r4 r |
  R2. * 2
  fis'2 \sf r4 |
  R2.
}

oboeI = \relative d'' {
  \globalIntro
  d4 \p (g e) |
  d8. (e32 c) b8 r r4 |
  R2. * 2
  \introAI
  R2. * 5
  r4 r8 <<
    { \partcombineApart cis-. (cis-. cis-. ) d8 }
    % ADHOC
    % { s8 \p \< s4 s8 \! }
    { s8 s4 s8 }
  >>
  \partcombineAutomatic r8 r4 r |
  R2. * 2
  % <<
  %     c'2
  %     { s2 \sf }
  %   >>
  c'2 \sf
  r4
  R2.
}

oboeII = \relative b' {
  \globalIntro
  b4 \p (e c) |
  b8. (c32 a) g8 r r4 |
  R2. * 2
  \introAII
  R2. * 5
  r4 r8 e'-. \p \< (e-. e-. \! ) |
  d8 r r4 r
  R2. * 2
  a'2 \sf r4
  s2.
}

bassoonI = \relative d' {
  \clef tenor
  \globalIntro
  d4 \p (g e) |
  d8. (e32 c) b8 r r4 |
  R2. * 2
  \introAI
  \clef bass
  R2. * 3
  \partcombineApart r4 r8
  %ADHOC
  \once \override TextScript #'X-offset = #-1.5
  c-.^"I." (c-. c-. ) |
  f,4 r8 d'-. (d-. d-.) |
  g,4 r8 e'!-. \p \< (e-. e-. \! ) |
  a,4 \partcombineAutomatic r r |
  R2. * 2
  c2 \sf r4
  R2.
}

bassoonII = \relative b {
  \clef tenor
  \globalIntro
  b4 \p (e c) |
  b8. (c32 a) g8 r r4 |
  R2. * 2
  \introAII
  \clef bass
  R2. * 3
  \override MultiMeasureRest.staff-position = #-2
  R2.
  \override MultiMeasureRest.staff-position = #-2
  R2.
  R2.
  \revert MultiMeasureRest.staff-position
  a4 r r
  R2. * 2
  a2 \sf r4
  R2.
}

hornI = \relative c {
  \clef bass
  \time 3/4
  \transposition g'
  c2. \p ~
  c4 r r
  R2. * 2
  \introAIII
  \clef treble
  R2. * 6
  \transposition g
  g''2. ~ \f \>
  g ~ \p
  g8. g16 \f g4 r |
  g2 \sf r4
  R2.
}

hornII = \relative c, {
  \clef bass
  \time 3/4
  \transposition g'
  c2. \p ~
  c4 r r
  R2. * 2
  \introAIII
  \clef treble
  R2. * 6
  \transposition g
  g''2. ~ \f \>
  g ~ \p
  g8. g16 \f g4 r |
  g2 \sf r4
  R2.
}

trumpetI = \relative c' {
  \time 3/4
  \introTacet
}


trumpetII = \relative c' {
  \time 3/4
  \introTacet
}

timpani = \relative c{
  \time 3/4
  \introTacet
}

violinI = \relative g' {
  \globalIntro
  R2. |
  r4 r r8 g \p |
  fis (g) c (b a g) |
  d4 r r |
  R2.
  r4 r r8 fis \p |
  e (dis e) a (g fis) |
  \repeat unfold 2 {
    g-. ( g-. g-. g-. g-. g-. )
  }
  aes-. (aes-. aes-. a-. a-. a-. )
  bes-. (bes-. bes-. b-. b-. b-. )
  c-. ( c-. c-. \cresc cis-. cis-. cis-. )
  d-. \f d-. d-. bes' \p (fis g) |
  a (g fis! es d cis) |
  c!8. <c a'>16 \f <c a'>4 r |
  c'4. \sf fis,8 \p (a c, |
  e a,) c4 r
}

violinII = \relative d' {
  \globalIntro
  R2.
  r4 r r8 d \p |
  d4 a'8 (g e) e-. |
  d4. c8 (b a) |
  g4 r r |
  r r r8 g \p |
  g4. c8 (b a) |
  \repeat unfold 2 {
    g-. ( g-. g-. g-. g-. g-. )
  }
  aes-. (aes-. aes-. a-. a-. a-. )
  bes-. (bes-. bes-. b-. b-. b-. )
  c-. ( c-. c-. \cresc cis-. cis-. cis-. )
  \override Beam.auto-knee-gap = #1
  \override Beam.positions = #'(0 . -2)
  d-. \f d-. d-. d' \p (es d) |
  \revert Beam.auto-knee-gap
  \revert Beam.positions
  es (d c bes a g) |
  fis!8. fis16 \f fis4 r |
  <fis a>2 \sf r4 |
  R2.
}

viola = \relative d' {
  \clef alto
  \globalIntro
  R2. * 2
  \override Beam.auto-knee-gap = #1
  r8 d4 \p d8 (e) cis, |
  d4. a'8 (g fis) |
  g4 r r |
  r r r8 d' \p |
  c (b c) e (d c) |
  b4 r r |
  R2. |
  r4 r8 es (f ges) |
  f (d es f g aes) |
  g (e f \cresc g a! bes) |
  a-. \f fis!-. fis-. g \p (c! bes)
  c (bes a g fis! e!) |
  d8. c16 \f c4 r |
  <d, c'>2 \sf r4 |
  R2.
}

cello = \relative b {
  \clef bass
  \globalIntro
  R2.
  r4 r r8 b \p |
  c (b) fis (g c, cis) |
  d4 r r
  R2.
  r4 r r8 b \p |
  c (b c) a (d) d-. |
  g, r r4 r8 f' |
  \stemDown
  e (b c d es e) |
  \stemNeutral
  f4. ges8 (f es) |
  d (f g aes g f) |
  e! (g a! \cresc bes a g) |
  <<
    <<
      {
        fis8 d d d' (c bes)
        c (bes a g fis! e!)
        d8. d16 d4 d4\rest |
        d2 d4\rest |
      }
      \\
      {
        fis8 d d d d d
        d2.
        d8. d16 d4 s |
        d2 s4
      }
    >>
    {
      s4 \f s8 s8 \p s4
      s2.
      s8. s16\f s2 |
      s2. \sf
    }
  >>
  R2.
}


\score {
  <<
    \new StaffGroup <<
      \new Staff \with {
        instrumentName = "Flauti."
        shortInstrumentName = #"Fl."
      } \partcombine \fluteI \fluteII

      \new Staff \with {
        instrumentName = "Oboi."
        shortInstrumentName = #"Ob."
      } \partcombine \oboeI \oboeII

      \new Staff \with {
        instrumentName = "Fagotti."
        shortInstrumentName = "Fg."
      } \partcombine \bassoonI \bassoonII
    >>

    \new StaffGroup <<
      \new Staff \with {
        instrumentName = \markup {
          \center-column {
            \line { Corni }
            \line { in G. }
          }
        }
        shortInstrumentName = #"Cor."
      } \partcombine \hornI \hornII

      \new Staff \with {
        instrumentName = \markup {
          \center-column {
            \line { Trombe }
            \line {
              in C.
            }
          }
        }
        shortInstrumentName = "Tr."
      } \partcombine \trumpetI \trumpetII
    >>

    \new Staff \with {
      instrumentName = \markup {
        \center-column {
          \line { "Timpani" }
          \line { "in D.G." }
        }
      }
      shortInstrumentName = #"Timp."
    }\timpani

    \new StaffGroup <<
      \new GrandStaff <<
        \new Staff \with {
          instrumentName = "Violino I."
          shortInstrumentName = "Vln. I."
        } \violinI

        \new Staff \with {
          instrumentName = "Violino II."
          shortInstrumentName = "Vln. II."
        } \violinII
      >>

      \new Staff \with {
        instrumentName = "Viola."
        shortInstrumentName = "Vla."
      } \viola

      \new Staff \with {
        instrumentName = \markup {
          \center-column {
            \line { "Violoncello" }
            \line { "e Basso." }
          }
        }
        shortInstrumentName = \markup {
          \center-column {
            \line { "Vlc." }
            \line { "e Cb."}
          }
        }
      } \cello
    >>

  >>
  \layout { }
}
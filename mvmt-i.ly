\version "2.20.0"

\include "../lilypond-page-sizes/paper-sizes.ily"
\include "./mvmt-i-fragments.ly"
\include "./mvmt-i-functions.ly"

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

halfMeasureHairpin = {
  s8. \<  s8. \> \! |
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
  \once \partcombineApart
  <<
    { fis'2 }
    % ADHOC
    % { s2 \sf }
    { s2 }
  >>
  r4 |
  R2. 
  
  % exposition
  \repeat volta 2 {
    \ExpoI
    \fluteExpoI
  }
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

  %exposition

  \repeat volta 2 {
    \ExpoI
    \fluteExpoI
  }
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
  c'2 \sf
  r4
  R2. 
  
  % exposition
  \repeat volta 2 {
    \ExpoI
    g8 \f g16 (fis g a) b4 r8 |
    b8 b16 (a b c) d8-. b-. g-. |
    e4. fis |
    g fis |
    g fis |
    \repeat unfold 2 { g8 g g fis4 r8 } |

    % page 3 system 1
    \partcombineApart g8 
      \partcombineUnisono
      r 
      \partcombineApart
      fis [(g)] 
      \partcombineUnisono
      r 
      \partcombineApart
      fis
    (g8) \partcombineUnisono r
      \partcombineApart
      fis [(g)] \partcombineUnisono r
      \partcombineApart
      g16 (a) |
    <<
      { b4. cis4. }
      % ADHOC
      % { s2. \sf }
    >>|
    d8 d d d4 \partcombineUnisono r8
    \partcombineApart
    d, d d d4 \partcombineUnisono r8 |
    \partcombineApart
    c'! c c c4 \partcombineUnisono r8 |
    \partcombineApart
    d, d d d4 \partcombineUnisono r8
    \partcombineAutomatic
  }
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
  R2.  
  
  % exposition
  \repeat volta 2 {
    \ExpoI

    b,8 \f b16 (a b c) d4 r8

    % page 2 system 2
    g8 g16 (fis g a) b8-. g-. d-.
    c4. a
    b c
    b c
    b8 b b c4 r8
    b8 b b c4 r8

    % page 3 system 1
    b8 r c [(b)] r c
    (b) r c [(b)] r a |
    g4. \sf e |
    \repeat unfold 2 { fis8 fis fis fis4 r8 } |

    % page 3 system 2
    a'8 a a a4 r8 |
    fis fis fis fis4 r8
  }
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
  
  %exposition 
  \repeat volta 2 {
    \bassoonExpoI
  }
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
    
  %exposition 
  \repeat volta 2 {
   \bassoonExpoI
  }
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
  
  %exposition
  \repeat volta 2 {
      \ExpoI
      c8 \f c c c4 r8 |
      c8 c c c4 r8 |
      c4. d 
      e d 
      e d
      \repeat unfold 2 {
        e8 e e d4 r8
      }
      \rc e r
      \rc { d [(e)] } r 
      \rc { d (e) } r 
      \rc { d [(e)] } r
      \partcombineApart
      d
      \rc << c4 
         % ADHOC
         % {s4 \sf} 
      >> r8 \rc c4 r8 |
      \repeat unfold 2 { \rc { g8 g g g4}  r8 }
      
      % page 3 system 2
      \repeat unfold 2 { \rc { d' d d d4}  r8 }
  }
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
  
  \repeat volta 2 {
    \ExpoI
    e'8 \f e e e4 r8 |
    e8 e e e4 r8 |
    c4. g'
    c g
    c g
    \repeat unfold 2 {
      c8 c c g4 r8 
    }
    c r g [(c)] r g 
    (c) r g [(c)] r g |
    c,4 \sf r8 c4 r8
    \repeat unfold 4 { g'8 g g g4 r8 } 
    
  }
}

trumpetI = \relative d'' {
  \time 3/4
  \introTacet
  
  \repeat volta 2 {
    \ExpoI
    d8 \f d d d4 r8
    d8 d d d4 r8
    \partcombineApart
    e4. d
    \repeat unfold 2 { \rc d4 {r8 r4 r8 } }
    \repeat unfold 2 { \rc { d8 d d d4 } r8 }
    
    % page 3 system 1
    \repeat unfold 2 { \rc d r \rc { d [d] } r 
                       \partcombineApart d }
    \rc  
        <<
          g4
          % ADHOC
          % s4 \sf
        >> r8
     \rc g4 r8
     \repeat unfold 4 { \rc { d8 d d d4 } r8 }
    }
  }


trumpetII = \relative g' {
  \time 3/4
  \introTacet
  
  \repeat volta 2 {
    \ExpoI
    g8 \f g g g4 r8 |
    g8 g g g4 r8 |
    c4. d |
    g,4 r8 r4 r8 |
    g4 r8 r4 r8 |
    g8 g g d'4 r8 |
    g,8 g g d'4 r8 |
    
    % page 3 system 1
    g, r d' [d] r d |
    d r d [d] r d
    
    g,4 \sf r8 g4 r8
    \repeat unfold 2 { d'8 d d d4 r8 }
    \repeat unfold 2 { g,8 g g g4 r8 }
  }
}

timpani = \relative g, {
  \clef bass
  \time 3/4
  \introTacet
  
  % exposition
  \repeat volta 2 {
    \ExpoI 
    g8 \f g g g4 r8
    g8 g g g4 r8 |
    \repeat unfold 6 { g4 r8 }
    \repeat unfold 2 { g8 g g g4 r8 }
    
    % page 3 system 1
    g r d' [g,] r d' 
    g, r d' [g,] r d'
    g,4 r8 g4 r8 |
    \repeat unfold 4 {d'8 d d d4 r8}
  }
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
  e a,) c4 r  % \bar "||" \break
 

  % exposition
  \repeat volta 2 {
    \bar ".|:"
    \globalExposition
    \override DynamicText #'X-offset = #-2.0
    <<
      { b4 (e8) }
      {
        \once \override Hairpin #'minimum-length = #4.5
        s8. \p \<
        \once \override Hairpin #'minimum-length = #4
        s8. \> \!
      }
    >>
    \revert DynamicText #'X-offset
    d8 \! (c) b-.
    <<
      { a4 (d8) c8 (b) a-.}
      {
        \once \override Hairpin #'minimum-length = #4.0
        s8. \<
        \once \override Hairpin #'minimum-length = #5.0
        s8. \> s4. \!
      }
    >>
    g4 (gis8) a4 (b8)
    c-. a-. fis-.
    g8 \f g'16 (fis g a) b8-. g-. d-. |

    % page 2 system 2
    b-. b'16 (a b c) d8-. b-. g-. |
    e-. c-. a-. fis-. a-. d,-. |
    \repeat unfold 2 { g16 (a b c) d-. b-. a8 c fis, }
    g16 (a b c) d-. e-. fis8 a d, |
    g16 (fis g a) b-. g-. fis (g a) d,-. e-. fis-. |

    % page 3 system 1
    \repeat unfold 3 { g (a b) d,-. e-. fis-. }
    g-. d-. e-. \< fis-. g-. a-. |
    b16 \sf (a g) fis-. e-. d-. cis (b a) g-. fis-. e-.
    d4 a''8 fis4 d'8 |
    <d,, d'>4 a''8 fis4 d'8 |

    % page 3 system 2
    <d,, d'>4 a''8 fis4 c'!8 |
    <d,, d'>4 a''8 fis4 c'8 |
  }
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
  
  % exposition 
  \repeat volta 2 {
    \globalExposition
    r8 gis-. \p e |
    a4 r8 r fis-. d-. |
    g4 r8 r b, \< (e) |
    d \> (c) \! b-. a-. c-. d-. |
    g, \f b'16 (a b c) d8-. b-. g-. 
    
    % page 2 system 2
    d g'16 (fis g a) b8-. g-. d-. |
    e-. c-. a-. fis-. a-. d,-. |
    g d b <c d>4. |
    \repeat unfold 3 { 
      \repeat unfold 3 { <b d>8 } <c d>4.
    }
    <b d>8 r <a' c> [(<g b>)] r \stemUp <a c> 
    (<g b>) r <a c> [(<g b>)] r8 r 
    \stemNeutral
    <g b>4. \sf <g cis> |
    <fis d'>8 a fis 
      \repeat unfold 7 { d16 fis a g fis e }
  }
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
  
  % exposition
  \repeat volta 2 {
    \ExpoI
    g8 \f \repeat unfold 11 { <b d>8 }
    c8 c c c c c 
    b d g <a, fis'>4. |
    \repeat unfold 3 { 
      \repeat unfold 3 { <b g'>8 } <a fis'>4.
    }
    <b g'>8 r d [d] r d |
    d r d [d] r r |
    e2. \sf |
    fis8 d d d d d
    \repeat unfold 6 { d16 fis a g fis e }
  }
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
  
  % exposition
  \repeat volta 2 {
    \ExpoI
    \ExpoII
    e4. \sf a |
    \repeat unfold 2 { d,8 d d d d d }
    \repeat unfold 2 { d4 r8 d4 r8 }
  }
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
  \layout { 
    \context {
     \Staff
     \RemoveEmptyStaves
    }
  }
}
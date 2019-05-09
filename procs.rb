PAIR  = ->(x) { ->(y) { ->(f) { f[x][y] } } }
LEFT  = ->(p) { p[->(x) { ->(y) { x } }] }
RIGHT = ->(p) { p[->(x) { ->(y) { y } }] }
EMPTY = PAIR[T][T]
UNSHIFT = -> l { -> x {
  PAIR[F][PAIR[x][l]]
}}

IS_EMPTY = LEFT
FIRST = -> l { LEFT[RIGHT[l]] }
REST = -> l { RIGHT[RIGHT[l]] }


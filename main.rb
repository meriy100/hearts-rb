# PAIR  = ->(x) { ->(y) { ->(f) { f[x][y] } } }
# LEFT  = ->(p) { p[->(x) { ->(y) { x } }] }
# RIGHT = ->(p) { p[->(x) { ->(y) { y } }] }
# EMPTY = PAIR[T][T]
# UNSHIFT = -> l { -> x {
#   PAIR[F][PAIR[x][l]]
# }}
#
# IS_EMPTY = LEFT
# FIRST = -> l { LEFT[RIGHT[l]] }
# REST = -> l { RIGHT[RIGHT[l]] }

$memory = Array.new(1024, 0)

WHILE = ->(x) { ->(y) { ->(p) { (p $memory[0...10] ; $memory[p] != 0) ? WHILE[x][y][x[p]] : y[p] } } }
# IF = ->(x) { ->(y) { ->(z) { x ? y : z } } }
# PINC = ->(p) { p + 1 } # @return Pointer
PINC = ->(n) { ->(p) { n[p + 1] } } # @return Pointer
PDEC = ->(n) { ->(p) { n[p - 1] } } # @return Pointer
INC = ->(n) { ->(p) { $memory[p] += 1; n[p] } } # @return Pointer
DEC = ->(n) { ->(p) { $memory[p] -= 1; n[p] } } # @return Pointer
FIN = ->(p) { p }

# DEC[FIN][100]
# INC[WHILE[PINC[INC[FIN]]][DEC[FIN]]][0]


def gem_node(h, hs)
  case h
  when '>'
    PINC[gem_node(hs.shift, hs)]
  when '<'
    PDEC[gem_node(hs.shift, hs)]
  when '+'
    INC[gem_node(hs.shift, hs)]
  when '-'
    DEC[gem_node(hs.shift, hs)]
  when '['
    WHILE[gem_node(hs.shift, hs)][gem_node(hs.shift, hs)]
  when ']'
    FIN
  when nil
    FIN
  end
end


gem_node('+', '+++++++++[>+>+<<-]'.split(''))[0]

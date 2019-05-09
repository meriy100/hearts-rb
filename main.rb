$memory = Array.new(1024, 0)

PAIR  = -> x { -> y { -> f { f[x][y] } } }
LEFT  = -> p { p[-> x { -> y { x } } ] }
RIGHT = -> p { p[-> x { -> y { y } } ] }

ZERO = -> p { -> x { -> { p } } }
ONE = -> p { -> x { -> { x[p] } } }
INCREMENT = -> n { -> p { -> x { p[n[p][x]] } } }
SLIDE     = -> p { PAIR[RIGHT[p]][INCREMENT[RIGHT[p]]] }
DECREMENT = -> n { LEFT[n[SLIDE][PAIR[ZERO][ZERO]]] }
T = -> t { -> f { t } }
F = -> t { -> f { f } }
IF = -> b { -> { -> t {  -> f { b[t][f] } } } }
IS_ZERO = -> n { n[-> x { F }][T] }

WHILE = ->(x) { ->(y) { ->(p) { $memory[p] != 0 ? WHILE[x][y][x[p]] : y[p] } } }
PINC = ->(n) { ->(p) { n[p + 1] } } # @return Pointer
PDEC = ->(n) { ->(p) { n[p - 1] } } # @return Pointer
INC = ->(n) { ->(p) { $memory[p] += 1; n[p] } } # @return Pointer
DEC = ->(n) { ->(p) { $memory[p] -= 1; n[p] } } # @return Pointer
GET = ->(n) { ->(p) { $memory[p] = STDIN.getc.ord; n[p] } }
PUT = ->(n) { ->(p) { STDOUT.print $memory[p].chr('UTF-8'); n[p] } }
FIN = ->(p) { p }


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
  when ','
    GET[gem_node(hs.shift, hs)]
  when '.'
    PUT[gem_node(hs.shift, hs)]
  when nil
    FIN
  end
end


# gem_node(',', '[>+>+<<-]>.>.'.split(''))[0]
# Hello World!
gem_node('+', '+++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.'.split(''))[0]

$memory = Array.new(1024, 0)

WHILE = ->x { ->y { ->p { $memory[p] != 0 ? WHILE[x][y][x[p]] : y[p] } } }
PINC = ->n { ->p { n[p + 1] } } # @return Pointer
PDEC = ->n { ->p { n[p - 1] } } # @return Pointer
INC = ->n { ->p { $memory[p] += 1; n[p] } } # @return Pointer
DEC = ->n { ->p { $memory[p] -= 1; n[p] } } # @return Pointer
GET = ->n { ->p { $memory[p] = STDIN.getc.ord; n[p] } }
PUT = ->n { ->p { STDOUT.print $memory[p].chr('UTF-8'); n[p] } }
FIN = ->p { p }


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


source_code = <<EOS
++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.
EOS

# Hello World!
gem_node('>', source_code.gsub(/\s/, "").split(''))[0]

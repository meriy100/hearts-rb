$memory = Array.new(1024, 0)
$stack = []
$debug_line = [false]
def debug(point, command)
  return unless ARGV[0] == '-d'
  $debug_line[0] = !$debug_line[0]
  $memory[0..60].map.with_index(0) do |n, idx|
    if $debug_line[0]
      STDERR.print "\e[33m"
    else
      STDERR.print "\e[36m"
    end
    if point == idx
      STDERR.print "\e[31m"
      # STDERR.print n.chr('UTF-8').gsub(/\s/, "_")
      STDERR.print n
      STDERR.print "\e[0m"
    else
      STDERR.print n
      # STDERR.print n.chr('UTF-8').gsub(/\s/, "_")
    end
    STDERR.print " "
  end
  STDERR.print $stack
  STDERR.print command
  STDERR.puts
end

WHILE = ->x { ->y { ->p { debug(p, "WHILE"); $memory[p] != 0 ? WHILE[x][y][x[p]] : y[p] } } }
IF = ->x { ->y { ->p { debug(p, "IF"); $memory[p] != 0 ? y[x[p]] : y[p] } } }
SIF = ->x { ->y { ->p { debug(p, "SIF"); $memory[p] == $stack.last ? y[x[p]] : y[p] } } }
PINC = ->n { ->p { debug(p, "PINC"); n[p + 1] } } # @return Pointer
PDEC = ->n { ->p { debug(p, "PDEC"); n[p - 1] } } # @return Pointer
INC = ->n { ->p { debug(p, "INC"); $memory[p] += 1; n[p] } } # @return Pointer
DEC = ->n { ->p { debug(p, "DEC"); $memory[p] -= 1; n[p] } } # @return Pointer
GET = ->n { ->p { debug(p, "GET"); $memory[p] = STDIN.getc&.ord || 0; n[p] } }
PUT = ->n { ->p { debug(p, "PUT"); STDOUT.print $memory[p].chr('UTF-8'); n[p] } }
FIN = ->p { debug(p, "FIN"); p }

SWHILE = ->x { ->y { ->p { debug(p, "SWHILE"); $memory[p] != $stack.last ? SWHILE[x][y][x[p]] : y[p] } } }
SPUSH = ->n { ->p { debug(p, "SPUSH"); $stack.push($memory[p]); n[p] }}
SPOP = ->n { ->p { debug(p, "SPOP"); $memory[p] = $stack.pop; n[p] }}
CLEAR = ->n { ->p { debug(p, "CLEAR"); $memory[p] = 0; n[p] }}

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
  when '('
    IF[gem_node(hs.shift, hs)][gem_node(hs.shift, hs)]
  when ')'
    FIN
  when '0'
    SIF[gem_node(hs.shift, hs)][gem_node(hs.shift, hs)]
  when '9'
    FIN
  when 'g'
    GET[gem_node(hs.shift, hs)]
  when 'p'
    PUT[gem_node(hs.shift, hs)]
  when 'S'
    SPUSH[gem_node(hs.shift, hs)]
  when 's'
    SPOP[gem_node(hs.shift, hs)]
  when '{'
    SWHILE[gem_node(hs.shift, hs)][gem_node(hs.shift, hs)]
  when 'c'
    CLEAR[gem_node(hs.shift, hs)]
  when '}'
      FIN
  when nil
    FIN
  end
end


source_code = <<EOS
>>>>>
++++++++++Sc
--
[
  >
  g
  0c9
  (
    >
    g
    ------------------------------------------------ # '0'
    >
    ++++++++++++++++++++++++++++++++Sc # スペース
    g
    0c9 # スペースチェック
    >sc< # スタック(_) 削除
    0c9 # 終端文字 チェック
    (
      <+++++++++> # +9
      ------------------------------------------------ # to ini
      [-<+>] # N' = N + M
      >gc< # スペース消去
    )
    <
  ) 
]
EOS

# Hello World!
gem_node('>', source_code.gsub(/#.*$/, "").gsub(/\s/, "").split(''))[0]
puts

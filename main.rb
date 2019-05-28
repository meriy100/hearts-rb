$memory = Array.new(1024, 0)
$stack = []
$debug_line = 0
def debug(point, command)
  return unless ARGV[0] == '-d'
  $debug_line += 1

  return if $debug_line < 15616

  if $debug_line % 2 == 0
    STDERR.print "\e[33m"
  else
    STDERR.print "\e[36m"
  end
  STDERR.print ("%4d " % $debug_line)
  $memory[0..100].map.with_index(0) do |n, idx|
    if $debug_line % 2 == 0
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
>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>> ----
>>>>>>>>>>>>>>>> -----
>>>>>>>>>>>>>>>> ------
>>>>>>>>>>>>>>>> -------
>>>>>>>>>>>>>>>> --------
<<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<< <<<<<<<<<<<<<<<< 

[ # 入力
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
sc
++[--<++]--

> # array2 3 に移動
[ # 文字毎
  Sc
  +++[--->+++]--- # array2 に移動
  [>] sS # array2[n] = s
  ++++[---->++++]---- # array3 に移動
  [>] s # array3[n] = s
  ++[--<++]-- # array1 に移動
  >[>] # array1[n] に移動
  - 
  > 
]
++[--<++]-- # array1 に移動
>[+>]

# array2 から スートだけを取り出し array1へ

+++[--->+++]--- # array2 に移動
>
[
  Sc
  ++[--<++]-- # array1 に移動
  [>]s #array1[n] = s
  +++[--->+++]--- # array2 に移動
  >[>] 
  ->c->
]
+++[---<+++]--- # array2 に移動
>[+>]

# array1 で すべて同じスートならarray1[0] に1 そうでないなら0
++[--<++]-- # array1 に移動
>Sc+>
0
  >
  0
    >
    0
      >
      0
        >
      9
    9
  9
9
(
  ++[--<++]-- # array1 に移動
  >[c>]
)
++[--<++]-- # array1 に移動
>>[c>]


# array3 から スートだけを取り出し array2へ

++++[---->++++]---- # array3 に移動
>
[
  c->Sc
  +++[---<+++]--- # array2 に移動
  [>]s #array2[n] = s
  ++++[---->++++]---- # array3 に移動
  >[>] 
  ->
]
++++[----<++++]---- # array3 に移動
>[+>]

+++[---<+++]--- # array2 に移動
> # array2 を 3 4 に移動
[ 
  Sc
  ++++[---->++++]---- # array3 に移動
  [>] sS # array3[n] = s
  +++++[----->+++++]----- # array4 に移動
  [>] s # array4[n] = s
  +++[---<+++]--- # array2 に移動
  >[>] # array2[n] に移動
  - 
  > 
]
+++[---<+++]--- # array2 に移動
>[+>]

++++[---->++++]---- # array3 に移動
# array3 を どれかが 0 になるまで減らす すべて足すと 0 + 1 + 2+ 3+ 4 = 10  or 0 9 10 11 12 = 42
>[
  ->->->->-
  (<
    (<
      (<
        (<
        )
      )
    )
  )
]

### array2 に コピー
++++[----<++++]---- # array3 に移動
>S>S>S>S>S
+++[---<+++]--- # array2 に移動
>s>s>s>s>s

# array3 を 1 ずつ plus
++++[---->++++]---- # array3 に移動
>+>+>+>+>+
>c+S+S+S+S+Sc< # stack に 1..5 を入れる
<<<<<

[>0sc9] # 5チェック
++++[----<++++]---- # array3 に移動
>
[>]>[[-<+>]>]
++++[----<++++]---- # array3 に移動
>>>>(
  <<<<
  [>0sc9] # 4チェック
  ++++[----<++++]---- # array3 に移動
  >
  [>]>[[-<+>]>]
  ++++[----<++++]---- # array3 に移動
  >>>(
    <<<
    [>0sc9] # 3チェック
    ++++[----<++++]---- # array3 に移動
    >
    [>]>[[-<+>]>]
    ++++[----<++++]---- # array3 に移動
    >>(
      <<
      [>0sc9] # 2チェック
      ++++[----<++++]---- # array3 に移動
      >
      [>]>[[-<+>]>]
      ++++[----<++++]---- # array3 に移動
      >(
        <
        [>0sc9] # 1チェック
        ++++[----<++++]---- # array3 に移動
        >
        [>]>[[-<+>]>]
        ++++[----<++++]---- # array3 に移動
        >(c-)+(
          ++[--<++]-- # array1 に移動
          >>+ # array1[1] = true
          ++++[---->++++]---- # array3 に移動
        ) 
      )
    )
  )
)

++++[----<++++]---- # array3 に移動

>c>c>c>c>c
c+S++++++++++S+S+S+Sc< # stack に 1..5 を入れる
# array2 を 1 ずつ plus
+++[---<+++]--- # array2 に移動
>+>+>+>+>+
<<<<<

[>0sc9] # 5チェック
+++[---<+++]--- # array3 に移動
>
[>]>[[-<+>]>]
+++[---<+++]--- # array3 に移動
>>>>(
  <<<<
  [>0sc9] # 4チェック
  +++[---<+++]--- # array3 に移動
  >
  [>]>[[-<+>]>]
  +++[---<+++]--- # array3 に移動
  >>>(
    <<<
    [>0sc9] # 3チェック
    +++[---<+++]--- # array3 に移動
    >
    [>]>[[-<+>]>]
    +++[---<+++]--- # array3 に移動
    >>(
      <<
      [>0sc9] # 2チェック
      +++[---<+++]--- # array3 に移動
      >
      [>]>[[-<+>]>]
      +++[---<+++]--- # array3 に移動
      >(
        <
        [>0sc9] # 1チェック
        +++[---<+++]--- # array3 に移動
        >
        [>]>[[-<+>]>]
        +++[---<+++]--- # array3 に移動
        >(c-)+(
          ++[--<++]-- # array1 に移動
          >>+ # array1[1] = true
          +++[--->+++]--- # array3 に移動
        ) 
      )
    )
  )
)

+++[---<+++]--- # array3 に移動

>c>c>c>c>c

### array4 => array2 に コピー
+++++[----->+++++]----- # array4 に移動
>S>S>S>S>S
+++[---<+++]--- # array2 に移動
>s>s>s>s>s

+++[---<+++]--- # array2 に移動
>Sc
>[[-<+>]>]
++[--<++]-- # array1 に移動
>>>+ 
+++[--->+++]--- # array2 に移動
> # 1枚目 と同じ数字のカウント
[
  0
    c
    >[[-<+>]>]
    ++[--<++]-- # array1 に移動
    >>>+ 
    +++[--->+++]--- # array2 に移動
  9
  >
]
+++[---<+++]--- # array2 に移動

>( # 2枚目 と同じ数字のカウント
  Sc
  >[[-<+>]>]
  ++[--<++]-- # array1 に移動
  >>>>+ 
  +++[--->+++]--- # array2 に移動
  >
  [
    0
      c
      >[[-<+>]>]
      ++[--<++]-- # array1 に移動
      >>>>+ 
      +++[--->+++]--- # array2 に移動
    9
    >
  ]
)

+++[---<+++]--- # array2 に移動
>( # 3枚目 と同じ数字のカウント
  Sc
  >[[-<+>]>]
  ++[--<++]-- # array1 に移動
  >>>>>+ 
  +++[--->+++]--- # array2 に移動
  >
  [
    0
      c
      >[[-<+>]>]
      ++[--<++]-- # array1 に移動
      >>>>>+ 
      +++[--->+++]--- # array2 に移動
    9
    >
  ]
)

+++[---<+++]--- # array2 に移動
>( # 4枚目 と同じ数字のカウント
  Sc
  >[[-<+>]>]
  ++[--<++]-- # array1 に移動
  >>>>>>+ 
  +++[--->+++]--- # array2 に移動
  >
  [
    0
      c
      >[[-<+>]>]
      ++[--<++]-- # array1 に移動
      >>>>>>+ 
      +++[--->+++]--- # array2 に移動
    9
    >
  ]
)
EOS

# Hello World!
gem_node('>', source_code.gsub(/#.*$/, "").gsub(/\s/, "").split(''))[0]
puts

$💔 = Array.new(1024, 0)
$💘 = []
$💕 = ->💜 { ->💙 { ->💛 { $💔[💛] != 0 ? $💕[💜][💙][💜[💛]] : 💙[💛] } } }
def 💓(h, hs)
  case h
  when '💙'
    ->💚 { ->💛 { 💚[💛 + 1] } }[💓(hs.shift, hs)]
  when '💚'
    ->💚 { ->💛 { 💚[💛 - 1] } }[💓(hs.shift, hs)]
  when '💛'
    ->💚 { ->💛 { $💔[💛] += 1; 💚[💛] } }[💓(hs.shift, hs)]
  when '💜'
    ->💚 { ->💛 { $💔[💛] -= 1; 💚[💛] } }[💓(hs.shift, hs)]
  when '💓'
    $💕[💓(hs.shift, hs)][💓(hs.shift, hs)]
  when '💔'
    ->💛 { 💛 }
  when '💘'
    ->💜 { ->💙 { ->💛 { $💔[💛] != 0 ? 💙[💜[💛]] : 💙[💛] } } }[💓(hs.shift, hs)][💓(hs.shift, hs)]
  when '💕'
    ->💛 { 💛 }
  when '💖'
    ->💜 { ->💙 { ->💛 { $💔[💛] == $💘[-1] ? 💙[💜[💛]] : 💙[💛] } } }[💓(hs.shift, hs)][💓(hs.shift, hs)]
  when '💗'
    ->💛 { 💛 }
  when '💞'
    ->💚 { ->💛 { $💔[💛] = STDIN.getc&.ord || 0; 💚[💛] } }[💓(hs.shift, hs)]
  when '💝'
    ->💚 { ->💛 { STDOUT.print $💔[💛].chr('UTF-8'); 💚[💛] } }[💓(hs.shift, hs)]
  when '🍻'
    ->💚 { ->💛 { $💘.push($💔[💛]); 💚[💛] }}[💓(hs.shift, hs)]
  when '🍺'
    ->💚 { ->💛 { $💔[💛] = $💘.pop; 💚[💛] }}[💓(hs.shift, hs)]
  when '🌻'
     ->💚 { ->💛 { $💔[💛] = 0; 💚[💛] }}[💓(hs.shift, hs)]
  when nil
    ->💛 { 💛 }
  end
end


source_code = <<EOS
💙💙💙💙💙
💛💛💛💛💛💛💛💛💛💛🍻🌻
💜💜
💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙 💜💜💜
💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙 💜💜💜💜
💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙 💜💜💜💜💜
💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙 💜💜💜💜💜💜
💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙 💜💜💜💜💜💜💜
💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙💙 💜💜💜💜💜💜💜💜
💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚 💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚 💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚 💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚 💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚 💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚💚 

💓 
  💙
  💞
  💖🌻💗
  💘
    💙
    💞
    💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜 
    💙
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛🍻🌻 
    💞
    💖🌻💗 
    💙🍺🌻💚 
    💖🌻💗 
    💘
      💚💛💛💛💛💛💛💛💛💛💙 
      💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜💜 
      💓💜💚💛💙💔 
      💙💞🌻💚 
    💕
    💚
  💕 
💔
🍺🌻
💛💛💓💜💜💚💛💛💔💜💜

💙 
💓 
  🍻🌻
  💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
  💓💙💔 🍺🍻 
  💛💛💛💛💓💜💜💜💜💙💛💛💛💛💔💜💜💜💜 
  💓💙💔 🍺 
  💛💛💓💜💜💚💛💛💔💜💜 
  💙💓💙💔 
  💜 
  💙 
💔
💛💛💓💜💜💚💛💛💔💜💜 
💙💓💛💙💔



💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
💙
💓
  🍻🌻
  💛💛💓💜💜💚💛💛💔💜💜 
  💓💙💔🍺 
  💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
  💙💓💙💔 
  💜💙🌻💜💙
💔
💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙💓💛💙💔


💛💛💓💜💜💚💛💛💔💜💜 
💙🍻🌻💛💙
💖
  💙
  💖
    💙
    💖
      💙
      💖
        💙
      💗
    💗
  💗
💗
💘
  💛💛💓💜💜💚💛💛💔💜💜 
  💙💓🌻💙💔
💕
💛💛💓💜💜💚💛💛💔💜💜 
💙💙💓🌻💙💔




💛💛💛💛💓💜💜💜💜💙💛💛💛💛💔💜💜💜💜 
💙
💓
  🌻💜💙🍻🌻
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💓💙💔🍺 
  💛💛💛💛💓💜💜💜💜💙💛💛💛💛💔💜💜💜💜 
  💙💓💙💔 
  💜💙
💔
💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
💙💓💛💙💔

💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙 
💓 
  🍻🌻
  💛💛💛💛💓💜💜💜💜💙💛💛💛💛💔💜💜💜💜 
  💓💙💔 🍺🍻 
  💛💛💛💛💛💓💜💜💜💜💜💙💛💛💛💛💛💔💜💜💜💜💜 
  💓💙💔 🍺 
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💙💓💙💔 
  💜 
  💙 
💔
💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙💓💛💙💔

💛💛💛💛💓💜💜💜💜💙💛💛💛💛💔💜💜💜💜 

💙💓
  💜💙💜💙💜💙💜💙💜
  💘💚
    💘💚
      💘💚
        💘💚
        💕
      💕
    💕
  💕
💔


💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
💙🍻💙🍻💙🍻💙🍻💙🍻
💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙🍺💙🍺💙🍺💙🍺💙🍺


💛💛💛💛💓💜💜💜💜💙💛💛💛💛💔💜💜💜💜 
💙💛💙💛💙💛💙💛💙💛
💙🌻💛🍻💛🍻💛🍻💛🍻💛🍻🌻💚 
💚💚💚💚💚

💓💙💖🍺🌻💗💔 
💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
💙
💓💙💔💙💓💓💜💚💛💙💔💙💔
💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
💙💙💙💙💘
  💚💚💚💚
  💓💙💖🍺🌻💗💔 
  💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
  💙
  💓💙💔💙💓💓💜💚💛💙💔💙💔
  💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
  💙💙💙💘
    💚💚💚
    💓💙💖🍺🌻💗💔 
    💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
    💙
    💓💙💔💙💓💓💜💚💛💙💔💙💔
    💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
    💙💙💘
      💚💚
      💓💙💖🍺🌻💗💔 
      💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
      💙
      💓💙💔💙💓💓💜💚💛💙💔💙💔
      💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
      💙💘
        💚
        💓💙💖🍺🌻💗💔 
        💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
        💙
        💓💙💔💙💓💓💜💚💛💙💔💙💔
        💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 
        💙💘🌻💜💕💛💘
          💛💛💓💜💜💚💛💛💔💜💜 
          💙💙💛 
          💛💛💛💛💓💜💜💜💜💙💛💛💛💛💔💜💜💜💜 
        💕 
      💕
    💕
  💕
💕

💛💛💛💛💓💜💜💜💜💚💛💛💛💛💔💜💜💜💜 

💙🌻💙🌻💙🌻💙🌻💙🌻
🌻💛🍻💛💛💛💛💛💛💛💛💛🍻💛🍻💛🍻💛🍻🌻💚 

💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙💛💙💛💙💛💙💛💙💛
💚💚💚💚💚

💓💙💖🍺🌻💗💔 
💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙
💓💙💔💙💓💓💜💚💛💙💔💙💔
💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙💙💙💙💘
  💚💚💚💚
  💓💙💖🍺🌻💗💔 
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💙
  💓💙💔💙💓💓💜💚💛💙💔💙💔
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💙💙💙💘
    💚💚💚
    💓💙💖🍺🌻💗💔 
    💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
    💙
    💓💙💔💙💓💓💜💚💛💙💔💙💔
    💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
    💙💙💘
      💚💚
      💓💙💖🍺🌻💗💔 
      💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
      💙
      💓💙💔💙💓💓💜💚💛💙💔💙💔
      💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
      💙💘
        💚
        💓💙💖🍺🌻💗💔 
        💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
        💙
        💓💙💔💙💓💓💜💚💛💙💔💙💔
        💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
        💙💘🌻💜💕💛💘
          💛💛💓💜💜💚💛💛💔💜💜 
          💙💙💛 
          💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
        💕 
      💕
    💕
  💕
💕

💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 

💙🌻💙🌻💙🌻💙🌻💙🌻


💛💛💛💛💛💓💜💜💜💜💜💙💛💛💛💛💛💔💜💜💜💜💜 
💙🍻💙🍻💙🍻💙🍻💙🍻
💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙🍺💙🍺💙🍺💙🍺💙🍺

💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙🍻🌻
💙💓💓💜💚💛💙💔💙💔
💛💛💓💜💜💚💛💛💔💜💜 
💙💙💙💛 
💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
💙 
💓
  💖
    🌻
    💙💓💓💜💚💛💙💔💙💔
    💛💛💓💜💜💚💛💛💔💜💜 
    💙💙💙💛 
    💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
  💗
  💙
💔
💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 

💙💘 
  🍻🌻
  💙💓💓💜💚💛💙💔💙💔
  💛💛💓💜💜💚💛💛💔💜💜 
  💙💙💙💙💛 
  💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
  💙
  💓
    💖
      🌻
      💙💓💓💜💚💛💙💔💙💔
      💛💛💓💜💜💚💛💛💔💜💜 
      💙💙💙💙💛 
      💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
    💗
    💙
  💔
💕

💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙💘 
  🍻🌻
  💙💓💓💜💚💛💙💔💙💔
  💛💛💓💜💜💚💛💛💔💜💜 
  💙💙💙💙💙💛 
  💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
  💙
  💓
    💖
      🌻
      💙💓💓💜💚💛💙💔💙💔
      💛💛💓💜💜💚💛💛💔💜💜 
      💙💙💙💙💙💛 
      💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
    💗
    💙
  💔
💕

💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
💙💘 
  🍻🌻
  💙💓💓💜💚💛💙💔💙💔
  💛💛💓💜💜💚💛💛💔💜💜 
  💙💙💙💙💙💙💛 
  💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
  💙
  💓
    💖
      🌻
      💙💓💓💜💚💛💙💔💙💔
      💛💛💓💜💜💚💛💛💔💜💜 
      💙💙💙💙💙💙💛 
      💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
    💗
    💙
  💔
💕
💛💛💓💜💜💚💛💛💔💜💜 

💙💘
  💙💘
    💛💛💛💛💛💛💛💓💜💜💜💜💜💜💜💙💛💛💛💛💛💛💛💔💜💜💜💜💜💜💜 
    💙
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💙💜
    💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
    💙🌻
    💛💛💓💜💜💚💛💛💔💜💜 
    💙🌻💙🌻💙🌻💙🌻💙🌻💙🌻💙
    💚 💚 💚 💚 💚 💚 💚
    💙
  💕
  💛💛💓💜💜💚💛💛💔💜💜 
  💙
💕
💛💛💓💜💜💚💛💛💔💜💜 
💚💛💛💛💛🍻🌻💙
💙💙💙
💓
  💖
    💛💛💛💛💛💛💛💓💜💜💜💜💜💜💜💙💛💛💛💛💛💛💛💔💜💜💜💜💜💜💜 
    💙
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
    💙💜
    💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
    💙🌻
    💛💛💓💜💜💚💛💛💔💜💜 
    💙🌻💙🌻💙🌻💙🌻💙🌻💙🌻💙
    💚 💚 💚 💚 💚 💚 💚
  💗
  💙
💔
🍺🌻
💛💛💓💜💜💚💛💛💔💜💜 
💙💙


💙🍻💙🍻💙🍻💙🍻
💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
💙🍺💙🍺💙🍺💙🍺💙💜💚
💓💜💚💔
💛💓💜💘💛💕💙💛💔💜
💚💚
💛💛💛💓💜💜💜
 💙💓💜💚💛💙💔💚
 💚
💛💛💛💔💜💜💜
💙
💙💛💛💛💛💛🍻🌻💚
💖
  💛💛💛💛💛💛💛💓💜💜💜💜💜💜💜💙💛💛💛💛💛💛💛💔💜💜💜💜💜💜💜 
  💙
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💙💜
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💙🌻
  💛💛💓💜💜💚💛💛💔💜💜 
  💙🌻💙🌻💙🌻💙🌻💙🌻💙🌻💙
  💚 💚 💚 💚 💚 💚 💚
💗

💛💛💓💜💜💚💛💛💔💜💜 

💙💘
  💛💛💛💛💛💛💛💓💜💜💜💜💜💜💜💙💛💛💛💛💛💛💛💔💜💜💜💜💜💜💜 
  💙
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💙💜
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💙🌻
  💛💛💓💜💜💚💛💛💔💜💜 
  💙🌻💙🌻💙🌻💙🌻💙🌻💙🌻💙
  💚 💚 💚 💚 💚 💚 💚
💕
💛💛💓💜💜💚💛💛💔💜💜 
💙💙💘
  💛💛💛💛💛💛💛💓💜💜💜💜💜💜💜💙💛💛💛💛💛💛💛💔💜💜💜💜💜💜💜 
  💙
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💙💜
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💙🌻
  💛💛💓💜💜💚💛💛💔💜💜 
  💙🌻💙🌻💙🌻💙🌻💙🌻💙🌻💙
  💚 💚 💚 💚 💚 💚 💚
💕
💛💛💛💓💜💜💜💙💛💛💛💔💜💜💜 
💙
💙💛💛💛🍻🌻💚
💖
  💛💛💛💛💛💛💛💓💜💜💜💜💜💜💜💙💛💛💛💛💛💛💛💔💜💜💜💜💜💜💜 
  💙
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💙💜
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💙
💗

💙💛💛💛💛🍻🌻💚
💖
  💛💛💛💛💛💛💛💓💜💜💜💜💜💜💜💙💛💛💛💛💛💛💛💔💜💜💜💜💜💜💜 
  💙
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💙💜
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💙
💗

💙💛💛🍻🌻💚
💖
  💛💛💛💛💛💛💛💓💜💜💜💜💜💜💜💙💛💛💛💛💛💛💛💔💜💜💜💜💜💜💜 
  💙
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💙💜
  💛💛💛💓💜💜💜💚💛💛💛💔💜💜💜 
  💙
💗
💛💛💛💛💛💛💛💓💜💜💜💜💜💜💜💙💛💛💛💛💛💛💛💔💜💜💜💜💜💜💜 
💙💙💛💘
  💙
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
  💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💛💝🌻
💕

EOS
💓('💙', source_code.gsub(/#.*$/, "").gsub(/\s/, "").split(''))[0]
puts

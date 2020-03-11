# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    puts "0~2の数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.chomp
    if input_hand == "0" || input_hand == "1" || input_hand == "2"
     input_hand = input_hand.to_i
    else
      return hand
    end
    if input_hand == 0 || input_hand == 1 || input_hand == 2
      return input_hand
    else
      return hand
    end
  end
end

# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力させます。
    enemy_hand = rand(3)
    return enemy_hand
  end
end

# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{敵の生成した値}です。」と出力させます。
    puts "相手の手は#{janken[enemy_hand]}です。"
    if (player_hand - enemy_hand + 3) % 3 == 0
      puts "あいこです。"
      return true
      # whileを繰り返す「true」を返してじゃんけんを繰り返し実行させます。
    elsif (player_hand - enemy_hand + 3) % 3 == 2
      puts "あなたの勝ちです。"
      return false
      # whileを終了させる「false」を返してじゃんけんを終了させます。
    else
      puts "あなたの負けです。"
      return false
      # whileを終了させる「false」を返してじゃんけんを終了させます。
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new
next_game = true
while next_game
# じゃんけん
# 変数「next_game」に
# じゃんけんを実行して値が返ってきたものを代入します。
# じゃんけんの実行結果に「true」が返ってくると、このwhileを繰り返します。
  next_game = janken.pon(player.hand, enemy.hand)
end

require_relative 'lib.rb'
def main
  obj = Tic.new
  player1 = Player.new
  player2 = Player.new
  players = [player1, player2]
  obj.players_simble(players)
  i = 1
  loop do
    i += 1
    break if obj.turn(players[i % 2]) == true
  end
  puts 'game over'
end
main

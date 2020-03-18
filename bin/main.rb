#!/usr/bin/env ruby
require_relative '../lib/tic.rb'
require_relative '../lib/players.rb'

def main
  obj = Tic.new
  player1 = Player.new
  player2 = Player.new
  players = [player1, player2]
  obj.players_simble(players)
  i = 1
  loop do
    i += 1
    puts 'player' + ((i % 2) + 1).to_s + ' turn'
    res = obj.turn(players[i % 2])
    if res == 2
      puts 'player ' + ((i % 2) + 1).to_s + ' wins'
      return
    end
    if res == 1
      puts 'game draw'
      return
    end
  end
end

loop do
  main
  puts 'do you want to play again (Y/N)'
  inp = gets.chomp
  return if inp != 'y' or inp != 'Y'

  return main
end

#!/usr/bin/env ruby
require_relative '../lib/tic.rb'
require_relative '../lib/players.rb'
def input
  puts 'enter in range of 1-3'
  print 'enter the row index'
  x = gets.chomp.to_i
  print 'enter the colomn index'
  y = gets.chomp.to_i
  indexes = [x, y]
  i = 0
  while i < 2
    if indexes[i] < 1 or indexes[i] > 3
      puts 'invalid move only in range of 1-3'
      return input
    end
    indexes[i] = indexes[i] - 1 if indexes[i] == 1
    indexes[i] = indexes[i] + 1 if indexes[i] == 3
    i += 1
  end
  indexes
end

def main
  obj = Tic.new
  player1 = Player.new
  player2 = Player.new
  players = [player1, player2]
  obj.players_simble(players)
  obj.display_map

  i = 1
  loop do
    i += 1

    puts 'player' + ((i % 2) + 1).to_s + ' turn'
    res = obj.turn(players[i % 2], input)
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
  puts 'do you want to play again (y/n)'
  inp = gets.chomp
  return main if inp.downcase == 'y'

  break
end

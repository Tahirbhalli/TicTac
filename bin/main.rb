#!/usr/bin/env ruby
require_relative '../lib/tic.rb'
class Player < Tic
  def initialize
    super
  end

  def turn
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
        return turn
      end
      indexes[i] = indexes[i] - 1 if indexes[i] == 1
      indexes[i] = indexes[i] + 1 if indexes[i] == 3
      i += 1
    end
    indexes
  end
end

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
  puts 'do you want to play again (y/n)'
  inp = gets.chomp
  return main if inp.downcase == 'y'

  break
end

#!/usr/bin/env ruby
require_relative '../lib/lib.rb'
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
    return if obj.turn(players[i % 2], i % 2)
  end
end

loop do
  main
  puts 'do you want to play again (Y/N)'
  if gets == 'y' or gets == 'Y'
    main
  else
    puts 'press enter to leave the game'
    return
  end
end

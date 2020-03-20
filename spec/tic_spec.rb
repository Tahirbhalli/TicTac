require 'spec_helper'
require '../lib/tic'
require '../lib/players'
def preprocess(indexes)
  i = 0
  while i < 2
    if indexes[i] < 1 or indexes[i] > 3
      puts 'invalid move only in range of 1-3'
      return [1, 1]
    end
    indexes[i] = indexes[i] - 1 if indexes[i] == 1
    indexes[i] = indexes[i] + 1 if indexes[i] == 3
    i += 1
  end
  indexes
end

def gameobj(player)
  tic = Tic.new
  p1 = Player.new
  p2 = Player.new
  
  tic.players_simble(player)
  tic
end
p1=Player.new
p2=Player.new
describe Tic do
  it 'draw combination' do
    players=[p1,p2]
    tic = gameobj players
    draw_pattern = [[1, 1], [2, 1], [2, 2], [3, 3], [3, 1], [1, 3], [2, 3], [3, 2], [1, 2]]
    i = 1
    draw_pattern.each do |a|
      i += 1

      if i == 12 # last iteration where game draws
        tic.turn(players[i % 2], preprocess(a)).should.equal? 1
        tic = nil
        break
      end
      tic.turn(players[i % 2], preprocess(a))
    end
  end
  it 'win combination' do
    players=[p1,p2]
    tic = gameobj players
    win_pattern = [[1, 1], [2, 1], [2, 2], [3, 1], [3, 3]]
    i = 1
    win_pattern.each do |a|
      i += 1
      tic.turn(players[i % 2], preprocess(a)).should == 2 if i == 7 # last iteration where game wins
      tic.turn(players[i % 2], preprocess(a))
    end
  end
end

require_relative 'spec_helper'
require_relative '../lib/tic'
require_relative '../lib/players'
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
  tic.players_simble(player)
  tic
end

describe Tic do
  let(:tic) { Tic.new }
  let(:p1) { Player.new }
  let(:p2) { Player.new }
  let(:num) { -1 }

  it 'draw combination' do
    players = [p1, p2]
    tic.players_simble(players)
    draw_pattern = [[1, 1], [2, 1], [2, 2], [3, 3], [3, 1], [1, 3], [2, 3], [3, 2], [1, 2]]
    i = 1
    num = -1
    draw_pattern.each do |a|
      i += 1
      num = tic.turn(players[i % 2], preprocess(a))
    end
    expect(num.equal?(1)).to eq(true)
  end
  it 'win combination' do
    players = [p1, p2]
    tic.players_simble(players)
    win_pattern = [[1, 1], [2, 1], [2, 2], [3, 1], [3, 3]]
    i = 1
    num = -1
    win_pattern.each do |a|
      i += 1
      num = tic.turn(players[i % 2], preprocess(a))
    end
    expect(num.equal?(2)).to eq(true)
  end
  it 'not win combination' do
    players = [p1, p2]
    tic.players_simble(players)
    draw_pattern = [[1, 1], [2, 1], [2, 2], [3, 3], [3, 1], [1, 3], [2, 3], [3, 2], [1, 2]]
    i = 1
    num = -1
    draw_pattern.each do |a|
      i += 1
      num = tic.turn(players[i % 2], preprocess(a))
    end
    expect(num.equal?(2)).to eq(false)
  end
  it 'not draw combination' do
    players = [p1, p2]
    tic.players_simble(players)
    win_pattern = [[1, 1], [2, 1], [2, 2], [3, 1], [3, 3]]
    i = 1
    num = -1
    win_pattern.each do |a|
      i += 1
      num = tic.turn(players[i % 2], preprocess(a))
    end
    expect(num.equal?(1)).to eq(false)
  end
end

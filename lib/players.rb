require_relative 'tic.rb'
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

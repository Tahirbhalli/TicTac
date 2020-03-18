class Features
  def initialize(_map)
    _map = [[' ', '|', ' ', '|', ' '],
            ['-----'],
            [' ', '|', ' ', '|', ' '],
            ['-----'],
            [' ', '|', ' ', '|', ' ']]
  end

  def isdraw?(map)
    combinations = [[0, 0], [0, 2], [0, 4], [2, 0], [2, 2], [2, 4], [4, 0], [4, 2], [4, 4]]
    combinations.each do |x|
      return false if map[x[0]][x[1]] == ' '
    end
    puts 'game draw'
    true
  end

  def isover?(map, num)
    combinations = [[[0, 0], [0, 2], [0, 4]],
                    [[2, 0], [2, 2], [2, 4]],
                    [[4, 0], [4, 2], [4, 4]],
                    [[0, 0], [2, 0], [4, 0]],
                    [[0, 2], [2, 2], [4, 2]],
                    [[0, 4], [2, 4], [4, 4]],
                    [[0, 0], [2, 2], [4, 4]],
                    [[0, 4], [2, 2], [4, 0]]]

    combinations.each do |x|
      next if map[x[0][0]][x[0][1]] == ' ' or map[x[1][0]][x[1][1]] == ' ' or map[x[2][0]][x[2][1]] == ' '

      next unless map[x[0][0]][x[0][1]] == map[x[1][0]][x[1][1]] && map[x[1][0]][x[1][1]] == map[x[2][0]][x[2][1]]

      puts 'player' + (num + 1).to_s + ' wins'
      return true
    end

    false
  end
end
class Tic < Features
  protected

  @map = []
  @simble = ''
  attr_writer :simble

  public

  attr_reader :simble, :map

  def initialize
    @map = super @map
  end

  def display_map
    @map.each do |x|
      x.each do |y|
        print y
      end
      print "\n"
    end
  end

  def players_simble(players)
    players[0].simble = '*'
    players[1].simble = '$'
  end

  def turn(player, num)
    display_map
    position = player.turn
    return turn(player, num) if @map[position[0]][position[1]] != ' '

    @map[position[0]][position[1]] = player.simble
    if player.isover?(@map, num) == true or player.isdraw?(@map)
      display_map
      return true
    end
    false
  end
end
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

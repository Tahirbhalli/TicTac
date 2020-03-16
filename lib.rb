class Features
  def initialize(_map)
    _map = [[' ', '|', ' ', '|', ' '],
            ['-----'],
            [' ', '|', ' ', '|', ' '],
            ['-----'],
            [' ', '|', ' ', '|', ' ']]
  end

  def isover?(_map)
    true
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

  def turn(player)
    display_map
    position = player.turn
    return turn(player) if @map[position[0]][position[1]] != ' '

    @map[position[0]][position[1]] = player.simble
    player.isover?(@map)
  end
end
class Player < Tic
  def initialize
    super
  end

  def turn
    print 'enter the row index'
    x = gets.chomp.to_i
    print 'enter the colomn index'
    y = gets.chomp.to_i
    [x, y]
  end
end

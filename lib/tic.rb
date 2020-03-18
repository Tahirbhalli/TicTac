require_relative 'features.rb'
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
    return 2 if player.isover?(@map) == true
    return 1 if player.isdraw?(@map)

    0
  end
end

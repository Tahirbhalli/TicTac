class Features
  def initialize(_map)
    _map = [[' ', '|', ' ', '|', ' '],
            ['-----'],
            [' ', '|', ' ', '|', ' '],
            ['-----'],
            [' ', '|', ' ', '|', ' ']]
  end

  def isover?(_map); end
end
class Tic < Features
  protected

  @map = []
  @simble = ''
  def setsimble(value)
    @simble = value
  end

  public

  def getsimble
    @simble
  end

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
    players[0].setsimble '*'
    players[1].setsimble '$'
  end

  def turn(player)
    position = player.turn
    turn(player) if @map[position[0]][position[1]] != ' '
    @map[position[0]][position[1]] = player.getsimble
    display_map
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
obj = Tic.new
player1 = Player.new
player2 = Player.new
obj.players_simble([player1, player2])
obj.display_map
loop do
  obj.turn(player1)
  obj.turn(player2)
end

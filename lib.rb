class Features
    def initialize(_map)
      _map = [[' ', '|', ' ', '|', ' '],
              ['-----'],
              [' ', '|', ' ', '|', ' '],
              ['-----'],
              [' ', '|', ' ', '|', ' ']]
    end
    def gameover?(_simble,_map)
      puts 'wait'
    end
  end
  class Tic < Features
    private
    @map = []
    protected
    @simble=["*","$"]
  
    public
  
    def initialize
      @map = super @map
      @simble=nil
    end
  
    def display_map
      @map.each do |x|
        x.each do |y|
          print y
        end
        print "\n"
      end
    end
  end
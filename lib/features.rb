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

    true
  end

  def isover?(map)
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

      return true if map[x[0][0]][x[0][1]] == map[x[1][0]][x[1][1]] && map[x[1][0]][x[1][1]] == map[x[2][0]][x[2][1]]
    end

    false
  end
end

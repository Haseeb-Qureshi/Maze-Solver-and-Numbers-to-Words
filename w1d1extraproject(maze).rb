DIRECTIONS = ['n', 'e', 's', 'w']

class Maze
  def initialize
    @maze = []

    File.open('maze.txt').each_line do |s|
      @maze << s.chars
    end

    @dir = "n"
    @coor = init_coordinates
    
    run
  end

  def init_coordinates
    @maze.each_with_index do |array, x|
      array.each_with_index do |char, y|
        return [x, y] if char == 'S'
      end
    end
  end

  def run

    until win?(in_front(@coor)) do
      sleep(0.2)
      print_maze
      if !is_wall?(in_front(@coor)) && is_wall?(right_hand(@coor))
        step
      elsif !is_wall?(right_hand(@coor))
        find_wall
        step
      elsif is_wall?(in_front(@coor))
        hit_wall
      end
    end

    step
    print_maze
    puts "You win!"
  end

  def step
    @maze[@coor[0]][@coor[1]] = "@"
    @coor = in_front(@coor)
  end

  def hit_wall
    #turn left
    @dir = DIRECTIONS.rotate(-1)[DIRECTIONS.find_index(@dir)]
  end

  def find_wall
    #turn right
    @dir = DIRECTIONS.rotate(1)[DIRECTIONS.find_index(@dir)]
  end

  def right_hand(coord)
    x, y = coord
    case @dir
    when 'n'
      [x, y + 1]
    when 'e'
      [x + 1, y]
    when 'w'
      [x - 1, y]
    when 's'
      [x, y - 1]
    end
  end

  def in_front(coord)
    x, y = coord
    case @dir
    when 'n'
      [x - 1, y]
    when 'e'
      [x, y + 1]
    when 'w'
      [x, y - 1]
    when 's'
      [x + 1, y]
    end
  end

  def is_wall?(coord)
    x, y = coord
    return false if @maze[x][y] == ' ' || @maze[x][y] == '@'
    return true
  end

  def win?(coord)
    x,y = coord
    return true if @maze[x][y] == "E"
    return false
  end

  def print_maze
    @maze.each do |x|
      p x
      puts
    end
  end
end

Maze.new

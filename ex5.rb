class TowerOfHanoi
  def initialize
    @towers = [[3, 2, 1], [], []]
    @size = @towers[0].size
    run
  end

  def run
    render_stack
    until @towers.last.size == @size do
      puts "Move from where?"
      from = gets.chomp.to_i - 1
      puts "Where to?"
      to = gets.chomp.to_i - 1
      move(from, to)
      render_stack
    end
    puts "You did it! Congrats."
  end

  def move(from, to)
    if @towers[from].empty?
      puts "That tower's empty."
    elsif !@towers[to].empty? && @towers[to].last < @towers[from].last
      puts "That won't fit."
    else
      @towers[to] << @towers[from].pop
    end
  end

  def render_stack
    render = ""
    @towers.each_with_index do |tower, i|
      render << "Tower ##{i + 1}: "
      if tower.empty?
        render << "empty "
      else
        tower.each do |num|
          render << "#{num} "
        end
      end
    end
    puts render.strip
  end
end

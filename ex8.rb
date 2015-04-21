def mult arr
  arr.map { |x| x * 2 }
end

class Array
  def my_each &block
    length.times do |i|
      block.call(self[i])
    end

    self
  end

  def median
    if length == 1
      self[0]
    elsif length.odd?
      self.sort[(length / 2)]
    else
      (self.sort[(length / 2) - 1] + self.sort[(length / 2)] ) / 2.0
    end
  end
end


def concatenate arr
  arr.inject("") { |x, str| x + str}
end

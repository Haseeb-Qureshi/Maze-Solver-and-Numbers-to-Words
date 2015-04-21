class Array
  def two_sum
    (0...length).to_a.combination(2).to_a.select { |pair| self[pair[0]] + self[pair[1]] == 0 }
  end

  def two_sum_2
    twosums = []
    i = 0
    while i < length
      j = i + 1
      while j < length
        if self[i] + self[j] == 0
          twosums << [i, j].sort
        end
        j += 1
      end
      i += 1
    end
    twosums
  end
end

prev = Time.now
p [-1, 0, 2, -2, 1, 3, -5, 6, 8, -2, 3,5, 6, 7, -10].two_sum
p Time.now - prev

prev = Time.now
p [-1, 0, 2, -2, 1, 3, -5, 6, 8, -2, 3,5, 6, 7, -10].two_sum_2
p Time.now - prev

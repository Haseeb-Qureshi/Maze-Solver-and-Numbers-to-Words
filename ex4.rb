arr = [1,4,2,6,9,3,5]

def stock_picker arr
  (0...arr.length).to_a.combination(2).to_a.max_by do |pairs|
    arr[pairs[1]] - arr[pairs[0]]
  end
end
p stock_picker arr

def my_transpose(arr)
  i = 0
  j = 0

  result = Array.new(arr.first.length) { Array.new(arr.length) { 0 } }

  while i < arr.length
    while j < arr.length
      result[i][j] = arr[j][i]
      p arr[j][i]
      j += 1
    end
    j = 0
    i += 1
  end
  result
end


# figure out how many rows in the matrix
# iterate [length] many times and sample the [nth] member of each row

p my_transpose([
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
])
#[[0, 3, 6],
 #[1, 4, 7],
# [2, 5, 8]]

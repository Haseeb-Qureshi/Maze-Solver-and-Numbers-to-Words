def caesar_cipher(str, shift)
  str.chars.map do |x|
    if x.match(/\w/)
      if x.ord + shift <= 122
        (x.ord + shift).chr
      else
        (x.ord + shift - 26).chr
      end
    else
      x
    end
  end.join
end

p caesar_cipher "hello", 3

# The number 4 is of class `FixNum` and it has methods on it.  Your
# challenge is to add an `in_words` method to `FixNum`.

class Fixnum
  ONES = %w(zero one two three four five six seven eight nine)
  TEENS = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  BIGTENS = %w(ten twenty thirty forty fifty sixty seventy eighty ninety).unshift("")

  def in_words
    case to_s.length
    when 1
      ONES[self]
    when 2
      if self < 20
        TEENS[self-10]
      else
        (BIGTENS[self/10] + " " + (self%10).in_words.chomp_0).strip_to_comma
      end
    when 3
      (ONES[self/100] + " hundred " + (self%100).in_words.chomp_0).strip_to_comma
    when 4..6
      ((self/1_000).in_words + " thousand, " + (self%1_000).in_words.chomp_0).strip_to_comma
    when 7..9
      ((self/1_000_000).in_words + " million, " + (self%1_000_000).in_words.chomp_0).strip_to_comma
    when 10..12
      ((self/1_000_000_000).in_words + " billion, " + (self%1_000_000_000).in_words.chomp_0).strip_to_comma
    when 13..15
      ((self/1_000_000_000_000).in_words + " trillion, " + (self%1_000_000_000_000).in_words.chomp_0).strip_to_comma
    end
  end

end

class String
  def chomp_0
    length >= 4 && self[-4..-1].downcase == 'zero' ? self[0...-4] : self
  end

  def strip_to_comma
    strip[-1] == ',' ? strip[0..-2] : strip
  end
end

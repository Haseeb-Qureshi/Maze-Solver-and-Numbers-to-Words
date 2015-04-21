# The number 4 is of class `FixNum` and it has methods on it.  Your
# challenge is to add an `in_words` method to `FixNum`.

class Fixnum

  def in_words
    str = ""
    ones = %w(one two three four five six seven eight nine)
    teens = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
    bigtens = %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
    ones.unshift("")
    bigtens.unshift("")
    case to_s.length
    when 1
      return ones[self]
    when 2
      if self < 20
        teens[self-10]
      else
        return bigtens[self/10] + " " + (self%10).in_words
      end
    when 3
      return (ones[self/100] + " hundred " + (self%100).in_words).strip
    when 4..6
      return ((self/1000).in_words + " thousand " + (self%1000).in_words).strip
    when 7..9
      return ((self/1000000).in_words + " million " + (self%1000000).in_words).strip
    when 10..12
      return ((self/1_000_000_000).in_words + " billion " + (self%1_000_000_000).in_words).strip
    when 13..15
      return ((self/1_000_000_000_000).in_words + " trillion " + (self%1_000_000_000_000).in_words).strip
    end
  end

end

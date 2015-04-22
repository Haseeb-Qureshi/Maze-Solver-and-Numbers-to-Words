# The number 4 is of class `FixNum` and it has methods on it.  Your
# challenge is to add an `in_words` method to `FixNum`.

class Fixnum
  ONES = %w(one two three four five six seven eight nine).unshift("")
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
        BIGTENS[self/10] + " " + (self%10).in_words
      end
    when 3
      (ONES[self/100] + " hundred " + (self%100).in_words).strip
    when 4..6
      ((self/1_000).in_words + " thousand " + (self%1_000).in_words).strip
    when 7..9
      ((self/1_000_000).in_words + " million " + (self%1_000_000).in_words).strip
    when 10..12
      ((self/1_000_000_000).in_words + " billion " + (self%1_000_000_000).in_words).strip
    when 13..15
      ((self/1_000_000_000_000).in_words + " trillion " + (self%1_000_000_000_000).in_words).strip
    end
  end

end

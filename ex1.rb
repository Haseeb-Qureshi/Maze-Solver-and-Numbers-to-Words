
class Array
  def my_uniq
    hash = Hash.new(0)

    each do |x|
      hash[x] += 1
    end

    hash.keys
    #
    # each_with_object({}){
    #   |x,hash| hash[x] = 1
    # }.keys

  end
end

print [1,2,3,2,1,2,3,4,5].my_uniq

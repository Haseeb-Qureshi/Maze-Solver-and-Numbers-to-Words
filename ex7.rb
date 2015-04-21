class MyHashSet

  def initialize
    @store = Hash.new(false)
  end

  def insert el
    @store[el] = true
  end

  def include? el
    @store[el]
  end

  def delete el
    if @store[el]
      @store.delete el
      return true
    else
      false
    end
  end

  def to_a
    @store.keys.select { |key| @store[key] }
  end

  def union set2
    all = (to_a + set2.to_a).uniq
    unionset = MyHashSet.new
    all.each do |item|
      unionset.insert(item)
    end
    unionset
  end

  def intersect set2
    arr1 = to_a
    arr2 = set2.to_a
    all = arr1 & arr2
    intersectset = MyHashSet.new
    all.each do |item|
      intersectset.insert(item)
    end
    intersectset
  end

  def minus set2
    arr1 = to_a
    arr2 = set2.to_a
    all = arr1.select { |item| !arr2.include?(item) }
    minusset = MyHashSet.new
    all.each do |item|
      minusset.insert(item)
    end
    minusset
  end

  def to_s
    @store
  end
end

class Array

  def subsets
    return [[]] if self.length == 0
    smaller_subs = self[0...-1].subsets
    some_subs = smaller_subs.map do |arr|
      arr + [self.last]
    end

    all_subs = smaller_subs + some_subs


  end

end

p [1, 2, 3].subsets
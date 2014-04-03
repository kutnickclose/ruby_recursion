class Array

  def my_each(&prc)
    self.length.times do |index|
      prc.call(self[index])
    end
    self
  end

  def my_map(&prc)
    new_self = []
      self.length.times do |index|
        new_self << prc.call(self[index])
      end
    new_self
  end

  def my_select(&prc)
    new_self = []
    self.length.times do |index|
      if prc.call(self[index])
        new_self << self[index]
      end
    end
    new_self
  end

  def my_inject(&prc)
    result = self[0]
    self.length.times do |index|
      next if index == 0
      result = prc.call(result, self[index])
    end
    result
  end

  def my_sort!(&prc)
    new_arr = []
    self.length.times do |index|
      next if index+1 == nil
      if prc.call(self[index], self[index+1]) == 1
        self[index+1], self[index]  = self[index], self[index+1]
      end
    end
    self
  end

end

[1,2,3].my_each { |num| p(num + 1) }
p [1,2,3].my_map { |num| num + 1 }
p [1,2,3].my_select { |num| num < 3 }
p [1,2,3].my_inject {|sum, num| sum + num}
p [1, 5, 3].my_sort! { |num1, num2| num1 <=> num2 }
p [1, 5, 3].my_sort! { |num1, num2| num2 <=> num1 }

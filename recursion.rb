def range(start, finish)
  return [] if start > finish
  array = range(start, finish-1)
  array << finish
end

def sum_iterative(num_arr)
  num_arr.inject(0) {|sum, num| sum + num}
end

def sum_recursive(num_arr)
  raise "NO_NUMBERS" if num_arr.length == 0
  return num_arr[0] if num_arr.length == 1
  sum = num_arr.pop + sum_recursive(num_arr)
end

def exp(num,pow)
  return 1 if pow == 0
  num *= exp(num,pow-1)
end

def exp_2(num,pow)
  return 1 if pow == 0
  if pow.odd?
    result = exp(num,(pow-1)/2)
    num *= result * result
  else
    result = exp(num,pow/2)
    num = result * result
  end
end

def deep_dup(arr)
  return arr unless arr.is_a?(Array)
  arr.map do |index|
    deep_dup(index)
  end
end

def fibonacci(num)
  return [] if num == 0
  return [0] if num == 1
  return [0,1] if num == 2

  fibonacci(num-1) << fibonacci(num-1).last + fibonacci(num-2).last
end

def bsearch(arr, target)
  if arr.length == 1 && arr != target
    nil
  elsif arr[(arr.length/2)] > target
    bsearch(arr.take((arr.length/2)+1), target)
  elsif arr[arr.length/2] < target
    (arr.length/2) + bsearch(arr.drop(arr.length/2), target)
  else
    arr.length/2
  end
end

array = [1, 5, 7, 9, 10, 11, 12, 13, 14]

p bsearch(array, 14)

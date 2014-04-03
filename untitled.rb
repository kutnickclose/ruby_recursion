def merge_sort(arr)
  return arr if arr.length <= 1
  arr1 = arr.take(arr.length/2)
  arr2 =arr.drop(arr.length/2)

  merge(merge_sort(arr1), merge_sort(arr2))
end

def merge(arr1, arr2)
  new_arr = []
  while arr1.length > 0 && arr2.length > 0
    if arr1[0] < arr2[0] && arr1
      new_arr << arr1.shift
    else
      new_arr << arr2.shift
    end
  end
  new_arr + arr1 + arr2
end

p merge_sort([3,4,1,7,5,2])
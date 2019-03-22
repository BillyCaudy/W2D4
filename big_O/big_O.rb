

def my_min_phaseI(array)
  array.each_index do |idx1| #(0...array.length-1).each
    (idx1+1...array.length).each do |idx2|
      if array[idx1] > array[idx2]
        array[idx1],array[idx2] = array[idx2],array[idx1]
      end
    end
  end
  array[0]
end

def my_min_phaseII(array)
  min_ele = array[0]
  array.each do |ele|
    min_ele = ele if min_ele > ele
  end
  min_ele
end

def largest_contiguous_subsum_I(list)
  sub_arrays = []
  list.each_index do |idx1|
    (idx1...list.length).each do |idx2|
      sub_arrays << list[idx1..idx2]
    end
  end
  sub_sums = sub_arrays.map { |subarray| subarray.sum }
  sub_sums.max
end

def largest_contiguous_subsum_II(list)
  greatest_sums = list[0]
  list.each_index do |idx1|
    (idx1...list.length).each do |idx2|
      this_sum = list[idx1..idx2].sum 
      greatest_sums = this_sum if greatest_sums < this_sum
    end
  end
  greatest_sums
end


def first_anagram?(str, other_str)
  str_arr = str.split("")

  perms = str_arr.permutation.to_a

  perms.map! { |perm |perm.join("") }

  perms.include?(other_str)
end


def second_anagram?(str1, str2)
  str1.each_char do |char|
    char_idx = str2.index(char)
    
    if char_idx == nil
      return false
    end

    str2 = str2[0...char_idx] + str2[char_idx+1..-1]
  end
  return true if str2.empty?
  return false
end

def third_anagram?(str1, str2)
  sorted1 = str1.chars.sort!.join 
  sorted2 = str2.chars.sort!.join 

  sorted1 == sorted2
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0) 
  str1.each_char { |char| hash1[char] += 1 }
  hash2 = Hash.new(0) 
  str2.each_char { |char| hash2[char] += 1 }

  hash1 == hash2
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

def two_sum_too_slow?(arr, target) #iterative solution
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

def two_sum?(arr, target) #iterative solution
  hash = Hash.new(0)
  arr.each do |ele|
    hash[ele] += 1 
  end
  arr.any? { |ele| hash[target - ele] > 0 && !( hash[target - ele] == 1 && target - ele == ele ) }
end


# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false

def windowed_max_range(array, window_size)
  max_diff = array[0...window_size].max - array[0...window_size].min

  (0..array.length - window_size).each do |idx|
    window = array[idx...idx+window_size]
    new_diff = window.max - window.min
    max_diff = new_diff if new_diff > max_diff 
  end

  max_diff
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) # == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) # == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) # == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) # == 6 # 3, 2, 5, 4, 8
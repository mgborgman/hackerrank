def lucky_number?(x)
    num_array = x.to_s.split('')
    num_array.map!{|n| n.to_i}
    first_three_nums = num_array[0..2]
    last_three_nums = num_array[3..num_array.length]
    left_sum = first_three_nums.inject(:+)
    right_sum = last_three_nums.inject(:+)
    return true if left_sum == right_sum
    false
end

def onceInATram(x)
    # Complete this function
    (x + 1..999999).each do |num|
        if lucky_number?(num)
            return num
        end
    end
end

x = gets.strip.to_i
result = onceInATram(x)
puts result
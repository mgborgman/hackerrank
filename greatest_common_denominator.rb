require 'pry'
def find_divisors(num)
    divisible_by = []
    (1..num).each do |divisor|
        divisible_by << divisor if num % divisor == 0
    end
    divisible_by.sort
end

def maximumGcdAndSum(a, b)
    a_divisors = {}
    b_divisors = {}
    current_gcd = nil
    a_current_gcd = nil
    b_current_gcd = nil
    a_result = nil
    b_result = nil
    a.each do |number|
        a_divisors[number] = find_divisors(number)
    end
    b.each do |number|
        b_divisors[number] = find_divisors(number)
    end
    a_divisors.each do |a_number, a_divisors_array|
        a_divisors_array.each do |a_divisor|
            b_divisors.each do |b_number, b_divisors_array|
                if b_divisors_array.include?(a_divisor)
                    if current_gcd.nil?
                        current_gcd = a_divisor
                        a_result = b_number
                        b_result = a_number
                        #binding.pry
                    elsif a_divisor > current_gcd
                        current_gcd = a_divisor
                        a_result = b_number
                        b_result = a_number
                        #binding.pry
                    end
                end
            end
        end
    end
    return a_result + b_result
end

p maximumGcdAndSum([3, 27, 4, 2, 8], [5, 2, 12, 8, 9])

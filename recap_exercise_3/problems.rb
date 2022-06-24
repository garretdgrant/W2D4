def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1}
    hash.keys.select{|ele| hash[ele] == 1}
end

# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
puts "___________________________________________"

def no_consecutive_repeats?(arr)
   arr.each.with_index do |ele, i|
    return false if i < arr.length - 1 && ele == arr[i+1]
   end
   true
end
# Examples 
p    no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p    no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p    no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p    no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p    no_consecutive_repeats?(['x'])                              # => true
puts "___________________________________________"

def char_indices(str)
    hash = Hash.new {|h,k| h[k] = []}
    str.each_char.with_index do |char, i|
        hash[char] << i
    end
    hash
end

# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts "___________________________________________"

def longest_streak(str)
    temp = ""
    longest = ""

    (0...str.length).each do |i|
        if str[i] == str[i-1] 
            temp += str[i]
        else
            temp = str[i]
        end
        longest = temp if temp.length >= longest.length
    end
    longest
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
puts "___________________________________________"

def prime?(num)
    return true if num <= 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end

def bi_prime?(num)
    factor1 = num - 1
    while factor1 > 1
        if num % factor1 == 0
            factor2 = num/factor1
           return true if prime?(factor1) && prime?(factor2)
        end
        factor1 -= 1
    end
    false
end

# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

puts "___________________________________________"

10.downto 0 do |i|
    puts i
end

require "byebug"
# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    max = num_1*num_2
    ([num_1,num_2].min..max).each do |i|
       return i if i % num_1 == 0 && i % num_2 == 0
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def substrings(str, length = nil)
    parts = str.split("")
    subs = []
    (0...str.length).each do |start|
        (start...str.length).each do |last|
            sub = str[start..last]
            subs << sub
        end
    end
    subs.select!{|str| str.length == length} if length
    subs
    
end

def most_frequent_bigram(str)
    bigrams = substrings(str, 2)
    max = 0
    letters = ""
    bigrams.each do |bigram|
         if str.split(bigram).length > max
            max = str.split(bigram).length
            letters = bigram
         end
    end
    letters
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        self.to_h {|k,v| [v,k]}
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        a = []
        # debugger
        self.combination(2) {|combo| a << combo}
        a.select{|pair| pair.sum == num}.length
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
                                # -1(a<b) 0(a=b) 1(a>b) 
        prc ||= Proc.new {|a,b| a<=>b}

        sorted = false
        while !sorted
            sorted = true
            self.each.with_index do |num,i|
                if i < self.length - 1 && prc.call(self[i], self[i+1]) == 1
                    self[i],self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end
        self
    end


end



# a = 999
# b = 999
# n = 1
# test = true

# def is_palindrome(palindromer)
# 	if palindromer.to_s == palindromer.to_s.reverse
# 		true
# 	else
# 		false
# 	end
# end

# while test
# 	if is_palindrome(a * b)
# 		number = a * b
# 		puts a
# 		puts b
# 		puts number
# 		test = false
# 	else
#         if b > 900
#         	b -= 1
#         else
#         	a = 999 - n
#         	b = 999
#         	n += 1
#         end
#     end


# end

# puts a * b

a = 1689515283456000
b = (1..20).to_a
c = []
n = 0
for element in b
    c.push true
end

test = true

puts 'Beginning'

while test
    for element in b
    	if (a % element) == 0
    		c[n] = true
    	else
    		c[n] = false
    	end
    	n += 1
    end
    n = 0
    if (not c.include? false)
    	if a % 2 == 0
    		a /= 2
    		puts a
    	else
    		test = false
    	    puts a
    	end
    end
end
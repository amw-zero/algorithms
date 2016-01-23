str = 'Hi Im a string'

def reverse(str)
	reversed = []
	str.each_char { |c| reversed.insert(0, c) }
	reversed.join	
end

def swap_reverse(str)

end

puts reverse str
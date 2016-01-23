def fac(n)
	r = 1
	n.downto(1) do |i|
		r *= i
	end
	r
end

10.times do |i|
	puts "Factorial(#{i}) = #{fac(i)}"
end

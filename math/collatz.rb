def next_in_chain(n)
  if n.even?
    n / 2
  else
    3 * n + 1
  end
end

def longest_chain(max)
  longest_chain_start = 1
  longest_chain = 1
  1.upto max do |i|
    puts "Checking #{i}"

    chain_length = 1
    start = i
    chain = []
    while start != 1
      chain_length += 1
      start = next_in_chain start
      chain << start
    end

    chain.each do |e|
      print "#{e} -> "
    end

    puts
    puts

    if chain_length > longest_chain
      longest_chain_start = i
      longest_chain = chain_length
    end
  end

  longest_chain_start
end

puts longest_chain ARGV[0].to_i

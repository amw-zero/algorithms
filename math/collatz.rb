def next_in_chain(n)
  if n.even?
    n / 2
  else
    3 * n + 1
  end
end

def calc_chain(start)
  chain = []
  while start != 1
    start = next_in_chain start
    chain << start
  end
  chain.length
end

def longest_chain(max)
  longest_chain_start = 1
  longest_chain = 1
  1.upto max do |i|
    len = calc_chain(i)
    if len > longest_chain
      longest_chain_start = i
      longest_chain = len
    end
  end
  longest_chain_start
end

puts longest_chain(ARGV[0].to_i)

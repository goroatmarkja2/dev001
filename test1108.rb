#!/usr/bin/env ruby

# フィボナッチ数列を表示するスクリプト

def fibonacci(n)
  return [] if n <= 0
  return [0] if n == 1

  sequence = [0, 1]
  (2...n).each do |i|
    sequence << sequence[i-1] + sequence[i-2]
  end
  sequence
end

# 表示する項数（デフォルトは10項）
count = ARGV[0] ? ARGV[0].to_i : 10

puts "フィボナッチ数列（#{count}項）:"
fibonacci(count).each_with_index do |num, index|
  puts "#{index + 1}項目: #{num}"
end

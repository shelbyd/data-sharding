require './lib/neighbors'
require 'yaml'

def path_to(start)
  possibilities = [start]
  run_with_possibilities(possibilities)
end

def run_with_possibilities(possibilities)
  count = 0
  max_column_count = 0
  moving_average_remaining = 0.0
  while possibilities.size > 0
    possibility = possibilities.shift
    # puts "Trying possibility: #{possibility}"
    count += 1
    count %= 10000
    max_column_count = [max_column_count, possibility.column_count].max
    moving_average_remaining = (moving_average_remaining * 99999 + possibilities.size) / 100000
    if count % 1000 == 0
      puts "Have a #{possibility.row_count} by #{possibility.column_count} possibility"
      puts "#{moving_average_remaining.round(2)} possibilities remaining"
      puts "Max width #{max_column_count}"
    end

    if possibility.column_count >= 420
      puts "Found solution:"
      puts possibility
      break
    end
    possibility
      .neighbors
      .each do |neighbor|
        possibilities.unshift neighbor
      end
  end
end

path_to(Matrix[ *([[1]] * 11) ])

#  6 420
#  7 36
#  8 24
#  9 24
# 10 21 (24?)
# 11 21 (24?)
# 12 12

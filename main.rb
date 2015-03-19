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
      if count % 10000 == 0
        File.write('./cache.yaml', YAML.dump(possibilities))
      end
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

if File.exists?('./cache.yaml')
  run_with_possibilities(YAML.load(File.read('./cache.yaml')))
else
  path_to(Matrix[ *([[1]] * 7) ])
end

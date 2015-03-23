require './lib/neighbors'
require 'yaml'

def path_to(start)
  possibilities = [start]
  run_with_possibilities(possibilities)
end

def run_with_possibilities(possibilities)
  count = 0
  least_nil_count = Float::INFINITY
  moving_average_remaining = 0.0
  while possibilities.size > 0
    possibility = possibilities.shift
    count += 1
    count %= 10000
    least_nil_count = [least_nil_count, possibility.select(&:nil?).size].min
    moving_average_remaining = (moving_average_remaining * 99999 + possibilities.size) / 100000
    if count % 1000 == 0
      if count % 10000 == 0
        File.write('./cache.yaml', YAML.dump(possibilities))
      end
      puts "#{moving_average_remaining.round(2)} possibilities remaining"
      puts "Min nils #{least_nil_count}"
    end

    return possibility if possibility.none?(&:nil?)
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
  path_to(Matrix[ *([[nil] * 37] * 7) ])
end

#  6 420
#  7 36
#  8 24
#  9 24
# 10 21 (24?)
# 11 21 (24?)
# 12 12

require './lib/valid'
require './lib/neighbors'

def path_to(start, start_node_count = 1)
  possibilities = [start]
  while possibilities.size > 0
    possibility = possibilities.shift
    # puts "Trying possibility: #{possibility}"
    puts "Have a #{possibility.size} by #{possibility.first.size} possibility"
    if possibility.first.size >= 420
      puts "Found solution:"
      possibility.each { |p| puts p.inspect }
      break
    end
    possibility
      .neighbors
      .select(&:valid?)
      .each do |neighbor|
        possibilities.unshift neighbor
      end
  end
end

path_to([[1]] * 7)

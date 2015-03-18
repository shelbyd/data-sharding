require './lib/valid'
require './lib/neighbors'

def path_to(target_count, start, start_node_count = 1)
  possibilities = [[start_node_count, [start]]]
  while possibilities.size > 0
    possibility = possibilities.shift
    # puts "Trying possibility: #{possibility}"
    node_count = possibility[0]
    possibility[1][-1].with_new_node(node_count)
    .each do |choice|
      return possibility[1] + [choice] if node_count + 1 == target_count
      possibilities.unshift [node_count + 1, possibility[1] + [choice]]
    end
  end
end

path_to(20, [1] * 20, 1).each { |step| puts step.inspect }

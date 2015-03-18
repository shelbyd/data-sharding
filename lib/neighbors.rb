require 'combinatorics/choose'

class Array
  def with_new_block(node_count)
    (1..node_count).map { |i| self + [i] }
  end

  def with_new_node(node_count)
    return [[]] if empty?
    self.class.with_new_node_hash.fetch((self + [node_count]).hash) do
      ((0...size).to_a.choose(size / (node_count + 1) + 1).to_a +
       (0...size).to_a.choose(size / (node_count + 1)).to_a).map do |choice|
        each_with_index.map do |assignment, index|
          choice.include?(index) ? (node_count + 1) : assignment
        end
      end
      .select { |c| c.valid_for? node_count + 1 }
      .uniq
    end
  end

  def self.with_new_node_hash
    @@with_new_node_hash ||= {}
  end
end

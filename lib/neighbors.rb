require 'matrix'

class Matrix
  def neighbors
    if any?(&:nil?)
      row_to_change, column_to_change = each_with_index.select { |e, row, col| e.nil? }.first[1..2]
      [self[row_to_change - 1, column_to_change], row_to_change + 1]
      .select do |choice|
        not (row(row_to_change)
          .each_slice(row_to_change+1)
          .to_a
          .select { |chunk| chunk.compact.size < row_to_change + 1 }
          .last || [])
          .include? choice
      end.map do |choice|
        clone.tap do |mat|
          mat[row_to_change, column_to_change] = choice
        end
      end
    else
      [Matrix[ *(column_vectors + Matrix.column_vector([1] + [nil] * (row_count - 1)).column_vectors) ].t]
    end
  end

  def []=(i, j, x)
    @rows[i][j] = x
  end
end

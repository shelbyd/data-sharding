class Array
  def valid?
    each_with_index.all? do |row, row_index|
      row.none? { |i| i > row_index + 1 } and
      row.each_slice(row_index + 1).all? do |slice|
        slice
          .group_by { |i| i }
          .values
          .map(&:size)
          .none? { |i| i > 1 }
      end and
      row.each_with_index.all? do |element, column_index|
        (element == row_index + 1) ||
        (element == self[row_index-1][column_index])
      end
    end
  end
end

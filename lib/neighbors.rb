class Array
  def neighbors
    next_rows = each_with_index.map do |row, index|
      options_for_row(index).map do |option|
        row + [option]
      end
    end

    next_rows.drop(1).reduce([next_rows.first]) do |result, rows|
      result.product(rows).map do |r|
        r.first + [r.last]
      end
    end
  end

  def options_for_row(index)
    row = self[index]
    result = (1..index+1).to_a - row.each_slice(index + 1).to_a.last
    result = (1..index+1).to_a if result.size == 0
    options_for_previous_row = index == 0 ? [] : options_for_row(index - 1)
    result
      .select { |item| (item == index+1) || options_for_previous_row.include?(item) }
  end
end

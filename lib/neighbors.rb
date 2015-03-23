require 'matrix'
require 'combinatorics'

class Matrix
  def neighbors
    if any?(&:nil?)
      if first_row_with_nils == 0
        return [clone.tap do |m|
          m.each_with_index do |e, row, col|
            m[row, col] = 1 if row == 0
          end
        end]
      end
      if duplicate_cols.size == 2
        duplicate_cols.map { |c| c + first_col_with_nils }.map do |duplicate_col|
          clone.tap do |m|
            (first_col_with_nils..first_col_with_nils+first_row_with_nils).each do |col|
              m[first_row_with_nils, col] = m[first_row_with_nils-1, col]
            end
            m[first_row_with_nils, duplicate_col] = first_row_with_nils+1
          end
        end
      elsif duplicate_cols.size > 0
        []
      else
        [clone.tap do |m|
          (first_col_with_nils..first_col_with_nils+first_row_with_nils).each do |col|
            m[first_row_with_nils, col] = m[first_row_with_nils-1, col] if col < column_count
          end
        end]
      end
    else
      [self]
    end
  end

  def first_row_with_nils
    @first_row_with_nils ||= each_with_index
      .select { |e, row, col| e.nil? }
      .map { |e, row, col| row }
      .min
  end

  def first_col_with_nils
    @first_col_with_nils ||= rows[first_row_with_nils]
      .each_with_index
      .select { |e, col| e.nil? }
      .map { |e, col| col }
      .min
  end

  def previous_row
    @previous_row ||= rows[first_row_with_nils-1][first_col_with_nils..first_col_with_nils+first_row_with_nils]
  end

  def duplicate_cols
    @duplicate_cols ||= previous_row.each_with_index.select do |e, col|
      previous_row.select { |el| e == el }.size > 1
    end.map { |e, col| col }
  end

  def []=(i, j, x)
    @rows[i][j] = x
  end
end

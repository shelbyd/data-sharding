class Array
  def valid_for?(value)
    hash = validity_hash(value)

    empty? or
    (none? { |assignment| assignment > value} and
     hash.values.max - hash.values.min <= 1 and
     self[0...-1].valid_for? value)
  end

  private

  def validity_hash(value)
    reduce({}) do |hash, assignment|
      new_hash = {}
      new_hash[assignment] = 1 + hash.fetch(assignment, 0)
      hash.merge(new_hash)
    end.tap do |hash|
      (1..value).each { |i| hash[i] ||= 0 }
    end
  end
end

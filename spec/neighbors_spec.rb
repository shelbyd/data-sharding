require 'spec_helper'
require './lib/neighbors'

describe 'Array#neighbors' do
  subject { array.neighbors }

  describe '[[1]]' do
    let(:array) { [[1]] }
    it { is_expected.to match_array [[[1, 1]]] }
  end

  describe '[[1, 1]]' do
    let(:array) { [[1, 1]] }
    it { is_expected.to match_array [[[1, 1, 1]]] }
  end

  describe '[[1], [1]]' do
    let(:array) { [[1], [1]] }
    it { is_expected.to match_array [[[1, 1], [1, 2]]] }
  end

  describe '[[1], [2]]' do
    let(:array) { [[1], [2]] }
    it { is_expected.to match_array [[[1, 1], [2, 1]]] }
  end

  describe '[[1, 1], [2, 1]]' do
    let(:array) { [[1, 1], [2, 1]] }
    it { is_expected.to match_array [
      [[1, 1, 1], [2, 1, 1]],
      [[1, 1, 1], [2, 1, 2]]
    ] }
  end

  describe '[[1, 1, 1, 1], [2, 1, 2, 1], [3, 2, 1, 1]]' do
    let(:array) { [[1, 1, 1, 1], [2, 1, 2, 1], [3, 2, 1, 1]] }
    it { is_expected.to match_array [
      [[1, 1, 1, 1, 1], [2, 1, 2, 1, 2], [3, 2, 1, 1, 2]],
      [[1, 1, 1, 1, 1], [2, 1, 2, 1, 2], [3, 2, 1, 1, 3]],
      [[1, 1, 1, 1, 1], [2, 1, 2, 1, 1], [3, 2, 1, 1, 2]],
      [[1, 1, 1, 1, 1], [2, 1, 2, 1, 1], [3, 2, 1, 1, 3]]
    ] }
  end
end

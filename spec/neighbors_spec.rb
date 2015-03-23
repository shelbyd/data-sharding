require 'spec_helper'
require './lib/neighbors'

describe 'Matrix#neighbors' do
  subject { Matrix[*array].neighbors }

  describe [[nil, nil, nil]] do
    let(:array) { [[nil, nil, nil]] }
    it { is_expected.to match_array [ Matrix[[1, 1, 1]] ] }
  end

  describe [[1]] do
    let(:array) { [[1]] }
    it { is_expected.to match_array [ Matrix[[1]] ] }
  end

  describe [[1], [nil]] do
    let(:array) { [[1], [nil]] }
    it { is_expected.to match_array [ Matrix[[1], [1]] ] }
  end

  describe [[1, 1], [nil, nil]] do
    let(:array) { [[1, 1], [nil, nil]] }
    it { is_expected.to match_array [
      Matrix[[1, 1], [1, 2]],
      Matrix[[1, 1], [2, 1]],
    ] }
  end

  describe [[1, 1, 1, 1, 1], [1, 2, 1, 2, 1], [1, 2, 3, nil, nil]] do
    let(:array) { [[1, 1, 1, 1, 1], [1, 2, 1, 2, 1], [1, 2, 3, nil, nil]] }
    it { is_expected.to match_array [
      Matrix[[1, 1, 1, 1, 1], [1, 2, 1, 2, 1], [1, 2, 3, 2, 1]],
    ] }
  end

  describe [[1, 1, 1, 1, 1], [1, 2, 1, 2, 1], [nil, nil, nil, nil, nil]] do
    let(:array) { [[1, 1, 1, 1, 1], [1, 2, 1, 2, 1], [nil, nil, nil, nil, nil]] }
    it { is_expected.to match_array [
      Matrix[[1, 1, 1, 1, 1], [1, 2, 1, 2, 1], [1, 2, 3, nil, nil]],
      Matrix[[1, 1, 1, 1, 1], [1, 2, 1, 2, 1], [3, 2, 1, nil, nil]],
    ] }
  end

  describe [[1, 1, 1, 1, 1], [1, 2, 1, 2, 1], [3, 2, 3, 2, 1], [nil, nil, nil, nil, nil]] do
    let(:array) { [[1, 1, 1, 1, 1], [1, 2, 1, 2, 1], [3, 2, 3, 2, 1], [nil, nil, nil, nil, nil]] }
    it { is_expected.to match_array [ ] }
  end

  describe [[1, 1, 1, 1, 1, 1], [1, 2, 1, 2, 1, 2], [1, 2, 3, nil, nil, nil]] do
    let(:array) { [[1, 1, 1, 1, 1, 1], [1, 2, 1, 2, 1, 2], [1, 2, 3, nil, nil, nil]] }
    it { is_expected.to match_array [
      Matrix[[1, 1, 1, 1, 1, 1], [1, 2, 1, 2, 1, 2], [1, 2, 3, 3, 1, 2]],
      Matrix[[1, 1, 1, 1, 1, 1], [1, 2, 1, 2, 1, 2], [1, 2, 3, 2, 1, 3]],
    ] }
  end
end

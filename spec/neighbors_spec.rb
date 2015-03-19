require 'spec_helper'
require './lib/neighbors'

describe 'Matrix#neighbors' do
  subject { Matrix[*array].neighbors }

  describe [[1]] do
    let(:array) { [[1]] }
    it { is_expected.to match_array [ Matrix[[1, 1]] ] }
  end

  describe [[1], [1]] do
    let(:array) { [[1], [1]] }
    it { is_expected.to match_array [ Matrix[[1, 1], [1, nil]] ] }
  end

  describe [[1, 1], [1, nil]] do
    let(:array) { [[1, 1], [1, nil]] }
    it { is_expected.to match_array [ Matrix[[1, 1], [1, 2]] ] }
  end

  describe [[1, 1], [2, nil]] do
    let(:array) { [[1, 1], [2, nil]] }
    it { is_expected.to match_array [ Matrix[[1, 1], [2, 1]] ] }
  end

  describe [[1, 1], [2, 1]] do
    let(:array) { [[1, 1], [2, 1]] }
    it { is_expected.to match_array [ Matrix[[1, 1, 1], [2, 1, nil]] ] }
  end

  describe [[1, 1, 1], [2, 1, nil]] do
    let(:array) { [[1, 1, 1], [2, 1, nil]] }
    it { is_expected.to match_array [
      Matrix[[1, 1, 1], [2, 1, 1]],
      Matrix[[1, 1, 1], [2, 1, 2]],
    ] }
  end

  describe [[1, 1, 1], [2, 1, 2], [1, 2, nil]] do
    let(:array) { [[1, 1, 1], [2, 1, 2], [1, 2, nil]] }
    it { is_expected.to match_array [
      Matrix[ [1, 1, 1], [2, 1, 2], [1, 2, 3] ]
    ] }
  end

  describe [[1, 1, 1, 1], [2, 1, 1, 2], [2, 1, 1, nil]] do
    let(:array) { [[1, 1, 1, 1], [2, 1, 1, 2], [2, 1, 1, nil]] }
    it { is_expected.to match_array [
      Matrix[ [1, 1, 1, 1], [2, 1, 1, 2], [2, 1, 1, 3] ],
      Matrix[ [1, 1, 1, 1], [2, 1, 1, 2], [2, 1, 1, 2] ]
    ] }
  end
end

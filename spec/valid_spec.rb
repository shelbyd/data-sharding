require 'spec_helper'
require './lib/valid'

describe 'Array#valid' do
  describe '[]' do
    subject { [] }
    it { is_expected.to be_valid }
  end

  describe '[[1]]' do
    subject { [[1]] }
    it { is_expected.to be_valid }
  end

  describe '[[1, 1]]' do
    subject { [[1, 1]] }
    it { is_expected.to be_valid }
  end

  describe '[[1, 2]]' do
    subject { [[1, 2]] }
    it { is_expected.to_not be_valid }
  end

  describe '[[1, 1], [1, 1]]' do
    subject { [[1, 1], [1, 1]] }
    it { is_expected.to_not be_valid }
  end

  describe '[[1, 1], [1, 2]]' do
    subject { [[1, 1], [1, 2]] }
    it { is_expected.to be_valid }
  end

  describe '[[1, 1, 1], [1, 2, 1], [1, 2, 3]]' do
    subject { [[1, 1, 1], [1, 2, 1], [1, 2, 3]] }
    it { is_expected.to be_valid }
  end

  describe '[[1, 1, 1], [1, 2, 1], [2, 1, 3]]' do
    subject { [[1, 1, 1], [1, 2, 1], [2, 1, 3]] }
    it { is_expected.to_not be_valid }
  end
end

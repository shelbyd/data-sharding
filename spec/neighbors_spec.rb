require 'spec_helper'
require './lib/neighbors'

describe 'Array'  do
  describe '#with_new_block' do
    subject { array.with_new_block nodes }
    describe '[]' do
      let(:array) { [] }
      describe 'for 1 node' do
        let(:nodes) { 1 }
        it { is_expected.to eq [[1]] }
      end

      describe 'for 3 nodes' do
        let(:nodes) { 3 }
        it { is_expected.to eq [[1], [2], [3]] }
      end
    end

    describe '[1]' do
      let(:array) { [1] }
      describe 'for 1 node' do
        let(:nodes) { 1 }
        it { is_expected.to eq [[1, 1]] }
      end

      describe 'for 3 nodes' do
        let(:nodes) { 3 }
        it { is_expected.to eq [[1, 1], [1, 2], [1, 3]] }
      end
    end

    describe '[1, 2]' do
      let(:array) { [1, 2] }
      describe 'for 1 node' do
        let(:nodes) { 1 }
        it { is_expected.to eq [[1, 2, 1]] }
      end

      describe 'for 3 nodes' do
        let(:nodes) { 3 }
        it { is_expected.to eq [[1, 2, 1], [1, 2, 2], [1, 2, 3]] }
      end
    end
  end

  describe '#with_new_node' do
    subject { array.with_new_node nodes }
    describe '[]' do
      let(:array) { [] }
      describe 'for 1 node' do
        let(:nodes) { 1 }
        it { is_expected.to eq [[]] }
      end

      describe 'for 3 nodes' do
        let(:nodes) { 3 }
        it { is_expected.to eq [[]] }
      end
    end

    describe '[1]' do
      let(:array) { [1] }
      describe 'for 1 node' do
        let(:nodes) { 1 }
        it { is_expected.to match_array [[1], [2]] }
      end

      describe 'for 3 nodes' do
        let(:nodes) { 3 }
        it { is_expected.to match_array [[1], [4]] }
      end
    end

    describe '[1, 1]' do
      let(:array) { [1, 1] }
      describe 'for 1 node' do
        let(:nodes) { 1 }
        it { is_expected.to match_array [[2, 1], [1, 2]] }
      end

      describe 'for 3 nodes' do
        let(:nodes) { 3 }
        it { is_expected.to match_array [[1, 4], [4, 1]] }
      end
    end

    describe '[1, 1, 1]' do
      let(:array) { [1, 1, 1] }
      describe 'for 1 node' do
        let(:nodes) { 1 }
        it { is_expected.to match_array [[1, 2, 1], [2, 1, 2], [2, 1, 1], [1, 2, 2]] }
      end

      describe 'for 2 nodes' do
        let(:nodes) { 2 }
        it { is_expected.to match_array [] }
      end
    end

    describe '[1, 2]' do
      let(:array) { [1, 2] }
      describe 'for 2 nodes' do
        let(:nodes) { 2 }
        it { is_expected.to match_array [[1, 3], [3, 2], [1, 2]] }
      end
    end
  end
end

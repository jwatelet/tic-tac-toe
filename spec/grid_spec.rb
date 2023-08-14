require './lib/grid'

describe Grid do
  let(:array) { nil }
  let(:grid) { Grid.new(grid: array) }

  describe '#horizontal_line?' do
    let(:array) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
    describe 'when grid is not fill with symbols (X and O)' do
      it 'returns false' do
        expect(grid.horizontal_line?('X')).to eql(false)
      end
    end

    describe 'when grid has a symbol horizontal line' do
      let(:array) { [%w[X X X], [4, 5, 6], [7, 8, 9]] }
      it 'returns true' do
        expect(grid.horizontal_line?('X')).to eql(true)
      end
    end

    describe 'when grid has a symbol but not in horizontal line' do
      let(:array) { [['X', 'X', 3], [4, 5, 6], [7, 8, 9]] }
      it 'returns false' do
        expect(grid.horizontal_line?('X')).to eql(false)
      end
    end
  end

  describe '#vertical_line?' do
    let(:array) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
    describe 'when grid is not fill with symbols (X and O)' do
      it 'returns false' do
        expect(grid.vertical_line?('X')).to eql(false)
      end
    end

    describe 'when grid has a symbol horizontal line' do
      let(:array) { [['X', 2, 3], ['X', 5, 6], ['X', 8, 9]] }
      it 'returns true' do
        expect(grid.vertical_line?('X')).to eql(true)
      end
    end

    describe 'when grid has a symbol but not in vertical line' do
      let(:array) { [['X', 2, 3], ['X', 5, 6], [7, 8, 9]] }
      it 'returns false' do
        expect(grid.horizontal_line?('X')).to eql(false)
      end
    end
  end

  describe '#diagonal_line?' do
    let(:array) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
    describe 'when grid is not fill with symbols (X and O)' do
      it 'returns false' do
        expect(grid.diagonal_line?('X')).to eql(false)
      end
    end

    describe 'when grid has a symbol horizontal line' do
      let(:array) { [['X', 2, 3], [4, 'X', 6], [7, 8, 'X']] }
      it 'returns true' do
        expect(grid.diagonal_line?('X')).to eql(true)
      end
    end

    describe 'when grid has a symbol but not in vertical line' do
      let(:array) { [['X', 2, 3], ['X', 5, 6], [7, 8, 9]] }
      it 'returns false' do
        expect(grid.diagonal_line?('X')).to eql(false)
      end
    end
  end
end

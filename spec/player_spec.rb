require './lib/player'
require './lib/grid'

describe Player do
  let(:name) { 'Jack' }
  let(:symbol) { 'K' }
  let(:grid) { Grid.new }
  let(:player) { Player.new(symbol, name, grid) }
  describe '#initialize' do
    it 'has the right name' do
      expect(player.name).to eql(name)
    end

    it 'has the right symbol' do
      expect(player.symbol).to eql(symbol)
    end
  end

  describe '#win' do
    describe 'when the grid is the default one' do
      it 'returns false' do
        expect(player.win?).to eql(false)
      end
    end

    describe 'when the grid has a line' do
      let(:grid) { Grid.new(grid: [[symbol, symbol, symbol], [4, 5, 6], [7, 8, 9]]) }

      it "returns true" do
        expect(player.win?).to eql(true)
      end
    end
  end
end

require 'game'

RSpec.describe Game do
  let(:game) { Game.new }

  context 'gutter game' do
    it do
      roll_many 20, 0
      expect(game.score).to eq 0
    end
  end

  context 'all ones' do
    it do
      roll_many 20, 1
      expect(game.score).to eq 20
    end
  end

  context 'one spare' do
    it do
      roll_spare
      game.roll 3
      roll_many 17, 0
      expect(game.score).to eq 16
    end
  end

  context 'one strike' do
    it do
      roll_strike
      game.roll 3
      game.roll 4
      roll_many 16, 0
      expect(game.score).to eq 24
    end
  end

  context 'perfect game' do
    it do
      roll_many 12, 10
      expect(game.score).to eq 300
    end
  end

  def roll_strike
    game.roll 10
  end

  def roll_many(n, pins)
    n.times { game.roll(pins) }
  end

  def roll_spare
    game.roll 5
    game.roll 5
  end
end

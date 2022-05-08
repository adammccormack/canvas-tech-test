require 'canvas'

describe Canvas do

  it { is_expected.to respond_to(:create).with(2).argument }

  describe '#create' do
    it 'creates a new canvas with the two arguments given' do
      canvas = Canvas.new

      canvas.create(5,6)

      expect(canvas).to eq(30)
    end
  end

end
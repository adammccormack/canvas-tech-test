require 'canvas_app'

describe CanvasApp do

  it { is_expected.to respond_to(:create).with(2).argument }

  it { is_expected.to respond_to(:size) }

  describe '#create' do
    it 'creates a new canvas with the two arguments given' do
      canvas = CanvasApp.new

      expect(canvas.create(10,10)).to be_truthy
    end
  end

  describe '#size' do
    it 'returns the size of the canvas' do
      canvas = CanvasApp.new

      canvas.create(10,10)

      expect(canvas.size).to eq(100)
    end
  end
end
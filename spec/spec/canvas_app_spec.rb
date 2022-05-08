require 'canvas_app'

describe CanvasApp do

  it { is_expected.to respond_to(:create).with(2).argument }

  it { is_expected.to respond_to(:size).with(1).argument }

  describe '#create' do
    it 'creates a new canvas with the two arguments given' do
      canvas = CanvasApp.new

      expect(canvas.create(5,6)).to be_truthy
    end
  end

  describe '#size' do
    it 'returns the size of the canvas' do
      canvas = CanvasApp.new

      new_canvas = canvas.create(5,6)

      expect(canvas.size(new_canvas)).to eq(30)
    end
  end
end
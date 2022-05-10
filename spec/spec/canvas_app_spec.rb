require 'canvas_app'

describe CanvasApp do

  it { is_expected.to respond_to(:create).with(2).argument }
  it { is_expected.to respond_to(:size) }
  it { is_expected.to respond_to(:show) }

  describe '#create' do
    it 'creates a new canvas with row & col arguments' do
      canvas = CanvasApp.new

      canvas.create(10,10)
      
      expect(canvas.show).to be_truthy
    end
  end

  describe '#size' do
    it 'returns the size of the canvas' do
      canvas = CanvasApp.new

      canvas.create(10,10)

      expect(canvas.size).to eq(100)
    end
  end

  describe '#clear' do
    it 'clears the canvas' do
      canvas1 = CanvasApp.new
      canvas1.create(2,2)
      test_array = [["O", "O"], ["O", "O"]]

      canvas1.fill(0,0)
      canvas1.clear
      
      expect(canvas1.show).to match_array(test_array)
    end
  end

  # created_canvas1 = canvas1.create(2,2)
  # canvas2 = CanvasApp.new
  # canvas2.create(2,2)

end
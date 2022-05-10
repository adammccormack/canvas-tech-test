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
      canvas = CanvasApp.new
      canvas.create(2,2)
      test_array = [["O", "O"], ["O", "O"]]

      canvas.fill(0,0)
      canvas.clear
      
      expect(canvas.show).to match_array(test_array)
    end
  end

  describe '#scale' do
    it 'scales the canvas up or down by percentage input' do
      canvas = CanvasApp.new
      canvas.create(2,2)

      canvas.scale(200)

      expect(canvas.size).to eq(4)
    end
  end

  describe '#size' do
    it 'returns the current size of the canvas' do
      canvas = CanvasApp.new
      canvas.create(2,2)

      expect(canvas.size).to eq(4)
    end
  end

  describe '#show' do
    it 'returns the grid array layout of the canvas' do
      canvas = CanvasApp.new
      canvas.create(5,5)

      test_array = 
      [["O", "O", "O", "O", "O"],                             
      ["O", "O", "O", "O", "O"],                             
      ["O", "O", "O", "O", "O"],                             
      ["O", "O", "O", "O", "O"],                             
      ["O", "O", "O", "O", "O"]]

      expect(canvas.show).to match_array(test_array)
    end
  end

  describe 'colour_pixel' do
    it 'colours a single specified position on canvas' do
      canvas = CanvasApp.new
      canvas.create(2,2)
      test_array = [["X", "O"], ["O", "X"]]

      canvas.colour_pixel(0,0,'X')
      canvas.colour_pixel(1,1,'X')

      expect(canvas.show).to match_array(test_array)
    end
  end

  # created_canvas1 = canvas1.create(2,2)
  # canvas2 = CanvasApp.new
  # canvas2.create(2,2)

end
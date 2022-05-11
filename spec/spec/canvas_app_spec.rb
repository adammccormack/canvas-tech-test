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

      canvas.fill(0,0,'X')
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

  describe '#colour_pixel' do
    it 'colours a single specified position on canvas' do
      canvas = CanvasApp.new
      canvas.create(2,2)
      test_array = [["X", "O"], ["O", "X"]]

      canvas.colour_pixel(0,0,'X')
      canvas.colour_pixel(1,1,'X')

      expect(canvas.show).to match_array(test_array)
    end
  end

  describe '#fill' do
    context 'when canvas is one colour' do
      it 'fills the whole canvas' do
        canvas = CanvasApp.new
        canvas.create(2,2)
        test_array = [["X", "X"], ["X", "X"]]
      
        canvas.fill(0,0,'X')

        expect(canvas.show).to match_array(test_array)
      end
    end

    context 'when filling inside a shape' do
      it 'fills the shape' do
        canvas = CanvasApp.new
        canvas.create(6,6)
        test_array2 = 
        [["O", "X", "X", "X", "X", "O"],                        
        ["O", "X", "X", "X", "X", "O"],                        
        ["O", "X", "X", "X", "X", "O"],                        
        ["O", "X", "X", "X", "X", "O"],                        
        ["O", "X", "X", "X", "X", "O"],                        
        ["O", "X", "X", "X", "X", "O"]]

        # draw the square
        canvas.vert_draw(0,5,1,'X')
        canvas.vert_draw(0,5,4,'X')
        canvas.horiz_draw(1,4,0,'X')
        canvas.horiz_draw(1,4,5,'X')
        canvas.fill(3,2,'X')

        
        expect(canvas.show).to match_array(test_array2)
      end
    end
  end

  describe '#vert_draw' do
    it 'fills the column between vertical two points' do
      canvas = CanvasApp.new
      canvas.create(5,5)
      test_array = 
      [["O", "O", "O", "O", "O"],                             
      ["O", "O", "X", "O", "O"],                             
      ["O", "O", "X", "O", "O"],                             
      ["O", "O", "X", "O", "O"],                             
      ["O", "O", "O", "O", "O"]]

      canvas.vert_draw(1,3,2,'X')
      
      expect(canvas.show).to match_array(test_array)
    end
  end

  describe '#horiz_draw' do
    it 'fills a canvas line between two horizontal points' do
      canvas = CanvasApp.new
      canvas.create(5,5)
      

      test_array = 
      [["O", "O", "O", "O", "O"],                                                  
      ["O", "O", "O", "O", "O"],                                                  
      ["O", "X", "X", "X", "O"],                                                  
      ["O", "O", "O", "O", "O"],                                                  
      ["O", "O", "O", "O", "O"]] 

      canvas.horiz_draw(1,3,2,'X')

      expect(canvas.show).to match_array(test_array)
    end
  end
end
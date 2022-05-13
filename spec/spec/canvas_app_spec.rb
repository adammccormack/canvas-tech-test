require 'canvas_app'
require 'help'

# change the arrays to shorthand [%w[0 0], %w[0 0]]
# use let statements between describe and setup

describe CanvasApp do
  let(:fake_help_object) { double("Help text", text: 'Hello I am some helpful text') }
  subject(:canvas) { described_class.new(fake_help_object) }

  it { is_expected.to respond_to(:create).with(2).argument }
  it { is_expected.to respond_to(:show) }

  describe '#create' do
    it 'creates a new canvas with row & col arguments' do
      canvas.create(10,10)
      
      expect(canvas.show).to be_truthy
    end
  end

  describe '#clear' do
    let (:output) { [%w[O O], %w[O O]] }
    it 'clears the canvas' do
      canvas.create(2,2)

      canvas.fill(0,0,'X')
      canvas.clear
      
      expect(canvas.show).to match_array(output)
    end
  end

  describe '#scale' do
    it 'scales the canvas up or down by percentage input' do
      canvas.create(2,2)

      canvas.scale(200)

      expect(canvas.size).to eq(8)
    end
  end

  describe '#size' do
    it 'returns the current size of the canvas' do
      canvas.create(2,2)

      expect(canvas.size).to eq(4)
    end
  end


  describe '#show' do
    let (:output) { [%w[O O O O O],
                     %w[O O O O O],
                     %w[O O O O O],
                     %w[O O O O O],
                     %w[O O O O O]]
                  }
    it 'returns the grid array layout of the canvas' do
      canvas.create(5,5)

      expect(canvas.show).to match_array(output)
    end
  end

  describe '#colour_pixel' do
    let (:output) {[%w[X O], %w[O X]]}
    it 'colours a single specified position on canvas' do
      canvas.create(2,2)

      canvas.colour_pixel(0,0,'X')
      canvas.colour_pixel(1,1,'X')

      expect(canvas.show).to match_array(output)
    end
  end

  describe '#fill' do
    let (:output) {[%w[X X], %w[X X]]}
    context 'when canvas is one colour' do
      it 'fills the whole canvas' do
        canvas.create(2,2)
        # output = [%w[X X], %w[X, X]]
      
        canvas.fill(0,0,'X')

        expect(canvas.show).to match_array(output)
      end
    end

    context 'when filling inside a shape' do
      let (:output) { [%w[O X X X X O],
                       %w[O X X X X O],
                       %w[O X X X X O],
                       %w[O X X X X O],
                       %w[O X X X X O],
                       %w[O X X X X O]]     
                    }
      it 'fills the shape' do
        canvas.create(6,6)
       
        # draw a square
        canvas.vert_paint(0,5,1,'X')
        canvas.vert_paint(0,5,4,'X')
        canvas.horiz_paint(1,4,0,'X')
        canvas.horiz_paint(1,4,5,'X')
        canvas.fill(3,2,'X')

        expect(canvas.show).to match_array(output)
      end
    end
  end

  describe '#vert_paint' do
    let (:output) { [%w[O O O O O],
                     %w[O O X O O],
                     %w[O O X O O],
                     %w[O O X O O],
                     %w[O O O O O]]
                    }
    it 'fills the column between vertical two points' do
      canvas.create(5,5)

      canvas.vert_paint(1,3,2,'X')

      expect(canvas.show).to match_array(output)
    end
  end

  describe '#horiz_paint' do
    let (:output) { [%w[O O O O O],
                     %w[O O O O O],
                     %w[O X X X O],
                     %w[O O O O O],
                     %w[O O O O O]]
                  } 
    it 'fills a canvas line between two horizontal points' do
      canvas.create(5,5)
      
      canvas.horiz_paint(1,3,2,'X')

      expect(canvas.show).to match_array(output)
    end
  end

  describe '#help' do
    it 'returns app instructions' do
      expect(canvas.instructions).to eq('Hello I am some helpful text')
    end
  end
end
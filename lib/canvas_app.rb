class CanvasApp

  def create(x, y)
    Array.new(y) { Array.new(x, 'O') }
  end

  def size(array)
    @size = array.flatten(1).count
  end

end
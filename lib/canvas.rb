
class Canvas

  def create(x, y)
    Array.new(y) { Array.new(x, 'O') }
  end

end
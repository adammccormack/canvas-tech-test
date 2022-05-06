require 'canvas'

describe Canvas do

  it { is_expected.to respond_to(:create).with(2).argument }

end
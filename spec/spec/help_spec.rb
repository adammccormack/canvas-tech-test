require 'help'

describe Help do
  subject(:help) { described_class.new }

  it { is_expected.to respond_to(:text) }

  describe '#text' do
    it 'returns app instructions' do
      help = Help.new
      
      expect(help.text).to match(/I M N/)
      expect(help.text).to match(/C/)
      expect(help.text).to match(/W F/)
      expect(help.text).to match(/S/)
      expect(help.text).to match(/L X Y C/)
      expect(help.text).to match(/F X Y C/)
      expect(help.text).to match(/V X Y1 Y2 C/)
      expect(help.text).to match(/H X1 X2 Y C/)
      expect(help.text).to match(/F X Y C/)
      expect(help.text).to match(/X - Exit Program/)
      expect(help.text).to match(/'? - Help'/)
      
    end
  end
end


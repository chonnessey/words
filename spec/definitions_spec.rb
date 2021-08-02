require 'rspec'
require 'pry'
require 'definitions'

describe '#Definitions' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word= Word.new("Defeat", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("To lose", @word.id, nil)
      definition2 = Definition.new("To lose", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end
end
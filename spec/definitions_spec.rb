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

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("To lose", @word.id, nil)
      definition.save
      definition2 = Definition.new("To win", @word.id, nil)
      definition2.save
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end
end
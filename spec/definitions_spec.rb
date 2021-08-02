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

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("To lose", @word.id, nil)
      definition.save
      definition2 = Definition.new("To win", @word.id, nil)
      definition2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definitino") do
      definition = Definition.new("To lose", @word.id, nil)
      definition.save
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("To lose", @word.id, nil)
      definition.save
      definition2 = Definition.new("To win", @word.id, nil)
      definition2.save
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition = Definition.new("To lose", @word.id, nil)
      definition.save
      definition.update("To tie", @word.id)
      expect(definition.definition).to(eq("To tie"))
    end
  end

  describe('#delete') do
    it("deletes an song by id") do
      definition = Definition.new("To lose", @word.id, nil)
      definition.save
      definition2 = Definition.new("To win", @word.id, nil)
      definition2.save
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
end
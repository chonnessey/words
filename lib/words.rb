class Word
  attr_reader :word, :id

  @@words = {}
  @@total_rows = 0

  def initialize(word)
    @word = word
  end

  def self.all 
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.word, self.id)
  end
  
end
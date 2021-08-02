class Definition
  attr_accessor :definition, :word_id
  attr_reader :id

  @@definitions = {}
  @@total_rows = 0

  def initialize(definition, id)
    @definition = definition
    @id = id || @@total_rows += 1
  end

  
end
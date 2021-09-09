class Character
  attr_accessor :id, :name, :spells_obtained, :needed_spell_ids

  def initialize(id)
    @id = id
    response_body = HTTParty.get("https://ffxivcollect.com/api/characters/" + id.to_s + "?ids=1")
    @name = response_body["name"]
    @spell_book = CharacterSpellBook.new(response_body["spells"])
  end

  def name
    @name
  end

  def obtained_spell_ids
    @spell_book.obtained_spell_ids
  end

  def needed_spell_ids
    @spell_book.needed_spell_ids
  end

end
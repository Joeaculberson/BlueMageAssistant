class Character
  attr_accessor :id, :name, :spells_obtained, :needed_spell_ids

  def initialize(id)
    @id = id
    response_body = HTTParty.get("https://ffxivcollect.com/api/characters/" + id.to_s + "?ids=latest")
    if response_body
      @name = response_body["name"]
      @avatar = response_body["avatar"]
      p response_body
      @spell_book = CharacterSpellBook.new(response_body["spells"])
    else
      raise Exception.new 'User ' + id.to_s + ' has not filled out their spell book.'
    end
  end

  def name
    @name
  end
  def avatar
    @avatar
  end

  def obtained_spell_ids
    @spell_book.obtained_spell_ids
  end

  def needed_spell_ids
    @spell_book.needed_spell_ids
  end

end
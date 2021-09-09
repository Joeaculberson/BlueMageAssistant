class Character
  attr_accessor :id, :name, :spells_obtained, :needed_spell_ids
  def initialize(id, name, spells_obtained)
    @id = id
    @name = name
    @spells_obtained = spells_obtained
  end

  def spells_needed
    @spells_needed
  end

  def needed_spell_ids=(needed_spell_ids)
    @needed_spell_ids = needed_spell_ids
  end
end
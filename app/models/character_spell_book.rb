class CharacterSpellBook

  def initialize(spells)
    @total_number_of_spells = spells['total']
    @obtained_spell_ids = spells['ids']
    @needed_spell_ids = set_needed_spell_ids
  end

  def needed_spell_ids
    @needed_spell_ids
  end

  def total_number_of_spells
    @total_number_of_spells
  end

  private

  def set_needed_spell_ids
    needed_spell_ids = []
    i = 1
    while i < @total_number_of_spells
      if @obtained_spell_ids.exclude? i
        needed_spell_ids.push(i)
      end
      i += 1
    end
    needed_spell_ids
  end

end
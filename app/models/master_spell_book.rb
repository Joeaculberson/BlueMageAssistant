class MasterSpellBook

  MASTER_SPELL_BOOK_URL = 'https://ffxivcollect.com/api/spells'

  def initialize(file_name)
    if File.zero?(file_name)
      update_master_spell_book_file
    end

    @data_hash = parse_file(file_name)
  end

  def spells
    @data_hash['results']
  end

  # Future-proofing application
  # If a user needs a spell that has a number that is greater than the highest number spell in the book,
  # pull latest master spell book as the game has been updated with new blue spells
  def update_master_spell_book(character)
    if character.needed_spell_ids.any?{|x| x > @data_hash['count'] }
      @master_spell_book.update_master_spell_book_file
    end
  end

  private

  def parse_file(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end

  def update_master_spell_book_file
    p "Updating spell_book.json"
    response_body = HTTParty.get(MASTER_SPELL_BOOK_URL)
    File.open('spell_book.json', 'wb') { |file| file.write(response_body)}
  end

end
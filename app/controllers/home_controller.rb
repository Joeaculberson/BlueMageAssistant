require 'httparty'
require 'pp'

class HomeController < ApplicationController


  def index
    # scrat 30427225
    # vandal 1551939
    # rhel 6823640
    # Owran 24372265
    # Sardine 117129
    # Raenara Noykin
    user_ids = Array [692625, 30427225, 31883647, 1551939, 117129]

    p user_ids
    @master_spell_book = MasterSpellBook.new('spell_book.json')
    @characters = get_characters(user_ids)
    @everyone_needs_ids = get_everyone_needs_ids(@characters)
  end

  private

  def get_everyone_needs_ids(characters)
    everyone_needs_ids = []
    characters.each do |character|
      p
      if everyone_needs_ids.length > 0
        everyone_needs_ids = everyone_needs_ids & character.needed_spell_ids
      else
        everyone_needs_ids = character.needed_spell_ids
      end
    end
    everyone_needs_ids
  end

  def get_characters(user_ids)
    characters = []
    user_ids.each do |user_id|
      character = Character.new(user_id)
      @master_spell_book.update_master_spell_book(character)
      characters.push(character)
    end
    characters
  end

end
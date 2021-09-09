require 'httparty'
require 'pp'

class ArticlesController < ApplicationController

  def index
    file = File.read('spell_book.json')
    data_hash = JSON.parse(file)
    @spell_book =  data_hash['results']

    # scrat 30427225
    # vandal 1551939
    # rhel 6823640
    @characters = []
    total_spells = 0
    user_ids = Array[30427225, 1551939, 6823640]
    user_ids.each do |user_id|
      response_body = HTTParty.get("https://ffxivcollect.com/api/characters/" + user_id.to_s + "?ids=1")
      character = Character.new(user_id, response_body["name"], response_body["spells"]["ids"])
      total_spells = response_body["spells"]["total"]
      @characters.push(character)
    end

    @everyone_needs = []

    @characters.each do |character|
      i = 1
      needed_spell_ids = []
      while i < total_spells
        if character.spells_obtained.exclude? i
          needed_spell_ids.push(i)
        end
        i = i + 1
      end

      character.needed_spell_ids = needed_spell_ids

      if @everyone_needs.length > 0
        @everyone_needs = @everyone_needs & character.needed_spell_ids
      else
        @everyone_needs = character.needed_spell_ids
      end
    end
  end

end
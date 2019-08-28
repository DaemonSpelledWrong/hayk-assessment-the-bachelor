# frozen_string_literal: true

require 'pry'

def get_first_name_of_season_winner(data, season)
  first_name = data[season].find { |contender| contender['status'] == 'Winner' }
  first_name['name'].split[0]
end

def get_contestant_name(data, occupation)
  contestant_occupation = ''
  contestant_occupation_finder = data.each do |seasons, contenders|
    contenders.find do |contestants|
      if contestants['occupation'] == occupation
        contestant_occupation = contestants['name']
      else
        next
      end
    end
  end
  contestant_occupation
end

def count_contestants_by_hometown(data, hometown)
  data.map do |seasons|
    seasons[1].find_all do |contenders|
      contenders['hometown'] == hometown
    end.length
  end.sum
end

def get_occupation(data, hometown)
  data.map do |seasons|
    seasons[1].find do |contender|
      if contender['hometown'] == hometown
        return contender['occupation']
      end
    end
  end
end

def get_average_age_for_season(data, season)
  average_age_per_season = data[season].map do |person|
    person['age'].to_i
  end
  (average_age_per_season.sum.to_f / average_age_per_season.length).round
end

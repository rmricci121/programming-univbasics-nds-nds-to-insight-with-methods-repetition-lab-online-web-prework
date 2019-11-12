require "pry"
$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

pp directors_database

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  # Write this implementation
  directors_index = 0
  directors_list = []
  while directors_index < source.length do
    directors_name = source[directors_index][:name]
    directors_list << directors_name
    directors_index += 1 
  end
return directors_list
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  names = list_of_directors(source)
  director_money = directors_totals(source)
  gross = 0 
  total_index = 0 
  while total_index < names.length do
    director_name = names[total_index]
      gross += director_money[director_name]
    total_index +=1 
  end
  gross
end



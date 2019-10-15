# Informations de configuration
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

my_game = Game.new("Wolverine")
puts my_game
puts enemies
# puts human_player

# my_game.kill_player("robot_2")

binding.pry
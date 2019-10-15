# Informations de configuration
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Création des joueurs robots
player1 = Player.new("Josiane")
player2 = Player.new("José")

# Script de combat entre robots
while player1.life_points > 0 && player2.life_points > 0 do
	puts #
	puts "Voici l'état de nos deux amis :"
	player1.show_state
	player2.show_state
	if player1.life_points < 3
		puts "Attention #{player1.name} !"
	end
	if player2.life_points < 3
		puts "Attention #{player2.name} !"
	end
	puts #
	puts "Passons à la phase d'attque :"
	player1.attacks(player2)
	break if player2.life_points <= 0
	player2.attacks(player1)
end
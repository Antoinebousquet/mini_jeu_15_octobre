# Informations de configuration
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Pour en jeter plein la vue
puts "
-----------------------------------------------------------------------------------------------------------------
 _     _ _     _ _______ _______ __   _      _    _ _______       ______  _____  ______   _____  _______ _______
 |_____| |     | |  |  | |_____| | \  |       \  /  |______      |_____/ |     | |_____] |     |    |    |______
 |     | |_____| |  |  | |     | |  \_|        \/   ______|      |    \_ |_____| |_____] |_____|    |    ______|
                                                                                                                
-----------------------------------------------------------------------------------------------------------------
"

# Création des joueurs humains
puts "Salut, insère le nom de ton joueur :"
print "> "
insert_name = gets.chomp.to_s
player_1= HumanPlayer.new(insert_name)
puts "Création de ton personnage en cours..."
sleep 3
puts ""
puts "Bonjour #{insert_name} ! Je te souhaite une belle aventure dans le monde subtil du 'Human Vs robots' !"
sleep 2

# Initialisation des joueurs robots
robot_1 = Player.new("Josiane")
robot_2 = Player.new("José")
enemies = [robot_1, robot_2]
puts #
sleep 1
puts #
sleep 1
puts #
sleep 1

# Script de combat human Vs robots
i=0

while player_1.life_points > 0 && (robot_1.life_points > 0 || robot_2.life_points > 0)
	# Message de démarrage 
	puts "--------------------- Début du tour #{i} ---------------------"
	sleep 0.5
	puts "Voici l'état de notre ami humain #{player_1.name} :"
	player_1.show_state
	puts #
	sleep 1

	# Phase de choix des actions
	puts "--------------------- L'heure du choix ---------------------"
	sleep 0.5
	puts "Quelle action veux-tu effectuer ?"
	sleep 0.5
	puts #
	puts "a - chercher une meilleure arme"
	sleep 0.5
	puts "s - chercher à se soigner"
	puts #
	puts "attaquer un joueur en vue :"
	sleep 0.5
	print "0 - "
	puts robot_1.show_state
	sleep 0.5
	print "1 - "
	puts robot_2.show_state
	sleep 0.5
	puts #
	puts "Quelle action choisis-tu ?"
	print "> "
	choice = gets.chomp.to_s
	puts #
	sleep 1

	# Conséquences des choix
	puts "--------------------- Les Conséquences ---------------------"
	sleep 0.5
	if choice == "a"
		puts "Tu as choisis l'option a"
		player_1.search_weapon
	elsif choice == "s"   
		puts "Tu as choisis l'option s"
		player_1.search_health_pack
	elsif choice == "0"
		puts "Tu as choisis l'option 0"
		player_1.attacks(robot_1)
	elsif choice == "1"
		puts "Tu as choisis l'option 1"
		player_1.attacks(robot_2)
	else
		puts "Tu n'as appuyé sur la bonne touche et perds donc ton tour..."
	  print "> "
	  choice = gets.chomp.to_s
	end
	puts #

	# La bagarre à proprement parler + condition pour ne pas avoir de combatants morts-vivants 	
	puts "--------------------- La riposte ---------------------"
	sleep 1
	if robot_1.life_points > 0 || robot_2.life_points > 0 
	 	puts "Passons à la phase d'attque :"
		if robot_1.life_points > 0
		robot_1.attacks(player_1)
		end
		if robot_2.life_points > 0 
		robot_2.attacks(player_1)
		end
	else
	end	
	puts #

	# Pour respirer
	puts "--------------------- Fin du tour ---------------------"
	sleep 0.5
	if robot_1.life_points > 0 || robot_2.life_points > 0 
		puts "Appuie sur Enter pour continuer :)"
		pause = gets.chomp
	end
	puts #

	# Compteur de tour
	i = i + 1
end

# Dénouement
if player_1.life_points <= 0 
	puts "....."
	sleep 1
	puts "..."
	sleep 1
	puts "Loser ! Tu as perdu !"
else
	puts "....."
	sleep 1
	puts "..."
	sleep 1
	puts "BRAVO ! TU AS SAUVE L'HUMANITE !"
	puts "
  ______  _____   _____  ______        ______ _______ _______ _______
 |  ____ |     | |     | |     \      |  ____ |_____| |  |  | |______
 |_____| |_____| |_____| |_____/      |_____| |     | |  |  | |______
                                                                     
"
end
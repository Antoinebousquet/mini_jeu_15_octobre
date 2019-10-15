class Player
	attr_accessor :name, :life_points

  # L'utilisateur créé le personnage robot en indiquant son nom
	def initialize(player_name)
		@name = player_name
		@life_points = 10
	end

	# Méthode qui affiche les points de vie du joueur
	def show_state
		print "#{name} a #{life_points} points de vie."
		if @life_points <= 0
			puts "  --- Le joueur #{@name} a été tué ! ---  "
		else
		end 
	end

	# Méthode de calcul du nombre de dommages 
		def compute_damage
			return rand(1..6)
		end

	# Méthode qui attribue le nombre de vie d'un joueur par rapport aux dégâts subis
	def gets_damage(damage_recieved)
		@life_points = @life_points - damage_recieved
	end

	# Méthode qui permet de faire interagir deux joueurs et affiche le nombre de dégâts infligés.
	def attacks(player_attacked)
		puts "Le joueur #{name} attaque le joueur #{player_attacked.name} !"
		damages = compute_damage
		puts "Il lui inflige #{damages} points de dégâts." 
		player_attacked.gets_damage(damages)
		player_attacked.show_state
	end

end

class HumanPlayer < Player
	attr_accessor :weapon_level
  
   # Le joueur créé le personnage humain en indiquant son nom
  def initialize(player_name)
    @name = player_name
    @life_points = 100 # plus de vie que le robot
    @weapon_level = 1 # nouvelle variable par rapport à la classe Player
  end

  # Méthode qui affiche les points de vie du joueur humain
	def show_state
		puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
		if @life_points <= 0
			puts "  --- Le joueur #{@name} a été tué ! ---  "
		else
		end 
	end

	# Méthode de calcul du nombre de dommages pour les humains et leurs armes
	def compute_damage
		return rand(1..6) * @weapon_level
	end

	# Méthode de recherche d'une nouvelle arme
	def search_weapon
		random_weapon_level = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{random_weapon_level} !"
		if random_weapon_level > weapon_level
			@weapon_level = random_weapon_level
			puts "Tu remplaces ton arme par la nouvelle arme de niveau #{weapon_level} !"
		else
			puts "Tu conserves ton arme de niveau #{weapon_level}..."
		end
	end

	# Méthode de recherche d'un pack de points de vie
	def search_health_pack 
		searching_lives = rand(1..6).to_i
		puts searching_lives
		if searching_lives == 1
			puts "Tu n'as rien trouvé..."
			puts "Tu as toujours #{@life_points} vies."
		elsif searching_lives > 1 && searching_lives < 6
			@life_points = @life_points + 50
			if @life_points > 100
				@life_points = 100
			end
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			puts "Tu as maintenant #{@life_points} vies."
		else searching_lives == 6
			@life_points = @life_points + 80
			if @life_points > 100
				@life_points = 100
			end
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
			puts "Tu as maintenant #{@life_points} vies."
		end
	end

end


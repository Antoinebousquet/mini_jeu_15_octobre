class Game
	attr_accessor :human_player, :enemies

	def initialize(player_name)
		robot_1 = Player.new("Josiane")
		robot_2 = Player.new("José")
		robot_3 = Player.new("Hervé")
		robot_4 = Player.new("Eglantine")
		@enemies = [robot_1, robot_2, robot_3, robot_4] 
		@human_player = HumanPlayer.new(player_name)
	end

	def kill_player(type_player)
		to_delete = type_player
		@enemies.delete(type_player)
		puts @enemies
	end

end

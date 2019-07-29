# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.
class DiceSet
  
	def roll(value)
		@range = [] 
		i = 1

		Array.new(value)

		while i <= value
			@range << rand(1..6)
			i += 1
		end
	end

	def values
		@range
	end

	def score(dice)
	  
		return 0 if(dice == [])

		dice.sort!

		return 1000 + score(dice[3..-1]) if(dice[0..2] == [1,1,1])
		return 600 + score(dice[3..-1]) if(dice[0..2] == [6,6,6])
		return 500 + score(dice[3..-1]) if(dice[0..2] == [5,5,5])
		return 400 + score(dice[3..-1]) if(dice[0..2] == [4,4,4])
		return 300 + score(dice[3..-1]) if(dice[0..2] == [3,3,3])
		return 200 + score(dice[3..-1]) if(dice[0..2] == [2,2,2])
		return 100 + score(dice[1..-1]) if(dice[0] == 1)
		return 50 + score(dice[1..-1]) if(dice[0] == 5)
		return 0 + score(dice[1..-1]);
	end

end

class Player
	attr_reader  :name #private data
	
	def initialize(name)
		@name = name
		@turn_score = 0
		@game_state = "in game"
	end

	def new_turn
		@turn_score = 0
		puts "New turn for: " + :name
	end

	def player_state
		return "name: " + :name + "point: " + @turn_score "game state: " + @game_state
	end

	def turn_score(point)
		turn_score += point
	end

	def game_state(state)
		@game_state = state
	end

	
end

class GameStat


	def score_Player(point)
		@score += point
	end

	def point_for_enter_in_game
		300
	end

	def point_for_final_round
		3000
	end

	def enter_in_game(point)
		point >= point_for_enter_in_game
	end

	def score
		return @score
	end
end

class Game

end
# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

=begin

DiceSet class : 
contains the function to roll the dice 
and for calculate the score

roll(value) :

score(dice) :

=end
class DiceSet
  
  	def initialize
  		@range = []
  		@no_score_dice = 0
  	end

	def roll(value)
		@no_score_dice = 0
		@range = [] 
		i = 1

		Array.new(value)

		while i <= value
			@range << rand(1..6)
			i += 1
		end

		return @range
	end

	def values
		@range
	end

	def score(dice)

		return 0 if(dice == [])

		if(@no_score_dice == nil || @no_score_dice == 0)
			@no_score_dice = dice.length
		end

		i = 1
		dice.sort!

		# score of a triple
		if dice.length >= 3

			while i <= 6
			
				if(dice[0..2] == [i,i,i])
					@no_score_dice -= 3 

					if i == 1
						return 1000 + score(dice[3..-1]) 
					else
						return i*100 + score(dice[3..-1])

					end
				end
				i += 1
			end
		end

		# score of a single
		if(dice[0] == 1)
			@no_score_dice -= 1
			return 100 + score(dice[1..-1])
		end
		 
		if(dice[0] == 5)
			@no_score_dice -= 1
			return 50 + score(dice[1..-1]) 
		end

		return 0 + score(dice[1..-1]);
	
	end

	def no_score_dice
		return @no_score_dice
	end

end

=begin

Player class : contains the function to know the status of the player

playable : return @in_play to communicate if he can still play

last_round : set @in_play false

print_players : print the players and their score

continue :  declare if the player want to continue or not 
			during the roll of the dice

score(s) : function necessary to keep the score of the player
		   s give the score in the last round and @score is
		   all the score of that player

get_score : return the score of a player

=end

class Player

	attr_accessor :name

	def initialize player
		@name = player
		@score = 0
		@in_play = true
	end

	def playable
		return @in_play
	end

	def last_round
		@in_play = false
	end

  	def print_players
  		puts "#{@name}		#{@score}"
  	end

  	def continue
  		gets.chomp == "y"
  	end

  	def score(s)
  		@score += s
  	end

  	def get_score
  		return @score
  	end
end

=begin

DiceSet class : 
contains the function to roll the dice 
and for calculate the score

roll(value) :

score(dice) :

=end

class Game

	def initialize number_of_players, player_names
		@number_of_players = number_of_players
		@players = player_names
		@players_obj = Array.new(@number_of_players)
		
		@rounds = 0
		@p = 1
		@last_turn = false
		@game_finish = false

		i = 1
		
			while i <= @number_of_players
				@players_obj[i-1] = Player.new(@players[i-1])
				i += 1
			end
		puts "Players: #{@players}"
		@dice = DiceSet.new
  	end

  	def turn

	  	@rounds += 1
	  	@p = 1 if @p >= @number_of_players


  		while @p <= @number_of_players || @players_obj[@p-1].playable
  			# Recap Menu 
  			i = 1
  			puts "##########################################"
  			puts "############# #{@rounds}° Round ###################"
  			puts
  			puts "It's #{@players_obj[@p-1].name}'s turn!"
  			puts "Press any button for the list of Players and your first roll!"
  				gets
  			puts
  			puts "list of Players"

	  			while i <= @number_of_players
	  				@players_obj[i-1].print_players
	  				i += 1
	  			end

	  		puts

	  			continue = true
	  			rollable = 5
	  			temporary_score = 0
	  			accumulated_score = 0

	  			while continue
	  				ds = @dice.roll(rollable)
	  				temporary_score = @dice.score(ds)
	  				rollable = @dice.no_score_dice
	  				accumulated_score += temporary_score

	  				puts "You rolled: #{ds}"
	  				puts "You score for this roll: #{temporary_score}"
	  				puts "You accumulated score: #{accumulated_score}"
	  				puts

		  				if temporary_score != 0 && rollable > 0
		  					puts "You can re-roll #{rollable}"
	  						puts "Want re-roll (y/n): "
	  						puts
	  						# input re-roll
		  						if not @players_obj[@p-1].continue
		  							continue = false
		  						end
		  				else
		  					puts "##########################################"
			  				puts "############## - WARNING - ###############"
			  				puts
		  					puts "You can't continue your turn"
		  					puts
		  					continue = false
		  				end

		  			# update score
			  			if continue == false
			  				if accumulated_score < 300
			  					puts "##########################################"
			  					puts "############## - WARNING - ###############"
			  					puts
		  						puts "You haven't reached 300 points, so your score is worth 0"
		  						puts
		  					else
		  						puts "##########################################"
			  					puts "############## - SCORE - #################"
			  					puts
		  						puts "Add #{accumulated_score} to your score!"
		  						puts
		  				 		@players_obj[@p-1].score(accumulated_score)
		  					end
			  			end
		  				

	  			end
	  		@players_obj[@p-1].last_round if @last_turn
	  		@p += 1
	  		break if @p == @number_of_players + 1

  		end

	  		j = 1
		  		while j <= @number_of_players
				  	@game_finish = true if !@players_obj[j-1].playable
				  	j += 1
				end

				if @game_finish
					end_game
				else
					game_status
				end
  		
  	end

	def start
    	while true
    		gets
     		turn
    	end
  	end

  	def game_status

  		puts "----------------------------------------------------------------"
  		puts "Game Status o.O O.o"
  		i = 1
	  		while i <= @number_of_players
		  				@players_obj[i-1].print_players
		  				@last_turn = true if @players_obj[i-1].get_score >= 3000
		  				i += 1
		  	end

		  	if @last_turn
		  		puts "Final Round!"
		  	else
		  		puts "None of the players reached 3,000 points, another round!"
		  	end
		puts "----------------------------------------------------------------" 
		start

  	end

  	def end_game
  		puts "----------------------------------------------------------------"
  		puts "----------------------------------------------------------------"
  		puts "END GAME"

  		i = 1
	  		while i <= @number_of_players
		  		@players[i-1] << " " + @players_obj[i-1].get_score.to_s
		  		i += 1
		  	end
		@players.sort! { |s| s.scan(/\d+$/).first.to_i }
		@players.reverse!
		puts "-----LEADERBOARD-----"
		i = 1
			while i <= @number_of_players
				puts @players[i-1]
				i += 1
			end
		Process.exit!(true)
  	end
end

=begin

starting point for the program
here we call method start and
declare the numbers and the 
player's name

=end

puts"  ooooooo8 oooooooooo  ooooooooooo ooooooooooo ooooooooo          ooooooo8      o      oooo     oooo ooooooooooo 
o888    88  888    888  888    88   888    88   888    88o      o888    88     888      8888o   888   888    88  
888    oooo 888oooo88   888ooo8     888ooo8     888    888      888    oooo   8  88     88 888o8 88   888ooo8    
888o    88  888  88o    888    oo   888    oo   888    888      888o    88   8oooo88    88  888  88   888    oo  
 888ooo888 o888o  88o8 o888ooo8888 o888ooo8888 o888ooo88         888ooo888 o88o  o888o o88o  8  o88o o888ooo8888"

puts
puts
puts "Enter number of players: "
number_of_players = gets.to_i

if number_of_players < 2
	puts "Minimum 2 players"
	number_of_players = 2
	end

i = 1
player_names = Array.new(number_of_players)

while i <= number_of_players
	puts "Enter name for Player #{i}"
	player_names[i-1] = gets.strip
	i += 1
end
 
g = Game.new(number_of_players, player_names)
puts
puts "Press Any Button to start"
puts
g.start                                                                                                        
                                                                                                   

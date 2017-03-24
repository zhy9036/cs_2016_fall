"
CSE 413 HW6
Yang Zhang
"

class Card
	attr_accessor :suit, :num
	def initialize(suit, num)
		@suit = suit
		@num = num
	end

	def <=>(other_card)
		if @num < other_card.num
			-1
		elsif @num > other_card.num
			1
		else
			0
		end
	end

	def to_s
		s = ""
		face = ""
		case @suit
			when 1
				s = "Heart"
			when 2
				s = "Diamond"
			when 3
				s = "Spade"
			when 4
				s = "Club"
			else
				s = "error!"
		end
			
		case @num
			when 1
				face = "Ace"
			when 2..10
				face = @num.to_s
			when 11
				face = "Jack"
			when 12
				face = "Queen"
			when 13
				face = "King"
			else 
				face = "error!"
			end
		s + "-" + face
	end
end

class Hand
	attr_accessor :cards, :score

	def initialize
		@cards = Array.new
		@score = 0
	end

	def add(card)
		@cards.push(card)
	end

	def search(card)

	end

	def discard_pair
		#do something
		@cards.each do |t|
			count = 0
				@cards.each do |w|
					if w.num == t.num && w.suit != t.suit
						@cards.delete(w) 
						count+=1
					end
				end
			# update the score
			@score += (count + 1)/2			
			@cards.delete(t) if count == 1 || count == 3
		end
	end

	def delete(card)
		@cards.each{|t| @cards.delete(t) if t.num == card.num}
	end

	def to_s
		s = ""
		@cards.each{|t| s= s + t.to_s + " | "}
		s[0..-4]
	end
end

class Deck
	attr_accessor :deck_cards
	def initialize
		@deck_cards = Array.new
		i = 1
		j = 1
		while i < 5 do 
			while j < 14 do
				@deck_cards.push(Card.new(i, j))
				j+=1
			end
			i+=1
			j = 1;
		end 
	end

	def draw
		deck_cards.pop
	end
end


def main
	while true
		#initialize the game
		deck = Deck.new
		computer = Hand.new
		player = Hand.new
		deck.deck_cards = deck.deck_cards.shuffle

		7.times do
			computer.add(deck.draw)
			player.add(deck.draw)
		end

		computer.discard_pair
		player.discard_pair

		puts "\n\nWelcome to the FISH GAME :-)\n\n"
		while computer.cards.size != 0 && player.cards.size != 0
			
			puts "\nplayer's hand: " + player.to_s + "\n"
			puts "\nnumber of computer's cards: " + computer.cards.size.to_s + "\n"
			puts "\ncurrent score (player : computer) - " + player.score.to_s + " : "+ computer.score.to_s
			puts "\nwhat suit?"
			puts "type 'num' for 2-10, 'j' for Jack, 'q' for Queen, 'k' for King, 'a' for Ace)"
			puts "(or type 'n' for new game, 'e' for exiting)"
			print "\n>"
			user_input = gets
			break if user_input.eql? "n\n"
			abort("\n\nexiting game\n\n") if user_input.eql? "e\n"

			temp = Array.new
			case user_input
				when "num\n"
					temp = computer.cards.select{|t| t.num.between?(2,10)}

				when "j\n"
					temp = computer.cards.select{|t| t.num == 11}

				when "q\n"
					temp = computer.cards.select{|t| t.num == 12}

				when "k\n"
					temp = computer.cards.select{|t| t.num == 13}

				when "a\n"
					temp = computer.cards.select{|t| t.num == 1}
			end

			if temp.size > 0
				computer.cards = computer.cards - temp
				player.cards = player.cards + temp
			else
				player.cards.push(deck.draw)
			end
			player.discard_pair

			if computer.cards.size > 0
				choice = computer.cards.sample.num
				if choice > 10 || choice == 1
					temp = player.cards.select{|t| t.num == choice}
				else
					temp = player.cards.select{|t| t.num.between?(2,10)}
				end
				if temp.size > 0
					player.cards = player.cards - temp
					computer.cards = computer.cards + temp
				else
					computer.cards.push(deck.draw)
				end
				computer.discard_pair

				#puts "\n\nnumber of computer's cards: " + computer.cards.size.to_s
				#puts "player's hand: " + player.to_s
				
				#puts
			end
			if player.cards.size == 0 || computer.cards.size == 0
				puts "\n******************\nGAME END!"
				puts "score (player : computer) - " + player.score.to_s + " : "+ computer.score.to_s
				if player.score > computer.score
					puts "YOU WON!"
				elsif player.score == computer.score
					puts "TIE!"
				else
					puts "YOU LOST!"	
				end 
				puts "******************\n\n"
				print "wanna play again? (y/n)\n>"

				ans = gets
				if ans == "n\n"
					abort("\n\nexiting game\n\n")
				else
					break
				end
			end			
		end		
	end
end
main
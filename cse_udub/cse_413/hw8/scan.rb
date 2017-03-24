# CSE 413 HW 7
# YANG ZHANG

class Token
	LPAREN = 0 # '('
	RPAREN = 1 # ')'
	PLUS = 2   # '+'
	MINUS = 3   # '-'
	MUPLY = 4  # '*'
	POWER = 5  # '**'
	SQRT = 6   # 'sqrt'
	UNSET = 7  # 'unset'
	LIST = 8   # 'list'
	QUIT = 9   # 'quit'
	EXIT = 10  # 'exit'
	DIV = 11   # '/'
	ID = 12    # 'id'
	NUM = 13   # 'number'
	EOF = 14   # 'end of file'
	EQL = 15   # 'equal'
	EOL = 16   # 'end of line'
	attr_accessor :kind, :value

	def initialize(kind, val = nil)
		@kind = kind
		if @kind == 12 || @kind == 13
			@value = val
		end
	end

	def to_s
		case @kind
			when LPAREN
				"KIND: '(' -- (left parentheses)"
			when RPAREN
				"KIND: ')' -- (right parentheses)"
			when PLUS
				"KIND: '+' -- (plus)" 
			when MINUS
				"KIND: '-' -- (minus)"  
			when MUPLY
				"KIND: '*' -- (mutiply)"
			when POWER
				"KIND: '**' -- (power)"
			when SQRT
				"KIND: keyword -- 'sqrt'"
			when UNSET
				"KIND: keyword -- 'unset'"
			when LIST
				"KIND: keyword -- 'list'"
			when QUIT
				"KIND: keyword -- 'quit'"
			when EXIT
				"KIND: keyword -- 'exit'"
			when DIV
				"KIND: '/' -- (divide sign)"
			when ID 
				"KIND: identifier -- VALUE: " + @value
			when NUM
				"KIND: number -- VALUE: " + @value.to_s
			when EOF
				"KIND: 'EOF'"
			when EQL
				"KIND: '=' -- (equal sign)"
			when EOL
				"KIND: 'EOL'"
		end
	end
end

class Scanner
	attr_accessor :next_char, :input_stream
	def initialize(inputs)
		@input_stream = inputs.to_s
	end

	def getch
		@next_char = (@input_stream[0] == nil)? nil : @input_stream[0].chr 
		if @next_char != nil
			@input_stream = @input_stream[1..-1]
		end
		#puts "cur char = " + @next_char
		#if @next_char == ' '
		#	return getch
		#else
		@next_char
		#end
	end
	
	def keyWordMap(s)
		case s
			when 'sqrt'
				return Token::SQRT
			when 'unset'
				return Token::UNSET
			when 'list'
				return Token::LIST
			when 'quit'
				return Token::QUIT
			when 'exit'
				return Token::EXIT 
			else -1
		end
	end
	
	def next_token
		getch
		if @next_char == nil
			return Token.new(Token::EOL)
		end
		case @next_char
			when ' ' 
 				next_token
			when /\t/
				next_token
			when '='
				return Token.new(Token::EQL)
			when '('
				return Token.new(Token::LPAREN)
			when ')'
				return Token.new(Token::RPAREN) 
			when '+'
				return Token.new(Token::PLUS)
			when '-'
				return Token.new(Token::MINUS)
			when '*'
				getch
				if @next_char == '*'
					return Token.new(Token::POWER)
				else
					if @next_char != nil
						@input_stream = @next_char + @input_stream
					end
					return Token.new(Token::MUPLY)
				end
			
			when 10.chr
				return Token.new(Token::EOL)
			when '/'
				return Token.new(Token::DIV) 

			when /[a-zA-Z]/
				str = @next_char
				getch
				while @next_char != nil && @next_char != ' ' && @next_char.match(/[a-zA-Z0-9_]/)
					str += @next_char
					getch
				end

				if @next_char != nil
					@input_stream = @next_char + @input_stream
				end

				keyword_num = keyWordMap(str)
				if keyword_num > 0
					return Token.new(keyword_num)
				else
					return Token.new(Token::ID, val=str)
				end

			when /\d/ 
				num = @next_char
				getch
				while @next_char != nil && @next_char != ' ' && @next_char.match(/\d|\./)
					num += @next_char
					getch
				end
				if @next_char != nil
					@input_stream = @next_char + @input_stream
				end
				return Token.new(Token::NUM, val=num.to_f)
		end
	end
end
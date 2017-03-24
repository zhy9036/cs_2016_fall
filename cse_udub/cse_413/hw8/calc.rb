require File.dirname(__FILE__)+"/scan.rb"

class Parser

	attr_accessor :scanner, :env, :next_token

	def initialize()
		#@scanner = Scanner.new(stat)
		@env = Hash.new
		@env["PI"] = Math::PI
		#@next_token = @scanner.next_token

		#puts "init " + @scanner.next_token.to_s
	end
	
	def set_input(input)
		@scanner = Scanner.new(input)
		@next_token = @scanner.next_token
	end

	def getNext_token
		@next_token = @scanner.next_token
		@next_token
	end
	
	def stmt
		#puts @next_token.to_s
		case @next_token.kind
			when Token::ID
				name = @next_token.value
				# consume id
				getNext_token
				if @next_token.kind == Token::EQL
					# consume '='
					getNext_token
					val = expr(pt = false)
					@env[name] = val
					puts "\n>variable #{name} assigned with value #{val}"
					return
				else 
					#puts @next_token.to_s
					# put id back
					#xprint name
					if @next_token.kind == Token::EOL
						@scanner.input_stream = name + @scanner.input_stream
					elsif @next_token.kind == Token::POWER
						@scanner.input_stream = name + "**" + @scanner.input_stream
					else
						@scanner.input_stream = name + @scanner.next_char + @scanner.input_stream
					end
					getNext_token
					#puts "updated token " + @next_token.to_s
					expr
				end
			when Token::UNSET
				# consume UNSET
				getNext_token
				var_name = next_token.value
				if @env.has_key?(var_name)
					@env.delete(var_name)
					puts "\nUNSET variable: " + var_name
				else
					puts "\nunknown variable #{var_name}"
				end

			when Token::LIST
				# consume LIST
				getNext_token
				puts "\n>VARIABLE LIST:"
				@env.each do |key, val|
					puts ">#{key}:#{val}"
				end
				puts
				return

			when Token::QUIT
				puts "\n>QUIT the calc..."
				return
			when Token::EXIT
				puts "\n>EXIT the calc..."
				return
			when Token::MINUS
				# consume '-'
				getNext_token

				print '-'
				-expr
				#return
			else expr
		end
	end

	def expr(pt = true)
		val = term(pt)
		while @next_token.kind == Token::PLUS || @next_token.kind == Token::MINUS
			if @next_token.kind == Token::PLUS
				getNext_token
				if pt
					print "+"
				end
				val += term(pt)
				
			else
				getNext_token
				if pt
					print "-"
				end
				val -= term(pt)
				
			end
		end
		val
	end

	def term(pt)
		if @next_token.kind == Token::MINUS
			if pt
				print '-'
			end
			getNext_token
			val = -power(pt)
		else
			val = power(pt)
		end
		while @next_token.kind == Token::MUPLY || @next_token.kind == Token::DIV
			if @next_token.kind == Token::MUPLY
				getNext_token
				if pt
					print "*"
				end
				val *= power(pt)
				
			else
				getNext_token
				if pt
					print "/"
				end
				val /= power(pt)
				
			end
		end
		val
	end

	def power(pt)

		if @next_token.kind == Token::MINUS
			#getNext_token
			val = -factor(pt)
		else
			val = factor(pt)
		end
		while @next_token.kind == Token::POWER
			# consume POWER sign **
			getNext_token
			if pt
				print "**"
			end
			val **= factor(pt)
			
		end
		val
	end

	def factor(pt)
		val = nil
		case @next_token.kind
			when Token::NUM 
				val = @next_token.value
				getNext_token
				if pt
					print "#{val}"
				end
				
			when Token::ID
				temp = @next_token.value
				val = @env[temp]
				getNext_token
				if pt
					print temp
				end
				if val == nil
					puts "\nError: #{@next_token.value} is not defined!"
				end
				
				
			when Token::LPAREN
				# consume LPAREN
				getNext_token
				if pt
					print "("
				end
				#consume posible '-'
				#puts @next_token.to_s

				val = expr(pt)

				# consume RPAREN
				getNext_token
				if pt
					print ")"
				end
			when Token::SQRT
				# consume sqrt and '('
				if pt
					print "sqrt("
				end
				getNext_token
				getNext_token

				temp = expr(pt)
				val = Math.sqrt(temp)

				# consume ')'
				getNext_token
				if pt
					print ")"
				end
			when Token::MINUS
				getNext_token
				val = -expr(pt)
		end
		val 
	end
end


def cal
	puts "type any expresion end with enter"
	puts "(type stop to terminate the session)"
	$/ = "stop"
	input = STDIN.gets().chomp()
	m = Parser.new
	input.each_line(10.chr) do |l|
		m.set_input(l)
		val = m.stmt
		if val != nil
			puts "\n>#{val}"
		end
	end
end

cal









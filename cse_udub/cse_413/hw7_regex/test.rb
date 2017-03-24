require File.dirname(__FILE__)+"/scan.rb"


def test_scanner(test_case)
	line = ""
	#ARGV.each{ |argv| line += argv}
	test_case.each_line(10.chr) do |l|
		scanner = Scanner.new(l)
		cur = scanner.next_token
		while cur.kind != Token::EOL
			puts cur.to_s
			cur = scanner.next_token
		end
		puts cur.to_s
	end
end

# 4 tokens:
#  --> num 1
#  --> plus
#  --> num 2
#  --> EOF
puts
puts
test_scanner("1 + 2
	2-3")

# 6 tokens
#  --> num 666
#  --> power **
#  --> num 999
#  --> mutiply *
#  --> id 'cur'
#  --> EOF
puts
puts
test_scanner("666 ** 999 * cur")

# 2 tokens
# --> keyword 'unset'
# --> EOF
puts
puts
test_scanner("this_ = 1")

require 'gmail'
require 'io/console'


def send_mail
	print "What's your mail ? : "
	mail = gets.chomp
	print "What's your pass ? : "
	pass = STDIN.noecho(&:gets).chomp

	gmail = Gmail.connect(mail, pass)

	email = gmail.compose do
	  to "antonin.siguierfr@gmail.com"
	  subject "Having fun in Puerto Rico!"
	  body "Spent the day on the road..."
	end
	email.deliver!

	gmail.logout
end

send_mail
class UserMailer < ApplicationMailer
	default from: 'comptethp@gmail.com'
  	layout 'welcome_email'

	def welcome_email(user_mail)
     mail(from: "comptethp@gmail.com", to: user_mail,
          subject: "Bienvenue chez Obviews!"
          )
	end

	
	def match_maker(user)
		@user = user
  	
	mail(from: user, to: user.boards.first.users.first.email,
	 				 cc: user.boards.first.users.last.email,
	     subject: "Vous avez eu un match!"
	          )
	end

end
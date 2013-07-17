class Accounts::RegistrationsController < Devise::RegistrationsController

	def create

		super
		WelcomeMailer.welcome_email(@owner).deliver unless @owner.invalid
	end

end
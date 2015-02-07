# we have moved the 'call' method to the App class
# we will now move the response code over to a controller class ( RootController )

# the problem here is no matter what the request is it will always retutn the same response

require 'controllers/root_controller'

class App
	def call(env)
		RootController.new.show
	end
end
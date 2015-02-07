# we have moved the 'call' method to the App class
# we will now move the response code over to a controller class ( RootController )

# the problem here is no matter what the request is it will always retutn the same response


require 'controllers/root_controller'

class App
	def call(env)
		path = env["REQUEST_PATH"]
# this case structure will simply say that , it will parse the request path and if it finds that
# it's equal to '/' it will show the RootController
# if not the '/' , it will show a 404 status
		case path
		when %r{^/$}
			RootController.new.show
		else
			[404,{"Content-Length"=>"9"},["Not Found"]]
		end	
	end
end

# if u want to add more controller or routes , u simply add them to the case

# that's not the optimum way to route , in case of Rails the router is in the Gem called Journey

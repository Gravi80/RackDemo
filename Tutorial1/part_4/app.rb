class App
	def call(env)
		path = env["REQUEST_PATH"]
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

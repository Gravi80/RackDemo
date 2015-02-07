# router calss 

class App
	def call(env)
		path = env["REQUEST_PATH"]
		case path
		when %r{^/$}
			RootController.new(env).show # we pass the env, thats the way the controller 
										 # will get access to all those headers where the 
										 # parameters are
		else
			[404,{"Content-Length"=>"9"},["Not Found"]]
		end	
	end
end


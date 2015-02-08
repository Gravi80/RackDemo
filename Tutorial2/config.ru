# The way we can combine other application , we need a constructor
class EnvironmentOutput
	# 'app' argument need to be passed by Rack i.e going to be App
	# the app passed must be a Rack application
	def initialize(app=nil)
		@app=app
	end

	def call(env)
		out =""
		unless @app.nil?
			# since the application coming in is a Rack Application
			response=@app.call(env)[2][0]; # get the body , returned by the call method of passed application
			out +=response
		end

		env.keys.each { |key| out+="#{key} = #{env[key]}\n" }
		["200",{"Content-Type"=> "text/plain"},[out]]
	end
end




# So lets make our application turn into middleware, something that you might
# used to plug in to other application.
# its not really meant to run on its own

class MyApp
	def call(env)
		["200",{"Content-Type"=> "text/plain"},["Hello World\n"]]
	end

end

# lets tell Rack to run this thing
# run EnvironmentOutput.new


# instead of calling 'EnvironmentOutput.new' i am going to output 'MyApp'
# run MyApp.new


# I want to use 'EnvironmentOutput' as part of MyApp
use EnvironmentOutput
run MyApp.new

# Response of EnvironmentOutput was appended to MyAPP
# MyApp application was passed to 'EnvironmentOutput' through initialize method


# run , use are defined in Rack::Builder , Builder makes ur application run all together

# when u call rackup , rackup call Builder, Builder takes a look on what it needs to run
# and strings these things together and hands controle from one to next,

# Builder itself is a Rack Application


# go to terminal and excute 'rackup -p 9000' command
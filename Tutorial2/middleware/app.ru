# middleware is kind of a filter
# you can serve the responses , status code , headers  through other Rack applications
# that can alter in some way and then pass it off

require "haml"

class Mummy

	def initialize
		@response=""
	end
	def get(template,locals)
		@response=haml('index',locals)
	end

	def haml(template_name,locals)
		template =File.open("views/#{template_name}.haml").read
		engine=Haml::Engine.new(template)
		engine.render(Object.new,locals)
	end	

	def call(env)
		["200",{"Content-Type"=> "text/html"},[@response]]
	end
end


# Typical Rack Middleware Setup

# This is simply going to take a response
class MyFilter
	# it accepts an application bcz its a filter
	# we need to pass in an application, work with that application 
	# by setting class instance variable here
	
	# if its a first app to be called make app = nil , but this is not for what middleware is written
	def initialize(app=nil)
		@app=app
	end

	def call(env)
		response=""
		# if there is an application passed
		# pull out the response from that application
		# and then append some Text
		if(@app)
			response=@app.call(env)[2][0]; # get the body , returned by the call method 
		end
		response+='<p>Sharma</p>'	
		["200",{"Content-Type"=> "text/html"},[response]]
	end
end


# this middleware takes the response and surrounds it with massive div tags 
class Massive
	def initialize(app=nil)
		@app=app
	end

	def call(env)
		response=""
		if(@app)
			response=@app.call(env)[2][0];
		end
		response="<div style='font-size:5.0em'>#{response}</div>"
		["200",{"Content-Type"=> "text/html"},[response]]
	end
end





class MyAPP <Mummy
 def initialize
 	get('index',:name=>"Ravi")		
 end	
end

# if i want to use middleware to append Sharma to response we can say 'use MyFilter'
use Massive
use MyFilter
run MyAPP.new # creates the Rack Application, it then takes this Rack Application and pass it to next one inline i.e MyFilter and then to 'Massive'

# How is this chaining working, the way this is orchestrated here is by the thing called 'Builder'
# When u issue these method ( run,use ) calls, what Builder does is simply append them in reverse order.


# go to terminal and excute 'rackup app.ru -p 9000' command
# Right now Only HelloWorld application gets called, other Applications can't use it
# So we need to make it work for other applications

class HelloWorld
	def call(env)
		out =""
		env.keys.each { |key| out+="#{key} = #{env[key]}\n" }
		["200",{"Content-Type"=> "text/plain"},[out]]
	end
end

# lets tell Rack to run this thing
run HelloWorld.new


# go to terminal and excute 'rackup app.ru -p 9000' command
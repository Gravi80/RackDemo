# Right now Only HelloWorld application gets called, other Applications can't use it
# So we need to make it work for other applications

require "haml"

class HelloWorld
	def call(env)
		out =""
		name = "Ravi\n\n"
		template =File.open('views/index.haml').read
		engine=Haml::Engine.new(template)

		# i need to tell what scope it is rendering it
		# I am going to run it in new Object scope, basically pay attention to self
		# then i need to pass it local variable
		out += engine.render(Object.new,:name => name)
		env.keys.each { |key| out+="#{key} = #{env[key]}\n" }
		["200",{"Content-Type"=> "text/plain"},[out]]
	end
end

# lets tell Rack to run this thing

run HelloWorld.new


# go to terminal and excute 'rackup app.ru -p 9000' command
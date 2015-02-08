require "haml"

class Mummy

	def haml(template_name,locals)
		template =File.open("views/#{template_name}.haml").read
		engine=Haml::Engine.new(template)
		engine.render(Object.new,locals)
	end	

	def call(env)
		out =""
		name = "Ravi\n\n"
		out+=haml('index',:name => "Ravi")
		env.keys.each { |key| out+="#{key} = #{env[key]}\n" }
		["200",{"Content-Type"=> "text/plain"},[out]]
	end
end

run Mummy.new


# go to terminal and excute 'rackup app.ru -p 9000' command
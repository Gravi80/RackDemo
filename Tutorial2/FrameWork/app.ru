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

run Mummy.new






# go to terminal and excute 'rackup app.ru -p 9000' command
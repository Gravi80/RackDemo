# we have refrence "env" on our controller
class Controller
	# we need an accessor from env
	attr_accessor :env

	def initialize(env)
		self.env=env
	end

	# we need read parameters from the "QUERY_STRING"
	# parses the query string and turns it into a hash
	def params
		Rack::Utils.parse_nested_query(env["QUERY_STRING"])
	end

	def render(view_path, context=self)
		template=File.open(view_path, "r").read
		Haml::Engine.new(template).render(context)
	end	

	def render_with_layout(view_path,context=self)
		layout=File.open("views/layout/application.html.haml", "r").read
		Haml::Engine.new(layout).render(context) do
			render(view_path,context)
		end
	end	
end


# How to add instace variable to Haml processing

# every time you parse a template with Haml , you
# can pass the context where the parse happens to the render method

# @available_on_the_view = true    # setting instance variable available on the view is true 
# binding = self				   # setting binding variable to self
# Haml::Engine.new(template).render(binding) # when i pass that binding into render i will 
											 # get all instace variable of the current context
											 # in Haml template
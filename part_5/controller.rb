# this is like our super class, and in this way all controller can use this code
class Controller
	def render(view_path)
		template=File.open(view_path, "r").read
		Haml::Engine.new(template).render
	end	

	def render_with_layout(view_path)
		layout=File.open("views/layout/application.html.haml", "r").read
		Haml::Engine.new(layout).render do
			render(view_path)
		end
	end	
end
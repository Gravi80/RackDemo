# if u want to have multiple controller, we need to pass all 
# this rendering code to our controller class

class RootController

	def show
		body= render_with_layout('views/root/show.html.haml')
		headers={"Content-Length" => body.length.to_s}
		[200,headers,[body]]
	end

	# receive the path of the Haml template ( view )
	def render(view_path)
		# read it as a file, read all its content
		template=File.open(view_path, "r").read
		# send all the content to the Haml Engine, the render on that object will return the HTML
		Haml::Engine.new(template).render
	end	

	# we have controller, views , router but there is another thing that we get from web application
	# that is layouts
	# it means that the action template should only have the relevant code for that specific action

	# and then some where in the application you will have layout 'views/layout/application.html.haml'

	def render_with_layout(view_path)
		# open layout as a file, read its contents
		# pass it over to Haml Engine,
		# but diffrence is we do render with a block
		# in the middle of the block we add rendering of the action 
		layout=File.open("views/layout/application.html.haml", "r").read
		Haml::Engine.new(layout).render do
			render(view_path)
		end
	end	
end
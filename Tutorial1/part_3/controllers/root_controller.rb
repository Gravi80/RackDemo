# we don't want to have these view code in our controller

# to get rid of this in our controller we will create a method 'render'
class RootController

	def show
		body= render('views/root/show.html.haml')
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
end
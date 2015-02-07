# we need to pass data from the controller to the view
# In Rails we do that by passing an instace variable that you set on the action
class RootController < Controller

	def show
		# an instance variable @name , it will read from the query string param called 'name'
 		# if it finds it , it will set it else display 'World'
		@name = params["name"] || "World"
		body= render_with_layout('views/root/show.html.haml')
		headers={"Content-Length" => body.length.to_s}
		[200,headers,[body]]
	end
end

# http://localhost:9292/?name=ravi
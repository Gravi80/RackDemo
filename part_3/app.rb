# we have moved the 'call' method to the App class

class App
	def call(env)
		body = '<html><body><h1>Hello World</h1></body></html>'
		headers = {'Content-Length' => body.length.to_s}
		[200,headers,[body]]
	end
end
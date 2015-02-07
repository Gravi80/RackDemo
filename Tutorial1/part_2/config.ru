run -> (env){
	body = '<html><body><h1>Hello World</h1></body></html>'
	headers = {'Content-Length' => body.length.to_s}
	[200,headers,[body]]
}

# we have returned the 'body' inside the array bcz string does not respond to each, see last 'config.ru'

# but now u will receive the same response for all url that you will visit
# Like : http://localhost:9292/dashboard , http://localhost:9292/anything , http://localhost:9292/


# in a tipical web-framework / application , use the router ( a.k.a Dispatcher) to show diffrent pages based
# on the URL and HTTP method of the request

# its job is to just parse the 'path' and the 'HTTP' method and pass it to the corresponding method that
# is supposed to handle that specific request.

# /post ------> PostController#index



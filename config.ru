# Rack is an interface b/w web-server  and web application

# It's sort of a contract or standard that helps any Ruby web server connect to any ruby written application







# The web server will take the HTTP request, converts it in to A Hash with request Headers that we call ENV

# It then just send that hash to the application , that supposed to have an Object that respond_to(:call)
# and that :call will receive the ENV hash as its main point of entry.

# Once the Hash goes there to the application , the application will do its thing , process the 
# request and then return the response in the form of Array [http_code,headers,body] of three elements.

# http_code = integer
# headers of the response = Hash
# body = body of the response is an object that responds to :each


# the web application then returns this array back to the web server so that it can return it to the client.






# For any rack application to work u need a file  “config.ru”, and that’s the way u tell rack how ur 
# application is going to work.

# You need to use the run method 
# and that run method must receive an Obejct that respond_to(:call) and that can take the ENV hash.
# since the proc can actually respond_to(:call) you can do something like this


run -> (env){
	puts env
	[200,{'ravi'=>'sharma'},[]]
}



# go to terminal and excute 'rackup' command, u now have the smallest web app ever to access.
# it takes in the ENV hash that the server sends to the app



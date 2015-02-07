# we will now move the code out of config.ru and put it in to separate classes

# load all the files in my current path
$: << '.'

# require haml for our views
require 'haml'

# require the app class
require 'app'
require 'controller'
require 'controllers/root_controller'

# tell rack that our application point of entry will be an isntance of the App class.
run App.new

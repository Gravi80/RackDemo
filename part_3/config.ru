# we will now move the code out of config.ru and put it in to separate classes

# load all the files in my current path
$: << '.'

# require the app class
require 'app'

# tell rack that our application point of entry will be an isntance of the App class.
run App.new

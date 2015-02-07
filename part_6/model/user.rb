# ActiveRecord::Base  is independent enough of Rails
# we can just use it outside of Rails

require 'active_record'

class User < ActiveRecord::Base
	
end

# u will need config/database.yml to work properly


# other then these you need to solve

#  Migrations , Logging , Caching, Database Pooling , Session , Cookies

# github.com/dabit/wawr

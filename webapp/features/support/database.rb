require 'database_cleaner'

ActiveRecord::Base.establish_connection(
      		:adapter => 'sqlite3',
      		:database => '../webapp/db/development.sqlite3')
      		
#ActiveRecord::Base.logger = Logger.new(STDERR)
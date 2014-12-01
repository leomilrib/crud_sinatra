configure :development do
 set :database, 'sqlite3:///crud_sinatra_dev.db'
 set :show_exceptions, true
end

configure :production do
 set :database, 'sqlite3:///crud_sinatra_prod.db'
 set :show_exceptions, false
end

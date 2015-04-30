require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/game')
require('pry')

get('/test') do
  erb(:test)
end

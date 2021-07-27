
require('sinatra')
require('sinatra/reloader')
require('./lib/words')
# require('./lib/song')
require('pry')
also_reload('lib/**/*.rb')

get('/') do 
  @words = Word.all
  erb(:words)
end
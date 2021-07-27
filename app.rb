
require('sinatra')
require('sinatra/reloader')
require('./lib/words')
require('pry')
also_reload('lib/**/*.rb')

get('/') do 
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

post('/words') do
  word = params[:new_word]
  new_word = Word.new(word, nil)
  new_word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end
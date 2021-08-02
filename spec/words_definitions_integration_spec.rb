require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('creates a word to be shown on homepage', {:type => :feature}) do
  it('creates a word and then goes to the homepage') do
    visit('/words')
    fill_in('new_word', :with => 'Water')
    click_on('add')
    expect(page).to have_content('Water')
  end
end

describe('update word', {:type => :feature}) do
  it('updates the word and updates it on the page as well') do
    word = Word.new("Water", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on('Edit word')
    fill_in('Update word', :with => 'Fire')
    click_on('Update')
    expect(page).to have_content('Fire')
  end
end

describe('deletes word from list', {:type => :feature}) do
  it('deletes the word and goes back to words list') do
    Word.clear()
    word = Word.new("Water", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on('Edit word')
    click_on("Delete word")
    visit('/words')
    expect(page).to have_content("There are no words up yet!")
  end
end

describe('adds a definition to a word', {:type => :feature}) do
  it('adds a definition and then goes back to that words page') do
    word = Word.new("Water", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('Definition', :with => 'A clear liquid substance')
    click_on('Add definition')
    expect(page).to have_content('A clear liquid substance')
  end
end

describe('updates definition', {:type => :feature}) do
  it('updates a definition and then goes back to that words page') do
    word = Word.new("Water", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('Definition', :with => 'A clear liquid substance')
    click_on('Add definition')
    click_on('A clear liquid substance')
    fill_in('Update definition', :with => 'Water is wet')
    click_on('Update')
    expect(page).to have_content('Water is wet')
  end
end

describe('deletes definition', {:type => :feature}) do
  it('deletes a definition and then goes back to that words page') do
    word = Word.new("Water", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in('Definition', :with => 'A clear liquid substance')
    click_on('Add definition')
    click_on('A clear liquid substance')
    click_on('Delete')
    expect(page).to have_content('There are no definitions for this word yet. Fill out the form below to add some!')
  end
end
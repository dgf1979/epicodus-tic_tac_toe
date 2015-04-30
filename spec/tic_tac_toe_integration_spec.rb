require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("Sinatra test", {:type => :feature}) do
  it('checks a test page to verify basic Sinatra functionality') do
    visit('/test')
    expect(page).to have_content('Sinatra OK')
  end
end

describe("tic tac toe game", {:type => :feature}) do
  it('message text on new game') do
    visit('/')
    expect(page).to have_content("Welcome")
  end
end

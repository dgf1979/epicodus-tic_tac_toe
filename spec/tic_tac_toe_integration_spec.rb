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

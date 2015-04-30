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

  it('can restart with a fresh game', { :type => :feature}) do
    visit('/')
    click_button("new_game")
    expect(page).to have_content("Welcome")
    click_link('00')
    expect(page).to have_content("O's Turn")
  end

  it('plays a turn', { :type => :feature}) do
    visit('/')
    click_link('00')
    expect(page).to have_content("O's Turn")
  end

  it('plays a whole game', { :type => :feature}) do
    visit('/')
    click_link('00')
    click_link('10')
    click_link('01')
    click_link('20')
    click_link('02')
    expect(page).to have_content("The winner is: X!")
  end

end

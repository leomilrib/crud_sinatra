require File.expand_path '../spec_helper.rb', __FILE__

describe "The Application" do
  it "create a user" do
    visit '/'
    click_link('Create')
    fill_in('Name:', with: 'Banana')
    fill_in('Login', with: 'banana')
    fill_in('URL', with: 'banana.com')
    fill_in('Password', with: 'bananasecrets')
    click_button('Create')

    expect(page).to have_content('Banana')
  end
end
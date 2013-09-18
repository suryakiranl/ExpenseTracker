require 'spec_helper'

describe "Expensetypes page " do
  before {
    visit expensetypes_url
  }
  it ' should have My Dashboard  ' do
    page.should have_link('My Dashboard')
  end
  it ' should have Home ' do
    page.should have_link('Home')
  end
  it ' should have Add an Expensetype link ' do
    page.should have_link('Add an Expensetype')
  end

  # Now test navigations ...
  it ' should navigate to home page when clicked on Home link' do
    click_link 'Home'
    page.should have_link('Why wait?? Lets get started with managing you expenses right now. Click me!!')
  end
  it ' should navigate to adding a new expensetype page when clicked on Add an Expensetype link' do
    click_link 'Add an Expensetype'
    page.should have_button('Create Expensetype')
    page.should have_link('Back')
  end
end

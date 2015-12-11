require 'spec_helper'
# include Warden::Test::Helpers

describe WelcomeController, type: :feature do
  it "should redirect to Sign In page" do
    visit root_path

    page.should have_content('Log in')
  end

  it "should display product and transaction information" do
    Product.create(:name => 'FooBar', :price => 100)

    sign_in_as_user :braintree_customer_id => '663636'

    visit root_path

    page.should have_table('products')
    page.should have_content('Products')

    page.should have_content('Transactions')
    page.should have_table('transactions')
  end

  it "should display product information" do
    Product.create(:name => 'FooBar', :price => 100)

    sign_in_as_user

    visit root_path

    page.should have_table('products')
    page.should have_content('Products')
  end

  it "should display link to setup payment info" do
    sign_in_as_user

    visit root_path

    page.should have_content('Setup Your Payment Info')
  end
end

require 'spec_helper'

describe 'Jasmine Focus Tests' do
  describe "using selenium", :driver => :selenium do
    it "should detect focus correctly" do
      visit root_path
      page.should have_selector('#HTMLReporter .alert .passingAlert')
    end
  end

  describe "using capybara-webkit", :driver => :webkit do
    it "should detect focus correctly" do
      visit root_path
      page.should have_selector('#HTMLReporter .alert .passingAlert')
    end
  end
end
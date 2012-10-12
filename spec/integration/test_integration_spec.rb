require 'spec_helper'

describe 'Jasmine Focus Tests using the JQuery Focus Test Fix library' do
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

describe 'Jasmine Focus Tests using standard JQuery and no fix' do
  after {
    if example.exception
      puts "\n\e -- [32mGood news \e[31m(even though tests failed)\e[32m - JQuery :focus tests now work without the JQuery Focus Text Fix - perhaps JQuery / headless browsers now support :focus correctly?\e[0m --"
    end
  }

  describe "using selenium", :driver => :selenium do
    it "should detect focus correctly" do
      visit without_fix_path
      page.should_not have_selector('#HTMLReporter .alert .passingAlert')
    end
  end

  describe "using capybara-webkit", :driver => :webkit do
    it "should detect focus correctly" do
      visit without_fix_path
      page.should_not have_selector('#HTMLReporter .alert .passingAlert')
    end
  end
end
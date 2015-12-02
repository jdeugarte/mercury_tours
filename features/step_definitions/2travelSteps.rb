Given(/^I am on the Nercury Tours homepage$/) do
     page.driver.browser.manage.window.maximize
     visit ('http://newtours.demoaut.com/')
end

Given(/^I click the "([^"]*)" link$/) do |linkText|
  click_link(linkText)
end

When(/^I enter the required fields as show below$/) do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
	when "First Name:"
    	fill_in 'firstName', :with => value
    	@name = value
	when "Last Name:"
		fill_in 'lastName', :with => value
		@lastName = value
    when "Phone:"
		fill_in 'phone', :with => value
    when "Email:"
		fill_in 'userName', :with => value
	when "Address:"
		fill_in 'address1', :with => value
	when "City:"
		fill_in 'city', :with => value
	when "State/Province:"
		fill_in 'state', :with => value
	when "Postal Code:"
		fill_in 'postalCode', :with => value
	when "Country:"
		select(value, :from => 'country')
	when "User Name:"
		fill_in 'email', :with => value
		@userName = value
	when "Password:"
		fill_in 'password', :with => value
	when "Confirm Password:"
		fill_in 'confirmPassword', :with => value
	end
  end
end

When(/^send my registration form$/) do
  xpath_base = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[18]/td/input'
  find(:xpath, xpath_base).click
end

Then(/^the confirmation screen is show$/) do
  greeting = "Dear"+" "+@name+" "+@lastName 	
  #page.should have_content()
  expect(page).to have_content(greeting)
  
end

Then(/^my user name is "([^"]*)"$/) do |userName|
  text= " Note: Your user name is "+userName+"."
  expect(page).to have_content(text)
end


Given(/^I am on the Mercury Torus homepage$/) do
	 visit 'http://newtours.demoaut.com/'
end

Given(/^I enter my user and password$/) do
		fill_in 'userName', :with => ENV['USER']
		fill_in 'password', :with => ENV['PASSWORD']
end

When(/^I press the Sign\-in button$/) do
  xpath_base = '/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[2]/td[3]/form/table/tbody/tr[4]/td/table/tbody/tr[4]/td[2]/div/input'
  find(:xpath, xpath_base).click

end


Then(/^The Flight Finder screen is shown$/) do
	text='Flight Details'
	text1='Preferences'
	expect(page).to have_content(text)
	expect(page).to have_content(text1)

end


Given(/^I'm on the Mercury Sign\-On page$/) do
  visit 'http://newtours.demoaut.com/mercurysignon.php'
end

When(/^I press the 'login' button$/) do
  xpath_base='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[4]/td/input'
  find(:xpath, xpath_base).click
end

Given(/^I'm sign\-on to Mercury Tours$/) do
  visit 'http://newtours.demoaut.com/mercurysignon.php'
  fill_in 'userName', :with => "Pepazo"
  fill_in 'password', :with => "ILoveQA"
  xpath_base='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[4]/td/input'
  find(:xpath, xpath_base).click
end

Given(/^I select my flight details and preferences$/) do
  xpath_base='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[14]/td/input'
  find(:xpath, xpath_base).click
end

Given(/^I hit the 'findFlights' button$/) do
  xpath_base='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/p/input'
  find(:xpath, xpath_base).click
end

Given(/^I select my departure and return flight$/) do
  
end

And(/^hit the 'reserveFlight' button$/) do
  xpath_base='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/p/input'
  find(:xpath, xpath_base).click
end

Given(/^I fill in the payment information$/) do |table|
  xpath_first_name='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[4]/td/table/tbody/tr[2]/td[1]/input'
  xpath_last_name='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[4]/td/table/tbody/tr[2]/td[2]/input'
  xpath_number='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[6]/td/table/tbody/tr[2]/td[2]/input'

  data = table.rows_hash
  data.each_pair do |key, value|
    case key
    when "First Name:"
        find(:xpath, xpath_first_name).set(value)
        @name = value
    when "Last Name:"
      find(:xpath, xpath_last_name).set(value)
      @lastName = value
      when "Number"
      find(:xpath, xpath_number).set(value)
    end
  end
end

When(/^I hit the 'Secure Purchase' button$/) do
  xpath_base='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[23]/td/input'
  find(:xpath, xpath_base).click
end

Then(/^I see the departing flight "([^"]*)" at "([^"]*)" in "([^"]*)" class with a cost of "([^"]*)"$/) do |location, flight_info, classy, cost|
  expect(page).to have_content(location)
  expect(page).to have_content(location)
  expect(page).to have_content(classy)
  expect(page).to have_content(cost)

end

Then(/^I see the return flight "([^"]*)" at "([^"]*)" in "([^"]*)" class with a cost of "([^"]*)"$/) do |location, flight_info, classy, cost|
  expect(page).to have_content(location)
  expect(page).to have_content(location)
  expect(page).to have_content(classy)
  expect(page).to have_content(cost)
end

Then(/^I see "([^"]*)"$/) do |passangers|
  expect(page).to have_content(passangers)
end

Given(/^I select "([^"]*)" as the origin$/) do |arg1|
  select( arg1, :from => 'fromPort')
end

Given(/^I select "([^"]*)" as the destination$/) do |arg1|
  select( arg1, :from => 'toPort')
end

Given(/^I select my departure flight with the first flight$/) do
 xpath='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table[1]/tbody/tr[3]/td[1]/input'
 
 find(:xpath,xpath).click
end

Given(/^I select my return flight with the second flight$/) do
  xpath='/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table[2]/tbody/tr[3]/td[1]/input'
  find(:xpath, xpath).click
end

Given(/^I select the one way option$/) do
  xpath_base = "/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[2]/td[2]/b/font/input[2]"
  find(:xpath, xpath_base).click
end

Given(/^I select the round trip option$/) do
  xpath_base = "/html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[5]/td/form/table/tbody/tr[2]/td[2]/b/font/input[1]"
  find(:xpath, xpath_base).click
end

Given(/^I select the departing date on "([^"]*)" "([^"]*)"$/) do |arg1, arg2|
  select( arg1, :from => 'fromMonth')
  select( arg2, :from => 'fromDay')

end

Given(/^I select the returning date on "([^"]*)" "([^"]*)"$/) do |arg1, arg2|
  select( arg1, :from => 'toMonth')
  select( arg2, :from => 'toDay')
end

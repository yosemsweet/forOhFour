

Given /^the following pages:$/ do |pages|
  Page.create!(pages.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) page$/ do |pos|
  visit pages_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following pages:$/ do |expected_pages_table|
  expected_pages_table.diff!(tableish('table tr', 'td,th'))
end

Given /^"([^"]*)" points to a 404 page$/ do |url|
	Test::CONTEXT[url] = 'http://www.google.com/404'
end

Then /^I should see a new page for "([^"]*)" with "([^"]*)"$/ do |url, description|
  Then "I should see \"Page was successfully created.\""
	Then "I should see \"#{url}\""
	Then "I should see \"#{description}\""
	Then "show me the page"
end

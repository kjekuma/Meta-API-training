# Given(/^user is authorized$/) do
#   authorization
# end
# And(/^user list all locations - (.*)$/) do
#   list_all_locations
# end
And(/^user list all locations$/) do
  list_all_locations
end

Then(/^user creates new location$/) do
  create_location
  retrieve_location
end

And(/^user updates location - (.*)$/) do |action|
  update_location(action)
end

Then(/^user delete location/) do
  delete_location
end

# And(/^user lists all locations - (.*)$/) do
#   list_all_locations
# end
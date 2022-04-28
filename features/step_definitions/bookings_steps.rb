Given(/^user is authorized$/) do
  authorization
end

Then(/^user lists all bookings$/) do
  list_all_bookings
end

And(/^user creates a new booking$/) do
  list_all_resources
  create_booking
end

Then(/^user updates the meeting - (.*)$/) do |action|
  update_meeting(action)
end

Then(/^user deletes the booking$/) do
  delete_booking
end
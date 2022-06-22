require 'rest-client'
require 'minitest'

# test_api_key_LxVT0E5O5Plc8QeLrlJiVlOZSJkQtIp9

def authorization
  api_key = 'test_api_key_LxVT0E5O5Plc8QeLrlJiVlOZSJkQtIp9'
  @authToken = Base64.strict_encode64(":#{api_key}")
end

def list_all_bookings
  list_bookings_res = get("#{@api}/bookings",
                          headers: { 'Authorization' => 'Basic ' + @authToken },
                          cookies: {})
  assert_equal(200, list_bookings_res.code, 'User is not able to get all bookings')
end

def list_all_resources
  list_resources_res = get("#{@api}/resources",
                           headers: { 'Authorization' => 'Basic ' + @authToken },
                           cookies: {})
  assert_equal(200, list_resources_res.code, 'User is not able to get resources')

  resources = JSON.parse(list_resources_res)

  @resources_ids = []
  resources['data'].each do |find_data_in_array|
    @resources_ids << find_data_in_array['id']
  end
end

def create_booking
  payload = {
    "resource_id": @resources_ids[0],
    "graph": "confirm_decline",
    "start": "2024-04-26T21:30:00-07:00",
    "end": "2024-04-27T22:15:00-07:00",
    "what": "Meta API course",
    "where": "Liepaja",
    "description": "The lightning strikes at 10:04 PM exactly! I need you to be there Doc!",
    "customer": {
      "name": "Ketija Jekuma",
      "email": "ketija.jekuma@testdevlab.com",
      "phone": "(916) 555-4385",
      "voip": "McFly",
      "timezone": "America/Los_Angeles"
    },
    "settings": {
      "allow_double_bookings": true
    }
  }

  create_booking_res = post("#{@api}/bookings",
                            headers: { 'Authorization' => 'Basic ' + @authToken,
                                       'content-type' => 'application/json' },
                            cookies: {},
                            payload: payload.to_json)

  assert_equal(201, create_booking_res.code, 'User cannot create a booking!!!')

  create_booking = JSON.parse(create_booking_res)

  @booking_id = create_booking['data']['id']
end

def update_meeting(action)
  update_meeting_res = put("#{@api}/bookings/#{@booking_id}/#{action}",
                           headers: { 'Authorization' => 'Basic ' + @authToken,
                                      'content-type' => 'application/json' },
                           cookies: {},
                           payload: {}.to_json)
  assert_equal(200, update_meeting_res.code, 'User cannot update the meeting!')
end

def delete_booking
  delete_booking_res = delete("#{@api}/bookings/#{@booking_id}",
                              headers: { 'Authorization' => 'Basic ' + @authToken,
                                         'content-type' => 'application/json' },
                              cookies: {})
  assert_equal(204, delete_booking_res.code, 'User cannot delete the meeting!')
end
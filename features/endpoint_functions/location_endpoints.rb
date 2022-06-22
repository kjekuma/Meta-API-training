require 'rest-client'
require 'minitest'

# test_api_key_LxVT0E5O5Plc8QeLrlJiVlOZSJkQtIp9

def list_all_locations
  list_all_locations_res = get "#{@api}/locations?include=projects&search=distance:2;latitude:42.51;longitude:1.54;name:Toronto",
                               headers: { 'Authorization' => 'Basic ' + @authToken,
                                          'content-type' => 'application/json' },
                               cookies: {}
  assert_equal(200, list_all_locations_res.code, 'User cannot list all locations!!!')
  log(list_all_locations_res)
end

def create_location
  payload = {
    "name": "Toronto",
    "description": "Whatever works best for you!!",
    "latitude": 42.50798000,
    "longitude": 1.52480000,
    "projects": ["1e1ea71e-5908-45d0-8099-bf7afadc59dd"],
    "meta": {
      "city": "Toronto"
    }
  }

  create_location_res = post("#{@api}/locations?include=projects",
                             headers: { 'Authorization' => 'Basic ' + @authToken,
                                        'content-type' => 'application/json' },
                             cookies: {},
                             payload: payload.to_json)
  assert_equal(201, create_location_res.code, 'User cannot create a location!!!')

  # @location_ids = []
  # create_location['data'].each do |find_data_in_array|
  #   @location_ids << find_data_in_array['id']

  # @location_id = create_location['data']['id']
  log(create_location_res)
end

def retrieve_location
  retrieve_location_res = get("#{@api}/#{@location_ids}?include=projects",
                              headers: { 'Authorization' => 'Basic ' + @authToken, },
                              cookies: {})

  assert_equal(200, retrieve_location_res.code, 'User cannot retrieve a location!!!')

end

def update_location(action)
  update_location_res = put("#{@api}/locations/#{@location_ids}?include=projects#{action}",
                            headers: { 'Authorization' => 'Basic ' + @authToken,
                                       'content-type' => 'application/json' },
                            cookies: {},
                            payload: {}.to_json)

  assert_equal(204, update_location_res.code, 'User cannot update a location!!!')

end

def delete_location
  delete_location_res = delete("#{@api}/locations/#{@location_ids}?include=projects",
                               headers: { 'Authorization' => 'Basic ' + @authToken, },
                               cookies: {})
  assert_equal(204, delete_location_res.code, 'User cannot delete a location!!!')
end

def list_all_locations
  list_all_locations_res = get "#{@api}/locations?include=projects&search=distance:2;latitude:42.51;longitude:1.54;name:Toronto",
                               headers: { 'Authorization' => 'Basic ' + @authToken,
                                          'content-type' => 'application/json' },
                               cookies: {}
  assert_equal(200, list_all_locations_res.code, 'User cannot list all locations!!!')
  log(list_all_locations_res)
end
Feature: Bookings

  Scenario: Create a booking and confirm
    Given user is authorized
    Then user lists all bookings
    And user creates a new booking
    Then user updates the meeting - confirm

  Scenario: Create a booking and decline
    Given user is authorized
    Then user lists all bookings
    And user creates a new booking
    Then user updates the meeting - decline


  Scenario: Create a booking and decline
    Given user is authorized
    Then user lists all bookings
    And user creates a new booking
    Then user updates the meeting - decline
    And user deletes the booking
Feature: Location
  Scenario: Create new location
    Given user is authorized
    Then user creates new location
    And user updates location - confirm
    Then user delete location
    And user lists all locations


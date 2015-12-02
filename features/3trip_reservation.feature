Feature: Mercury Tours Flight Registration

Background:
    Given I am on the Nercury Tours homepage
    Given I'm sign-on to Mercury Tours

Scenario: Book a flight with a registered user
    Given I select my flight details and preferences
    And I hit the 'findFlights' button
    And I select my departure and return flight
    And I fill in the payment information
    |First Name:        | Pepito             |
    |Last Name:         | Perez              |
    |Number:            | 123456789012345    |
    When I hit the 'Secure Purchase' button
    Then I see the departing flight "Acapulco to Acapulco" at "12/2/2015 @ 5:03 w/ Blue Skies Airlines 360" in "Coach" class with a cost of "$270 each"
    And I see the return flight "Acapulco to Acapulco" at "12/2/2015 @ 12:23 w/ Blue Skies Airlines 630" in "Coach" class with a cost of "$270 each"
    And I see "1 passenger"

Scenario: Book a round trip from Acapulco to Frankfurt
    Given I select "Acapulco" as the origin
    And I select "Frankfurt" as the destination
    And I select my flight details and preferences
    And I select my departure flight with the first flight
    And I select my return flight with the second flight
    And I hit the 'findFlights' button
    And I fill in the payment information
    |First Name:        | Pepito             |
    |Last Name:         | Perez              |
    |Number:            | 123456789012345    |
    When I hit the 'Secure Purchase' button
    Then I see the departing flight "Acapulco to Frankfurt" at "12/2/2015 @ 5:03 w/ Blue Skies Airlines 360" in "Coach" class with a cost of "$270 each"
    And I see the return flight "Frankfurt to Acapulco" at "12/2/2015 @ 12:23 w/ Blue Skies Airlines 630" in "Coach" class with a cost of "$270 each"
    And I see "1 passenger"

Scenario: Book a one way trip from Acapulco to Frankfurt
    Given I select "London" as the origin
    And I select "Portland" as the destination
    And I select the one way option
    And I select my flight details and preferences
    And I select my departure flight with the first flight
    And I select my return flight with the second flight
    And I hit the 'findFlights' button
    And I fill in the payment information
    |First Name:        | Pepito             |
    |Last Name:         | Perez              |
    |Number:            | 123456789012345    |
    When I hit the 'Secure Purchase' button
    Then I see the departing flight "London to Portland" at "12/2/2015 @ 5:03 w/ Blue Skies Airlines 360" in "Coach" class with a cost of "$270 each"
    And I see "1 passenger"

Scenario: Book a round trip from Acapulco to Frankfurt
    Given I select "London" as the origin
    And I select "Portland" as the destination
    And I select the round trip option
    And I select the departing date on "July" "13"
    And I select the returning date on "August" "17"
    And I select my flight details and preferences
    And I select my departure flight with the first flight
    And I select my return flight with the second flight
    And I hit the 'findFlights' button
    And I fill in the payment information
    |First Name:        | Pepito             |
    |Last Name:         | Perez              |
    |Number:            | 123456789012345    |
    When I hit the 'Secure Purchase' button
    Then I see the departing flight "London to Portland" at "7/13/2016 @ 5:03 w/ Blue Skies Airlines 360" in "Coach" class with a cost of "$270 each"
    And I see the return flight "Portland to London" at "8/17/2016 @ 12:23 w/ Blue Skies Airlines 630" in "Coach" class with a cost of "$270 each"
    And I see "1 passenger"
Feature: Mercury Tours Verify Registration

Background:
    Given I am on the Nercury Tours homepage

Scenario: Register a user on site        
	And I click the "Register" link
	When I enter the required fields as show below
	|First Name: 	    | Pepito             |
    |Last Name: 	    | Perez              |
    |Phone: 	        | 1234-567-12        |
    |Email: 	        | pepe@pepazo.com    |
    |Address:           | Av. America #123   |	
    |City: 	            | Cochabamba         |
    |State/Province:    | Cochabamba         | 	
    |Postal Code: 	    | 9897               |
    |Country: 	        | BOLIVIA            |
    |User Name: 	    | Pepazo             |
    |Password:          | ILoveQA            | 
    |Confirm Password:  | ILoveQA            |
	And send my registration form
	Then the confirmation screen is show
	And my user name is "Pepazo"

Scenario: Find a flight with a registered user
    And I enter my user and password
    When I press the Sign-in button
    Then The Flight Finder screen is shown

Scenario: Find a flight with a user registerd through the sign-on page
    Given I'm on the Mercury Sign-On page
    And I enter my user and password
    When I press the 'login' button
    Then The Flight Finder screen is shown
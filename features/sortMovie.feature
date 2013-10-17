Feature: movies when added should appear in movie list

Scenario: view movie list after adding movie (declarative and DRY)

  Given I have added "The Help" with rating "PG-13"
  And   I have added "Aladdin" with rating "G"
  And   I am on the RottenPotatoes home page sorted by title
  Then  I should see "Aladdin" before "The Help"
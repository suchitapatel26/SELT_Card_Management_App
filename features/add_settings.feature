Feature: Allow Users to see save game settings
  As a user
  I want to be able to control how the settings of the game
  so I can set the number of people and number of decks and cards

  Background: movies have been added to RottenPotatoes

Given I am on the settings page

Scenario: set number of players only
  When I have selected a number of players
  Then I should see "number" of players in the game

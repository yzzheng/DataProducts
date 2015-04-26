---
title: "Untitled"
author: "Mike Cahill"
date: "Sunday, April 26, 2015"
output: html_document
---

## Expected Dealer Score in Blackjack
### Overview
This application runs a simulation to determine the distribution of a blackjack dealer's final score, given
the dealer's single face-up card.  Each trial of the simulation assumes that the cards are drawn from 6 full decks, and
the cards are removed from the deck as they are placed in the dealer's hand.  

### Specifications
The simulation is based on standard blackjack rules and card values.  The dealer continues to draw cards until the dealer score is >= 17, at which point the final score is calculated.  In this simulation, the dealer stands on "soft 17" (meaning that the dealer has an ace and could either calculate the score as 7 or 17).

### User Input
The user only needs to select the value of the dealer's face up card, and the number of trials for the simulation.  Upon hitting the 'Submit' button, the simulation will be run, and results of the simulation will be outputted

### Output
The application outputs a histogram showing the distribution of the dealer's score among all trials of the simulation.  Below the histogram, the dealer's bust rate and the mean score on non-bust hands are also reported.
# Final Report

Name: Aynel Gül
Student number: 10595945
Date: 02-02-2017

__________________________________________________

## Description

(screenshot)

## Technical Design

### ViewControllers:
- LoginViewController: makes sure the user can sign up or sign in with an email address and a password. If user is already logged in, it will immediately redirect the user to the menu (MenuViewController). If the user wants to sign up an alert will pop up, asking the user for an email address and a password. If both are filled in, not already used and the password field holds has a password longer than 5 characters, the user will be registrated and logged in.
- MenuViewController: displays a menu with two buttons: 'Travels' redirecting to 'AllTravelsViewController' and 'Map' redirecting to 'MapViewController'.
- MapViewController: displays a map (MapKit) where the user can search for a place (country, city, address, etc.), using a search bar. After searching for an existing place, a annotation is placed where the user can click on. This redirects the user to 'FormViewController'.
- FormViewController: the FormViewController consists of 2 containerViews ('AddTravelViewController' and 'AddTipViewController')
- AddTravelFormViewController:
- AddTipFormViewController:
- AllTravelsViewController:
- AllTipsViewController:
- SpecificTravelViewController:
- ShowInfoViewController:
- ShowTipsViewController:
- ShowBuddiesViewController:

- OwnTipsCell:
- UserTravelsCell:
- UserTipsCell:
- UserBuddiesCell:

### Objects/Structs..
- User
- Tip
- Travel

## Challenges
- Verschillende landnamen per taal (land code gebruikt).
- Veel viewControllers: segmented controllers gebruikt
- Veel segues: hele objecten meegeven ipv losse waarden

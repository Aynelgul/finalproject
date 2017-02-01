# Final Report

Name: Aynel Gül \n

Student number: 10595945

Date: 02-02-2017

__________________________________________________

## Description

(screenshot)

## Technical Design

### ViewControllers:
- LoginViewController: makes sure the user can sign up or sign in with an email address and a password. If user is already logged in, it will immediately redirect the user to the menu (MenuViewController). If the user wants to sign up an alert will pop up, asking the user for an email address and a password. If both are filled in, not already used and the password field holds has a password longer than 5 characters, the user will be registrated and logged in.
- MenuViewController: displays a menu with two buttons: 'Travels' redirecting to 'AllTravelsViewController' and 'Map' redirecting to 'MapViewController'.
- MapViewController: displays a map (MapKit) where the user can search for a place (country, city, address, etc.), using a search bar. After searching for an existing place, a annotation is placed where the user can click on, containing this specific place. This redirects the user to 'FormViewController'.
- FormViewController: the FormViewController consists of 2 containerViews ('AddTravelViewController' and 'AddTipViewController') where the user can add either a new travel or a new tip. This view displays the place (country and city) that the user has searched for and clicked on.
- AddTravelFormViewController: a containerView within the 'FormViewController' containing a 'form' where the user can add a new travel, specified by a start date and a end date of the particular travel. 
- AddTipFormViewController: a containerView within the 'FormViewController' containing a 'form' where the user can add a new tip by specifying the kind of tip it is ("Restaurant", "Hotel", "park", "Museum", "Shop", "Festival", "Club", "Cafe" or "Other"). After filling in the name of the place and a brief description, the user can add the tip (...)
- AllTravelsViewController: displays all the travels that the current user has added in a tableView, containing the country, city and start date of the trip. The user can click on a specific travel to go to the 'SpecificTravelViewController'. The user can also click on 'My Tips' to go to the 'AllTipsViewController'. The user can also delete a travel if the user wants to.
- AllTipsViewController: this view displays all the tips that the current user has added. It allows the user to delete a tip if the user wants to.
- SpecificTravelViewController: displays specific information about the travel that the user has clicked on in the 'AllTravelsViewController' tableView. It holds 3 containerViews: 'ShowInfoViewController', 'ShowTipsViewController' and 'ShowBuddiesViewController'.
- ShowInfoViewController: displays information about the specific country of the travel (capital, population, currency and region). It also contains a button that the user can click on to add the travel to his/her Calendar (with the given start date and end date). It also displays the flag of the specific country of the travel. 
- ShowTipsViewController: displays all the tips that have been added regarding this country and city, in the form of a tableView. 
- ShowBuddiesViewController: displays all the travel buddies that are joining the user on the travel/trip. It allows the user the invite a buddy by email (if the invited buddy uses the app too), adding the same travel to this user his/her travels too. 

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

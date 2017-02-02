# Final Report

**Name:** Aynel Gül

**Student number:** 10595945

**Date:** 02-02-2017
<br><br>
<img src="https://github.com/Aynelgul/finalproject/blob/master/finalproject/Doc/app-icon.jpg" width="200">
<br><br>

# Index
**1.** Description

**2.** Technical Design (Model, View, Controllers)

**3.** Challenges


## Description
This app aims at making things easier and organized when preparing for your trip by allowing the user to create his or her own account and adding future travel plans. It enables you to exchange travel tips with other users and make a personal list of future travels. It does so by allowing the user to search on a map for a specific location, defining its country and city. The user can then add a tip or a travel for this specified place. It also allows the user to add a new event to the Calendar for every trip that you plan and gives you information about the country that you're heading to. It also enables you to invite one or more travel buddies to your trip, registrating the same travel to their list as well. The user can see and delete his/her own tips. 

(screenshot)

## Technical Design

### Model
Three models were used in this application (user, travel and tip).

| **User**      | **Values**         |
| ------------- |:------------------:|
| uid           | String             |
| email         | String             |


> **User:**
> The user object contains an uid and an email to get database information from a user, by using
> the uid as a key. 
>
> [See User.swift](https://github.com/Aynelgul/finalproject/blob/master/finalproject/User.swift)

<br><br>

| **Travel**    | **Values**         |
| ------------- |:------------------:|
| startDate     | Double             |
| endDate       | Double             |
| country       | String             |
| city          | String             |
| countryCode   | String             |
| uids          | [String]           |
| travelId      | String             |


> **Travel:**
> Tip object quite some information about the travel, which is being used in multiple views
> controllers.
>
> [See Travel.swift](https://github.com/Aynelgul/finalproject/blob/master/finalproject/Travel.swift)

<br><br>

| **Tip**       | **Values**         |
| ------------- |:------------------:|
| uid           | String             |
| country       | String             |
| city          | String             |
| type          | String             |
| name          | String             |
| description   | String             |


> **Tip:**
> Tip object contains information about the tip. The tips are used to display in the matching travels 
> of all users.
>
> [See Tip.swift](https://github.com/Aynelgul/finalproject/blob/master/finalproject/Tip.swift)

<br><br>

**Room for improvement:** the travel object contains 7 parameters, which is quite a lot. To keep the object more simple, I could join the startDate parameter and endDate parameter in one single parameter (using a dictionary). Also, I used a travelId to link a buddy to a specific travel. It might be possible to remove this parameter and use the key of the users(....) Lastly, I could add 'username' to the user object, so I can store and display the username of a user (e.g. with tips), if he or she likes to. 

### View


### Controllers:
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

**Room for improvement:** 

- OwnTipsCell:
- UserTravelsCell:
- UserTipsCell:
- UserBuddiesCell:


## Challenges
- Verschillende landnamen per taal (land code gebruikt).
- Veel viewControllers: segmented controllers gebruikt
- Veel segues: hele objecten meegeven ipv losse waarden

(link naar progress.md)

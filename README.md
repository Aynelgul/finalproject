# Final Project
End project minor programming

## Adventure Time
by Aynel Gül

- Signing up and signing in (having your own account).
- Adding future travels (country, city, date).
- Looking up travel tips from other users (or adding your own tips to the list)
- Inviting your travel buddy/buddies (by email?) for a travel (adding the same travel details to another account, if travel buddy has an Adventure Time account too.
- Looking up information of the country that you are traveling to (flag, capital, population, currency, region).


## Problem that will be solved for the user
Preparing everything for a vacation can be stressful at times. This app aims at making things easier and organized when preparing for your trip by allowing the user to create his or her own account and adding future travel plans. It enables you to exchange travel tips and make a personal packing list for every trip. It also adds a new event to your agenda of every trip that you plan and gives you information about the country that you're heading to.


## Visual Sketch

<img src="https://github.com/Aynelgul/finalproject/blob/master/finalproject/Doc/Sketches.jpg">



## Decomposing
### Model
This app saves the travels that you add (personally) and also stores the tips that you and others add (publicly). These will be saved at Firebase. The same goes for user data (email, password).

### View
It has a login view, a menu view (travels, tips, adding travel), a view of a list of your travels that you can click on. After clicking on a travel/country, it shows you another view with information about this particular country. In this view you can see information about the country, tips from you and other users about this specific place and the buddies that you're travelling. Here you can add travel buddies as well.

### Controller
The controler manipulates the model, if a user, for example, adds or deletes a new travel or tip. The model, then, updates the view.


## External components (APIs)
The APIs that I will be using is one for looking up data about a country, including currency, population, capital and region and another for looking up the flag of a country. 
If I am going to add a map too (see: possible extensions) then I will have to use a Google Maps API.


## Possible Technical Problems or Limitations
- It might get a little confusing with all the different views. It is important to decompose well with this app, so it remains uncluttered. 


## Similar Applications
There are similar applications available that enable you to, for example, look up the currency ('XE Currency') or the weather ('WeatherPro'), but it seems that there are not a lot of apps that integrate these things. They mostly do not have a social component either (sharing tips, etc.).


## Possible Extensions
If I have enough time, I would like to add these extensions:

- A map where the app marks the places that you have travelled (after the travel date has been reached).
- Inviting someone by email for a travel and only adding the travel to the travel list of the buddy if he/she accepts the offer.

## Credits
- Reversed geocoding: http://stackoverflow.com/questions/27495328/reverse-geocode-location-in-swift
- Setting custom color pickerView: http://stackoverflow.com/questions/28417217/set-text-color-and-font-for-uidatepicker-in-ios8-swift
- Changing privacy settings for API: http://stackoverflow.com/questions/32631184/the-resource-could-not-be-loaded-because-the-app-transport-security-policy-requi
- Used as a template for asking for confirmation when deleting something from the tableView: http://stackoverflow.com/questions/30726813/confirmation-for-deleting-a-post-in-table-view-cell
- Converting NSDate to Double/String en vise versa: http://stackoverflow.com/questions/33277970/how-to-convert-string-to-date-to-string-in-swift-ios en http://stackoverflow.com/questions/26849237/swift-convert-unix-time-to-date-and-time
- Moving view with keyboard: http://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift
- Template for adding an event to your Calendar: http://stackoverflow.com/questions/28379603/how-to-add-an-event-in-the-device-calendar-using-swift
- API: REST Countries. Link used: "https://restcountries.eu/rest/v1/name/"+title+"?fullText=true", where 'title' is the name of the country.
- API: Geognos. Link used: "http://www.geognos.com/api/en/countries/flag/"+title+".png", where 'title' is the name of the country.

[![BCH compliance](https://bettercodehub.com/edge/badge/Aynelgul/finalproject)](https://bettercodehub.com)

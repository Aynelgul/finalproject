# Process Book

## Maandag, 9 jan 2017
- Repository aangemaakt (ergens opnieuw aangemaakt, github checken).
- Uitzoeken wat ik precies met de app wil; twijfel tussen uitbreiden app van Native App Studio of nieuwe app.

## Dinsdag, 10 jan 2017
- Nog nadenken over App, gekozen voor uitbreiden Native App Studio applicatie.
- 'Doc' map + 'README.md' file toegevoegd aan workspace in Xcode.
- (Getekende) sketches gemaakt en toegevoegd.

## Woensdag, 11 jan 2017
- Nieuwe sketches toegevoegd aan DESIGN.md (advanced).

## Donderdag, 12 jan 2017
- Design beetje aangepast: andere view indeling, gebruik van segmented control. Tips/Travels toevoegen via map (MapKit).
- Apple ID doet het niet (iets met de bundle identifier, weet nog niet precies wat er aan de hand is). Kan wel gewoon doorwerken.

## Vrijdag, 13 jan 2017
- MapKit beetje uitgezocht en in main.storyboard gezet.

## Maandag, 16 jan 2017
- Apple ID nog steeds niet gelukt: geeft error. Hierdoor kan ik hem nog steeds niet runnen  op telefoon. Hierdoor keychain ook nog niet kunnen activeren (enable), voor Firebase. Doet het verder wel (vaag).

## Dinsdag, 17 jan 2017
- Voor het eerst simulator op laptop kunnen runnen: app crashte meteen. Bug is opgelost: GoogleService-Info.plist was opgeslagen onder een naam die hij niet herkende (GoogleServive-Info-2.plist).
- Inloggen is gelukt: wordt ook aangemaakt in Firebase.
- Sign up ook gelukt: via Alert, voegt ook toe aan Firebase en logt gebruiker meteen in.
- Inlog/signup errors ondervangen met Alerts.
- MapKit vraagt nu (eerste keer) om toestemming voor ophalen User Location: opent de kaart dan op de huidige locatie, nog geen zoom toegevoegd
- Nagedacht over hoe ik data wil representeren in Firebase; welke roots/child references: waarschijnlijk aparte 'lijsten' met eentje voor users met hun travels en eentje met de tips (gelinkt aan landen/steden).
- Apple ID error is opgelost: bundle identifier was niet uniek (genoeg). Keychain nu ook kunnen activeren. App eindelijk op telefoon kunnen runnen: werkt naar verwachting.

## Woensdag, 18 jan 2017
- Search bar geimplementeerd (in de navigation bar), werkt!! Nog geen autocomplete (dat wil ik nog wel voor de beta versie). 
- Zoom instellen op kaart wilde niet lukken. 
- Aanpassen MapViewController op Main.Storyboard: andere vormgeving, paste beter. Formulieren anders vormgeven: met segmented control voor tips/travels.
- Structs aanmaken (nog niet af).
- Geprobeerd te fixen dat je kan klikken op een annotatie: niet gelukt. Hij pakt hem niet.. Op heel veel manieren geprobeerd. Veel oude code.
- Aan styleguide gewerkt met groep.

## Donderdag, 19 jan 2017
- Styleguide afgemaakt met groep.
- Reversed geocoding, gebruikgemaakt van deze link: http://stackoverflow.com/questions/27495328/reverse-geocode-location-in-swift
- Veel tijd besteed aan reversed geocoding: app crashte in het begin (unwrapping optional value). Dit kwam uiteindelijk doordat hij de functie al aanriep bij het laden van de kaart, terwijl er dan nog niet gezocht is op een plek: dus de latitude/longitude waren nog leeg. Hierna geprobeerd deze opgehaalde info door te geven naar volgende view: kreeg steeds 'lege' labels. Opgelost: segue zat niet op de goede plek (deed de segue te vroeg).
- Text color datePicker kunnen aanpassen!  http://stackoverflow.com/questions/28417217/set-text-color-and-font-for-uidatepicker-in-ios8-swift
- Text color pickerView kunnen aanpassen! http://stackoverflow.com/questions/40928383/how-to-change-the-font-color-inside-a-picker-view-swift
- Vastgelopen met users aanmaken in Firebase Database: bij aanmaken reference crashte hij steeds. Melding: Terminating app due to uncaught exception 'FIRAppNotConfigured', reason: 'Failed to get default FIRDatabase instance. Must call FIRApp.configure() before using FIRDatabase.' Opgelost: bleek te liggen aan het feit dat er een reference wordt aangemaakt, zonder dat er een user is ingelogd/aangemaakt, terwijl er wel wordt geprobeerd die info naar Firebase te sturen (blijkbaar voordat app al opgestart is; delegate). Reference verplaatst naar functie die wordt aangeroepen bij het aanmaken van een user; nadat user al is aangemaakt (in Firebase).
- Models verder opgezet; info schrijven naar Firebase lukt nu.

## Vrijdag, 20 jan 2017
- Begonnen met opzetten tableview voor de Travels. De twee basisfuncties werken (data wordt erin gezet), didSelectRow werkt niet.. Komt niet bij de functie. Niet kunnen oplossen vandaag.

## Maandag, 23 jan 2017
- Nog steeds vastgelopen op bug in tableview; didSelectRow wilt niet werken; wordt niet gecalled. Er gaat iets mis met de delegate connectie denk ik.. Al geprobeerd opnieuw te doen. Daarna even gelaten: kostte heel veel tijd.
- Begonnen met opgehaalde Firebase data filteren op UIDs; gelukt bij travels (loopen door de UIDs).

## Dinsdag, 24 jan 2017
- Tegen groot probleem opgelopen: MapKit zoekt automatisch landen/steden in de taal van je locatie. Echter, mijn API's werken alleen met Engelse landnamen.. Gekeken naar waarden die gelijk blijven per land in elke taal: country code! Deze opgehaald met mapkit reversed geocoding en geprobeerd toe te wijzen aan de API. Gelukt! Beide APi's werken, info wordt alleen nog niet goed doorgegeven via segues.
- DidSelectRow probleem opgelost! Bleek aan een andere tableview te liggen! Die was nog maar half geimplementeerd (dus inderdaad delegate/database probleem), waardoor hij crashte na het seguen vanuit de andere tableview. YES.

## Woensdag, 25 jan 2017
- Aan de containerviews van specifieke reizen gewerkt: segue wilde maar niet lukken. Lag misschien aan containerviews. Dus geef nu eerst door aan 'hoofdview' en daarna de 'containerviews' en dat werkt wel!
- Vlag API wilde eerst niet werken, maar bleek te liggen aan beveiligingsmaatregelen. Opgelost: http://stackoverflow.com/questions/32631184/the-resource-could-not-be-loaded-because-the-app-transport-security-policy-requi

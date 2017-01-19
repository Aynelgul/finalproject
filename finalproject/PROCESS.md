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

## Maandag, 16 jan 2017
- Apple ID nog steeds niet gelukt: geeft error. Hierdoor kan ik hem nog steeds niet runnen  op telefoon. Hierdoor keychain ook nog niet kunnen activeren (enable), voor Firebase. Doet het verder wel (vaag).

## Dinsdag, 17 jan 2017
- Voor het eerst simulator op laptop kunnen runnen: app crashte meteen. Bug is opgelost: GoogleService-Info.plist was opgeslagen onder een naam die hij niet herkende (GoogleServive-Info-2.plist).
- Inloggen is gelukt: wordt ook aangemaakt in Firebase.
- Sign up ook gelukt: via Alert, voegt ook toe aan Firebase en logt gebruiker meteen in.
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
- Vastgelopen met users aanmaken in Firebase Database: bij aanmaken reference crashte hij steeds. Melding: Terminating app due to uncaught exception 'FIRAppNotConfigured', reason: 'Failed to get default FIRDatabase instance. Must call FIRApp.configure() before using FIRDatabase.' Opgelost: bleek te liggen aan het feit dat er een reference wordt aangemaakt, zonder dat er een user is ingelogd/aangemaakt, terwijl er wel wordt geprobeerd die info naar Firebase te sturen (blijkbaar voordat app al opgestart is; delegate).

## Vrijdag, 20 jan 2017

## Maandag, 


(nog invoegen op de dagen in process book: links tussen views leggen, mapkit uitzoeken en in view zetten, ondervangen errors met inloggen en sign up).

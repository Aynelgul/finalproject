# Process Book

## Maandag, 9 jan
- Repository aangemaakt (ergens opnieuw aangemaakt, github checken).
- Uitzoeken wat ik precies met de app wil; twijfel tussen uitbreiden app van Native App Studio of nieuwe app.

## Dinsdag, 10 jan
- Nog nadenken over App, gekozen voor uitbreiden Native App Studio applicatie.
- 'Doc' map + 'README.md' file toegevoegd aan workspace in Xcode.
- (Getekende) sketches gemaakt en toegevoegd.

## Woensdag, 11 jan
- Nieuwe sketches toegevoegd aan DESIGN.md (advanced).

## Donderdag, 12 jan
- Design beetje aangepast: andere view indeling, gebruik van segmented control. Tips/Travels toevoegen via map (MapKit).
- Apple ID doet het niet (iets met de bundle identifier, weet nog niet precies wat er aan de hand is). Kan wel gewoon doorwerken.

## Vrijdag, 13 jan

## Maandag, 16 jan
- Apple ID nog steeds niet gelukt: geeft error. Hierdoor kan ik hem nog steeds niet runnen  op telefoon. Hierdoor keychain ook nog niet kunnen activeren (enable), voor Firebase. Doet het verder wel (vaag).

## Dinsdag, 17 jan
- Voor het eerst simulator op laptop kunnen runnen: app crashte meteen. Bug is opgelost: GoogleService-Info.plist was opgeslagen onder een naam die hij niet herkende (GoogleServive-Info-2.plist).
- Inloggen is gelukt: wordt ook aangemaakt in Firebase.
- Sign up ook gelukt: via Alert, voegt ook toe aan Firebase en logt gebruiker meteen in.
- MapKit vraagt nu (eerste keer) om toestemming voor ophalen User Location: opent de kaart dan op de huidige locatie, nog geen zoom toegevoegd
- Nagedacht over hoe ik data wil representeren in Firebase; welke roots/child references: waarschijnlijk aparte 'lijsten' met eentje voor users met hun travels en eentje met de tips (gelinkt aan landen/steden).
- Apple ID error is opgelost: bundle identifier was niet uniek (genoeg). Keychain nu ook kunnen activeren. App eindelijk op telefoon kunnen runnen: ziet er goed uit.

## Woensdag, 18 jan
- Search bar geimplementeerd (in de navigation bar), werkt!! Nog geen autocomplete (dat wil ik nog wel voor de beta versie). 
- Zoom instellen op kaart wilde niet lukken. 
- Aanpassen MapViewController op Main.Storyboard: andere vormgeving, paste beter. Formulieren anders vormgeven: met segmented control voor tips/travels.

## Donderdag, 19 jan

## Vrijdag, 20 jan


(nog invoegen op de dagen in process book: links tussen views leggen, mapkit uitzoeken en in view zetten, ondervangen errors met inloggen en sign up).

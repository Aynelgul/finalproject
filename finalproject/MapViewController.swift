//
//  MapViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 17-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate, MKMapViewDelegate {
    
    // MARK: Outlets.
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: Variables.
    let locationManager = CLLocationManager()
    
    
    var searchController: UISearchController!
    var annotation: MKAnnotation!
    var localSearchRequest: MKLocalSearchRequest!
    var localSearch: MKLocalSearch!
    var localSearchResponse: MKLocalSearchResponse!
    var error: NSError!
    var pointAnnotation: MKPointAnnotation!
    var pinAnnotationView: MKPinAnnotationView!
    
    var clickedAnnotationCountry = String()
    var clickedAnnotationCity = String()
    var clickedAnnotationCountryCode = String()
    
    var clickedLatitude = Double()
    var clickedLongitude = Double()
    
    // MARK: Actions
    @IBAction func showSearchBar(_ sender: UIBarButtonItem) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground.
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
            // mapView.showsUserLocation = true
        }
    }
    
    // MARK: Functions/Methods.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location: CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(location.latitude) \(location.longitude)")
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("error with location manager: " + error.description)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        //1
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        if self.mapView.annotations.count != 0{
            annotation = self.mapView.annotations[0]
            self.mapView.removeAnnotation(annotation)
        }
        //2
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                let alertController = UIAlertController(title: nil, message: "Place Not Found", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            //3
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
            self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
        }
    }
    
    // When annotation/pin is clicked.
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        // deze ergens anders neerzetten!! na search oid
        self.locationManager.stopUpdatingLocation()
        
        print("PRINT \(pointAnnotation.coordinate)")
        self.clickedLatitude = pointAnnotation.coordinate.latitude
        self.clickedLongitude = pointAnnotation.coordinate.longitude
        
        var newLocation = CLLocation(latitude: pointAnnotation.coordinate.latitude, longitude: pointAnnotation.coordinate.longitude) //changed!!!
        print("LOCATION TEST!")
        print(newLocation)
        
        // Convert coordinates to country/city.
        CLGeocoder().reverseGeocodeLocation(newLocation, completionHandler: {(placemarks, error) -> Void in
            print("REVERSED GEO LOCATION TEST:")
            print(newLocation)
            
            if error != nil {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }

            if (placemarks?.count)! > 0 {
                let pm = placemarks![0] as! CLPlacemark
                print(pm.locality!)
                self.clickedAnnotationCity = pm.locality!
                self.clickedAnnotationCountry = pm.country!
                print("Wat is de Country Code???:")
                print(pm.isoCountryCode)
                print(pm.country!)
                
                print("CHECKKK")
                print(self.clickedAnnotationCountry)
                print(self.clickedAnnotationCity)
                
                self.performSegue(withIdentifier: "goToForm", sender: nil)

            }
            else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToForm" {
            
            print("REACHES SEGUE")
            
            let destination = segue.destination as? FormViewController
            destination?.receivedCountry = self.clickedAnnotationCountry
            destination?.receivedCity = self.clickedAnnotationCity
            
            let secondDestination = segue.destination as? AddTipFormViewController
            secondDestination?.chosenCountry = self.clickedAnnotationCountry
            secondDestination?.chosenCity = self.clickedAnnotationCity
            
            let thirdDestination = segue.destination as? ShowInfoViewController
            thirdDestination?.countryCodeRecheiver = self.clickedAnnotationCountryCode
            
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    let regionRadius: CLLocationDistance = 1000
    //    func centerMapOnLocation(location: CLLocation) {
    //        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
    //                                                                  regionRadius * 2.0, regionRadius * 2.0)
    //        mapView.setRegion(coordinateRegion, animated: true)
    //    }

}

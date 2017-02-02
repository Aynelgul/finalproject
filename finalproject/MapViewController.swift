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
    
    // MARK: - Variables.
    let locationManager = CLLocationManager()
    
    // MARK: - Outlets.
    @IBOutlet weak var mapView: MKMapView!
    
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
    
    // MARK: - viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ask for Authorisation from User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground.
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - Actions
    @IBAction func showSearchBar(_ sender: UIBarButtonItem) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }

    
    // MARK: - Functions.
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location: CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(location.latitude) \(location.longitude)")
    }
    
    internal func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("error with location manager: " + error.description)
    }
    
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar){

        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        if self.mapView.annotations.count != 0{
            annotation = self.mapView.annotations[0]
            self.mapView.removeAnnotation(annotation)
        }

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

            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
            self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
        }
    }
    
    /// When annotation/pin is clicked.
    internal func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        self.locationManager.stopUpdatingLocation()
        
        print("PRINT \(pointAnnotation.coordinate)")
        self.clickedLatitude = pointAnnotation.coordinate.latitude
        self.clickedLongitude = pointAnnotation.coordinate.longitude
        
        let newLocation = CLLocation(latitude: pointAnnotation.coordinate.latitude, longitude: pointAnnotation.coordinate.longitude)
        
        // Convert coordinates to country/city.
        CLGeocoder().reverseGeocodeLocation(newLocation, completionHandler: {(placemarks, error) -> Void in
            
            if error != nil {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                self.presentAlert(title: "Oops!", message: "Something went wrong. Please try again.")
                return
            }

            if (placemarks?.count)! > 0 {
                let pm = placemarks![0] 
                
                if let locality = pm.locality {
                    self.clickedAnnotationCity = locality
                } else {
                    self.clickedAnnotationCity = "City not found"
                }
                
                if let country = pm.country {
                    self.clickedAnnotationCountry = country
                } else {
                    self.clickedAnnotationCity = "Country not found"
                }
                
                if let isoCountryCode = pm.isoCountryCode {
                    self.clickedAnnotationCountryCode = isoCountryCode
                } else {
                    self.clickedAnnotationCountryCode = "Country code not found"
                }
                
                self.performSegue(withIdentifier: "goToForm", sender: nil)
                

            }
            else {
                print("Problem with the data received from geocoder")
                self.presentAlert(title: "Oops!", message: "Something went wrong. Please try again.")
            }
        })
    }
    
    private func presentAlert(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToForm" {
            
            let destination = segue.destination as? FormViewController
            destination?.receivedCountry = self.clickedAnnotationCountry
            destination?.receivedCity = self.clickedAnnotationCity
            destination?.reveivedCountryCode = self.clickedAnnotationCountryCode
            
            let secondDestination = segue.destination as? AddTipFormViewController
            secondDestination?.chosenCountry = self.clickedAnnotationCountry
            secondDestination?.chosenCity = self.clickedAnnotationCity
            
        }
    }

}

//
//  ShowInfoViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 24-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit

class ShowInfoViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    // MARK: Variables.
    var countryReceiver = String()
    var cityRecheiver = String()
    var countryCodeRecheiver = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("COUNTRY CODE RECEIVER:")
        print(countryCodeRecheiver)
        
        countryLabel.text = countryReceiver
        cityLabel.text = cityRecheiver
        HTTPSrequest(title: countryCodeRecheiver)
    }
    
    func HTTPSrequest(title: String) {
        let title = title.replacingOccurrences(of: " ", with: "+")
        let url = URL(string: "https://restcountries.eu/rest/v1/name/"+title+"?fullText=true")
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print(error!, "Could not load!")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? Array<NSDictionary>
                
                if let jsonArray = json {
                    
                    DispatchQueue.main.async {
                        let capital = jsonArray[0]["capital"]! as! String
                        let population = jsonArray[0]["population"]!
                        let currency = jsonArray[0]["currencies"] as! NSArray
                        let region = jsonArray[0]["region"]! as! String
                        let alpha2Code = jsonArray[0]["alpha2Code"] as! String
                        
                        self.capitalLabel.text = capital
                        self.populationLabel.text = String(describing: population)
                        self.currencyLabel.text = currency[0] as? String
                        self.regionLabel.text = region
                        
                        self.HTTPSrequestImage(title: alpha2Code)
                    }
                    
                } else {
                    let alert = UIAlertController(title: "Oops!", message: "Country not found.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } catch {
                print(error,"Something went wrong!")
            }
        }).resume()
    }
    
    func HTTPSrequestImage(title: String) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        if let url = NSURL(string: "http://www.geognos.com/api/en/countries/flag/"+title+".png"){
            let task = session.dataTask(with: url as URL, completionHandler: {data, response, error in
                if let err = error {
                    print("Error: \(err)")
                    return
                }
                
                if let http = response as? HTTPURLResponse {
                    if http.statusCode == 200 {
                        let downloadedImage = UIImage(data: data!)
                        DispatchQueue.main.async {
                            self.flagImageView.image = downloadedImage
                        }
                    }
                }
            })
            task.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

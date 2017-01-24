//
//  ShowTipsAndBuddiesViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 24-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit

class ShowTipsAndBuddiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Variables
    var items = ["test1", "test2", "test3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath) as! TipsBuddiesCell
        
        let item = items[indexPath.row]
        cell.titleLabel.text = item
       
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

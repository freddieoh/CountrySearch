//
//  CountryTableViewController.swift
//  CountrySearch
//
//  Created by Fredrick Ohen on 10/30/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {
  

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

  }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
     tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
 
      tableView.separatorStyle = .none
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
     
 
     
        return cell
    }

    
}

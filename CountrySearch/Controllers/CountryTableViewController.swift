//
//  CountryTableViewController.swift
//  CountrySearch
//
//  Created by Fredrick Ohen on 10/30/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {
  
  let manager = APIManager.getCountries { (items) in
    print(items)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      getCountriesFromAPI()
    }

  func getCountriesFromAPI() {
    let url = URL(string: "https://restcountries.eu/rest/v2/all")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
  
      if let error = error {
        DispatchQueue.main.async {
          // Make UI error change
          print(error.localizedDescription)
          }
        return
      }
      let data = data!
     let dictionaries = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
      
      for dictionary in dictionaries {
        
        
        guard let name = dictionary["name"] as? String else {
          return
        }
        
        print(name)
        
      }
      
     
  

      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        DispatchQueue.main.async {
          // Make UI Change update Server error
          print(data.base64EncodedString())
          
        }
        return
      }
    }
    task.resume()
    print("Session Success")
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

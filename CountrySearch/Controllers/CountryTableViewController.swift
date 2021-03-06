//
//  CountryTableViewController.swift
//  CountrySearch
//
//  Created by Fredrick Ohen on 10/30/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {
  
  var countries: [Country] = []
  
//  let manager = APIManager.getCountries { (items) in
//    print(items)
//  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      getCountriesFromAPI()
      registerNibFiles()
      
    }
  
  func registerNibFiles() {
     tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier:"CountryCell")
  }

  func getCountriesFromAPI() {
    
    let countriesURL = "https://restcountries.eu/rest/v2/name/nigeria"
    guard let url = URL(string: countriesURL ) else { return }
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
      if let error = error {
        DispatchQueue.main.async {
          // Make UI error change
          print(error.localizedDescription)
          }
        return
      }
  
      guard let data = data else { return }
      let jsonDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
    
      for dict in jsonDictionary {
        guard let countryName = dict["name"] as? String else {
        return
        }
        
        let country = try! Country(json: dict)
        self.countries.append(country)
        print(countryName)
        
      }
      
     
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        DispatchQueue.main.async {
          // Make UI Change update Server error
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
      
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        cell.selectionStyle = .none
      
      cell.countryNameLabel.text = countries[indexPath.row].name
      cell.capitalLabel.text = countries[indexPath.row].capital
      cell.currencyLabel.text = countries[indexPath.row].currencies.first?.code
      
      
      
        return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 220.5
  }
  
  
}

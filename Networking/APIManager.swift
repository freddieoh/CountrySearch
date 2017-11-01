//
//  APIManager.swift
//  CountrySearch
//
//  Created by Fredrick Ohen on 10/31/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import Foundation


class APIManager {
  
  static func getCountries(completion: @escaping (_ data:[String])
    -> Void) {
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
      
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        DispatchQueue.main.async {
          // Make UI Change update Server error
          print(data.base64EncodedString())
          
        }
        return
      }
    }
    task.resume()
    print("Session Success MANAGER")
  }
  
  
  
}

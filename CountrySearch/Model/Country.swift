//
//  Country.swift
//  CountrySearch
//
//  Created by Fredrick Ohen on 10/30/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import Foundation

struct Country {

  
  let name: String
  let capital: String
  let flag: String
  let translation: (french: String, japanese: String)
  let currencies: [Currency]

}

enum SerializationError: Error {
  case missing(String)
  case invalid(String,Any)
}

extension Country {
  
  init(json: [String:Any]) throws {
    
    guard let name = json["name"] as? String else {
      throw SerializationError.missing("name")
    }
    
    guard let capital = json["capital"] as? String else {
      throw SerializationError.missing("capital")
    }
    
    guard let flag = json["flag"] as? String else {
      throw SerializationError.missing("flag")
    }
    
    guard let translationsJSON = json["translations"] as? [String: String],
      let french = translationsJSON["fr"],
      let japanese = translationsJSON["ja"]
    else {
      throw SerializationError.missing("translation")
    }

    let translations = (french, japanese)

    
//    guard let currenciesJSON = json["currencies"] as? [[String:String]] else {
//      throw SerializationError.missing("currencies")
//    }
    
    guard let currenciesJSON = json["currencies"] as? [[String: String]],
      let firstCurrency = currenciesJSON.first,
      let code = firstCurrency["code"],
      let symbol = firstCurrency["symbol"],
      let currencyName = firstCurrency["name"]
      else {
        throw SerializationError.missing("currencies")
    }
    
    var currencies: [Currency] = []
    currencies.append(Currency(_code: code, _name: currencyName, _symbol: symbol))
    

    
    self.name = name
    self.capital = capital
    self.flag = flag
    self.translation = translations
    self.currencies = currencies
  
  }
}

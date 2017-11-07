//
//  Currency.swift
//  CountrySearch
//
//  Created by Fredrick Ohen on 11/6/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import Foundation

class Currency {
  var code: String
  var name: String
  var symbol: String
  
  init(_code: String, _name: String, _symbol: String) {
    code = _code
    name = _name
    symbol = _symbol
  }

}

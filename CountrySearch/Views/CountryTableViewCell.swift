//
//  CountryTableViewCell.swift
//  CountrySearch
//
//  Created by Fredrick Ohen on 10/30/17.
//  Copyright © 2017 geeoku. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

  // MARK: Outlets
  
  
  @IBOutlet weak var countryNameLabel: UILabel!
  @IBOutlet weak var languageLabel: UILabel!
  @IBOutlet weak var currencyLabel: UILabel!
  @IBOutlet weak var capitalLabel: UILabel!
  @IBOutlet weak var japaneseTranslationLabel: UILabel!
  @IBOutlet weak var frenchTranslationLabel: UILabel!
  @IBOutlet weak var countryFlagImageView: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

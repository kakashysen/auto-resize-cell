//
//  CollectionViewCell.swift
//  AutoResizeCell
//
//  Created by Jose Aponte on 24/03/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var title: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  func setup(city: CityViewModel) {
    title.text = city.name
  }
  
}

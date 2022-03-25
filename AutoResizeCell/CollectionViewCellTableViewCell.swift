//
//  CollectionViewCellTableViewCell.swift
//  AutoResizeCell
//
//  Created by Jose Aponte on 24/03/22.
//

import UIKit

class CollectionViewCellTableViewCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  private var cities = [CityViewModel]()
  override func awakeFromNib() {
    super.awakeFromNib()
  
    collectionView.delegate = self
    collectionView.dataSource = self
    let nib = UINib(nibName: String(describing: CollectionViewCell.self),
                    bundle: Bundle(for: type(of: self)))
    collectionView.register(nib,
                            forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
    collectionView.collectionViewLayout = UICollectionViewFlowLayout()
  }
  
  
  
  func setup(cities: [CityViewModel]) {
    self.cities = cities
    collectionView.reloadData()
  }


}

extension CollectionViewCellTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cities.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
    let city = cities[indexPath.row]
    cell.setup(city: city)
    return cell
  }
  
}

extension CollectionViewCellTableViewCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: 100)
  }
}

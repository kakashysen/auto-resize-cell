//
//  ViewController.swift
//  AutoResizeCell
//
//  Created by Jose Aponte on 24/03/22.
//

import UIKit

struct CountryViewModel {
  let title: String
  let cities: [CityViewModel]
}

struct CityViewModel {
  let name: String
}
class TableViewController: UITableViewController {

  private var countries = [CountryViewModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "TableView"
    // Do any additional setup after loading the view.
    let nib = UINib(nibName: String(describing: CollectionViewCellTableViewCell.self),
                    bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: String(describing: CollectionViewCellTableViewCell.self))
    
    countries = makeCountries()
    tableView.reloadData()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countries.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CollectionViewCellTableViewCell.self), for: indexPath) as! CollectionViewCellTableViewCell
    
    let country = countries[indexPath.row]
    
    cell.setup(cities: country.cities)
    return cell
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  private func makeCountries() -> [CountryViewModel] {
    let colombia = CountryViewModel(title: "Colombia", cities: [CityViewModel(name: "Bogota"),
                                                                CityViewModel(name: "Tunja"),
                                                                CityViewModel(name: "Duitama"),
                                                                CityViewModel(name: "Medellin"),
                                                                CityViewModel(name: "Cali")])
    return [colombia]
  }
}


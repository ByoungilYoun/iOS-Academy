//
//  ViewController.swift
//  StretchyTableViewHeader
//
//  Created by 윤병일 on 2020/12/02.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  private let tableView : UITableView = {
    let tableView = UITableView()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tableView
  }()
  
  let models = [
    "New York",
    "London",
    "Hong Kong",
    "Seoul",
    "LA",
    "New York",
    "London",
    "Hong Kong",
    "Seoul",
    "LA"
  ]
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.frame = view.bounds
    
    let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
    header.imageView.image = UIImage(named: "image")
    tableView.tableHeaderView = header
  }
}

  //MARK: - UITableViewDelegate
extension ViewController : UITableViewDelegate {
  
}

  //MARK: - UITableViewDataSource
extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = models[indexPath.row]
    return cell
  }
  
  
}


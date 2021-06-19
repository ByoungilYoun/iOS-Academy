//
//  ViewController.swift
//  CollectionCompositLayout
//
//  Created by 윤병일 on 2021/06/19.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  
  private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setCollectionView()
  }
  
  //MARK: - Functions
  private func setCollectionView() {
    view.addSubview(collectionView)
    collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    collectionView.frame = view.bounds
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
  }
}

  //MARK: - extension UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
    return cell
  }
}

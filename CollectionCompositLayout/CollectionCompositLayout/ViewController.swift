//
//  ViewController.swift
//  CollectionCompositLayout
//
//  Created by 윤병일 on 2021/06/19.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  
  private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ViewController.createLayout()
  )
  
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
  
  static func createLayout() -> UICollectionViewCompositionalLayout {
    // Item
    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1)))
    
    item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
    
    
    let verticalStackItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
    
    verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
    
    let VerticalStackGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)), subitem: verticalStackItem, count: 2)
    
    let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
    
    let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitem: tripletItem, count: 3)
    
    // Group
    let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [item, VerticalStackGroup])
    
    let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [horizontalGroup ,tripletHorizontalGroup])
    
    // Sections
    let section = NSCollectionLayoutSection(group: verticalGroup)
    
    // Return
    return UICollectionViewCompositionalLayout(section: section)
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

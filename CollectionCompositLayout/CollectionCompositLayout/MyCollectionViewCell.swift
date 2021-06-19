//
//  MyCollectionViewCell.swift
//  CollectionCompositLayout
//
//  Created by 윤병일 on 2021/06/19.
//

import UIKit

class MyCollectionViewCell : UICollectionViewCell {
  
  //MARK: - Properties
  static let identifier = "MyCollectionViewCell"
  
  private let imageView : UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: .zero)
    contentView.addSubview(imageView)
    
    let images : [UIImage] = [UIImage(named: "image1"), UIImage(named: "image2"), UIImage(named: "image3"), UIImage(named: "image4"), UIImage(named: "image5"), UIImage(named: "image6")].compactMap({$0})
    imageView.image = images.randomElement()
    contentView.clipsToBounds = true
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    imageView.frame = contentView.bounds
  }
  //MARK: - Functions
}

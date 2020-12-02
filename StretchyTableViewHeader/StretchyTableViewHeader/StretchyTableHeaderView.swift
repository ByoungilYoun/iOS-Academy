//
//  StretchyTableHeaderView.swift
//  StretchyTableViewHeader
//
//  Created by 윤병일 on 2020/12/03.
//

import UIKit

final class StretchyTableHeaderView : UIView {
  //MARK: - Properties
  
  public let imageView : UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  private var imageViewHeight = NSLayoutConstraint()
  private var imageViewBottom = NSLayoutConstraint()
  private var containerView = UIView()
  private var containerViewHeight = NSLayoutConstraint()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    createViews()
    setViewConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - createViews()
  private func createViews() {
    addSubview(containerView)
    containerView.addSubview(imageView)
  }
  
  //MARK: - setViewConstraints()
  func setViewConstraints() {
    NSLayoutConstraint.activate([
      widthAnchor.constraint(equalTo: containerView.widthAnchor),
      centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      heightAnchor.constraint(equalTo: containerView.heightAnchor)
    ])
    
    containerView.translatesAutoresizingMaskIntoConstraints = false
    
    containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
    containerViewHeight.isActive = true
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
    imageViewBottom.isActive = true
    imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
    imageViewHeight.isActive = true
  }
  
  //MARK: - Notify view of scroll change from container
  public func scrollViewdidScroll(scrollView : UIScrollView) {
    containerViewHeight.constant = scrollView.contentInset.top
    let offsetY = -(scrollView.contentOffset.y) + scrollView.contentInset.top
    containerView.clipsToBounds = offsetY <= 0
    imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
    imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
  }
}

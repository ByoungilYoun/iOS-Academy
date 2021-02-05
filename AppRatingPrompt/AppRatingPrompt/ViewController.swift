//
//  ViewController.swift
//  AppRatingPrompt
//
//  Created by 윤병일 on 2021/02/05.
//

import UIKit
import StoreKit

class ViewController: UIViewController {
  
  //MARK: - Properties
  private let button : UIButton = {
    let button = UIButton()
    button.setTitle("Rate Now", for: .normal)
    button.backgroundColor = .systemBlue
    button.setTitleColor(.white, for: .normal)
    return button
  }()

  //MARK: - viewDidLoad()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(button)
    
    button.frame = CGRect(x: 0, y: 0, width: 200, height: 55)
    button.center = view.center
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    
  }

  //MARK: - @objc func didTapButton
  @objc private func didTapButton() {
    guard let scene = view.window?.windowScene else {
      print("no scene")
      return
    }
    
    SKStoreReviewController.requestReview(in: scene)
  }

}


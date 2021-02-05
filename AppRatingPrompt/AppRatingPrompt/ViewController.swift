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
    let alert = UIAlertController(title: "Feedback", message: "Are you enjoying app?", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
    
    // 사용자들이 좋아하면 평점을 받는다.
    alert.addAction(UIAlertAction(title: "Yes, I love it", style: .default, handler: { [weak self] _ in
      guard let scene = self?.view.window?.windowScene else {
        print("no scene")
        return
      }
      SKStoreReviewController.requestReview(in: scene)
    }))
    
    // 사용자들이 별로 싫어하면 평점을 안받고 피드백을 받는다.
    alert.addAction(UIAlertAction(title: "No, it sucks!", style: .default, handler: { _ in
      // collect feedback
      // 1. Prompt user to email you
      // 2. Open safari to your contact page
    }))
    
    present(alert, animated: true, completion: nil)
    
  }

}


//
//  ViewController.swift
//  WKWebKitViewPractice
//
//  Created by 윤병일 on 2020/12/01.
//

import UIKit

class ViewController: UIViewController {

  private let button : UIButton = {
    let button = UIButton()
    button.setTitle("Show Webpage", for: .normal)
    button.backgroundColor = .link
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(button)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    button.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
    button.center = view.center
    
  }
  
  @objc private func didTapButton() {
    
  }


}


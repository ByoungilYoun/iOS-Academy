//
//  ViewController.swift
//  WebViewPractice
//
//  Created by 윤병일 on 2020/11/26.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

  //MARK: - Properties
  
  let safariButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("Go to Apple", for: .normal)
    bt.setTitleColor(.black, for: .normal)
    bt.backgroundColor = .yellow
    bt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    return bt
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(safariButton)
    
    safariButton.translatesAutoresizingMaskIntoConstraints = false
    safariButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    safariButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  @objc func buttonTapped() {
    let vc = SFSafariViewController(url: URL(string: "https://www.apple.com")!)
    present(vc, animated: true, completion: nil)
  }


}

 

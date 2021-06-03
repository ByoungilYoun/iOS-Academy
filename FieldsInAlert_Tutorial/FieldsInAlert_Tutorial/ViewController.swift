//
//  ViewController.swift
//  FieldsInAlert_Tutorial
//
//  Created by 윤병일 on 2021/06/04.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  //MARK: - Properties
  lazy var showAlertbutton : UIButton = {
    let bt = UIButton()
    bt.backgroundColor = .systemBlue
    bt.setTitle("Show Alert", for: .normal)
    bt.setTitleColor(.white, for: .normal)
    bt.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    return bt
  }()
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
  }
  //MARK: - Functions

  private func setUI() {
    view.addSubview(showAlertbutton)
    
    showAlertbutton.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalTo(200)
      $0.height.equalTo(50)
    }
  }

  //MARK: - @objc func
  @objc private func showAlert() {
    let alert = UIAlertController(title: "Sign In With Apple ID", message: "Please sign in to your account to continue", preferredStyle: .alert)
    
    
    
    // Add 2 buttons
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
      // Read textfield values
      
    }))
    present(alert, animated: true)
  }
}


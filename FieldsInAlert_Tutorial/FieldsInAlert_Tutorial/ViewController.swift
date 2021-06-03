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
    
    // Add 2 textFields
    alert.addTextField { field in
      field.placeholder = "Email Address"
      field.returnKeyType = .next
      field.keyboardType = .emailAddress
    }
    
    alert.addTextField { field in
      field.placeholder = "Password"
      field.returnKeyType = .continue
      field.isSecureTextEntry = true
    }
    
    // Add 2 buttons
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
      // Read textfield values
      guard let fields = alert.textFields, fields.count == 2 else {return} // array of textFields
      
      let emailField = fields[0]
      let passwordField = fields[1]
      
      guard let email = emailField.text , !email.isEmpty, let password = passwordField.text, !password.isEmpty else {
        print("Invalid entries ")
        return
      }
      print("Email : \(email), Password : \(password)")
    }))
    present(alert, animated: true)
  }
}


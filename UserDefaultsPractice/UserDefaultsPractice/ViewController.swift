//
//  ViewController.swift
//  UserDefaultsPractice
//
//  Created by 윤병일 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  private let myTextField : UITextField = {
    let tf = UITextField()
    tf.textColor = .black
    tf.backgroundColor = .white
    return tf
  }()
  
  private let myLabel : UILabel = {
    let lb = UILabel()
    lb.text = "안녕하세요"
    lb.textColor = .black
    lb.textAlignment = .center
    lb.numberOfLines = 0
    return lb
  }()
  
//  let userDefaults = UserDefaults(suiteName: "com.byoungil.youn.UserDefaultsPractice")
  //MARK: - Function (viewDidLoad)
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemIndigo
    configureUI()
    
  }

  //MARK: - Function (configureUI)
  private func configureUI() {
    [myTextField, myLabel].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    myTextField.delegate = self
    
    if let value = UDM.shared.defaults.value(forKey: "name") as? String {
      myLabel.text = value
    }
    
    NSLayoutConstraint.activate([
      myTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      myTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      myTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      myTextField.heightAnchor.constraint(equalToConstant: 52),
      
      myLabel.topAnchor.constraint(equalTo: myTextField.bottomAnchor, constant: 30),
      myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      myLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      myLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
    ])
  }
}

  //MARK: - UITextFieldDelegate
extension ViewController : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    UDM.shared.defaults.setValue(myTextField.text, forKey: "name")
    myTextField.resignFirstResponder()
    return true
  }
}

// User Default Manager
class UDM {
  static let shared = UDM()
//  let defaults = UserDefaults(suiteName: "com.byoungil.youn.UserDefaultsPractice")!
  let defaults = UserDefaults()
  
  // Other funcs , 예를 들면
//  func getName() -> String {
//    return ""
//  }
}

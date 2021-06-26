//
//  ViewController.swift
//  PinchToZoomGesture
//
//  Created by 윤병일 on 2021/06/26.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  private let myView : UIView = {
    let myView = UIView()
    myView.backgroundColor = .systemPurple
    return myView
  }()
  
  private let size : CGFloat = 200
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setView()
  }

  //MARK: - Functions
  private func setView() {
    view.addSubview(myView)
    myView.frame = CGRect(x: 0, y: 0, width: size, height: size)
    myView.center = view.center
    
    addGesture()
  }
  
  private func addGesture() {
    let pinchGesture = UIPinchGestureRecognizer(target: self,
                                                action: #selector(didPinch(_:)))
    myView.addGestureRecognizer(pinchGesture)
  }
  
  //MARK: - @objc func
  @objc private func didPinch(_ gesture : UIPinchGestureRecognizer) {
    if gesture.state == .changed {
      let scale = gesture.scale
      myView.frame = CGRect(x: 0, y: 0, width: size * scale, height: size * scale)
      myView.center = view.center
    }
  }
}


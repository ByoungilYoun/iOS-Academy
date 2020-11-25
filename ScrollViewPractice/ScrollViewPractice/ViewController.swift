//
//  ViewController.swift
//  ScrollViewPractice
//
//  Created by 윤병일 on 2020/11/26.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    // scrollView 생성
    let scrollView = UIScrollView(frame: CGRect(x: 10, y: 10, width: view.frame.size.width - 20, height: view.frame.size.height - 20))
    scrollView.backgroundColor = .green
    view.addSubview(scrollView)
    
    // topButton 생성
    let topButton = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
    topButton.backgroundColor = .blue
    scrollView.addSubview(topButton)
    
    // bottomButton 생성
    let bottomButton = UIButton(frame: CGRect(x: 20, y: 2000, width: 100, height: 100))
    bottomButton.backgroundColor = .blue
    scrollView.addSubview(bottomButton)
    
    // scrollView 사이즈 정해주기
    scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2200)
    
//    scrollView 의 여러 속성이 있다.
//    scrollView.delegate
//    scrollView.contentOffset.x
//    scrollView.contentOffset.y
  }
}


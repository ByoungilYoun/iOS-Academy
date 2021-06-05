//
//  ViewController.swift
//  FileManagerTutorial
//
//  Created by 윤병일 on 2021/06/05.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let manager = FileManager.default
    guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
    
    
    let newFolderUrl = url.appendingPathComponent("ios-academy") // ios-academy 라는 폴더 url 생성
    let secondSubFolder = url.appendingPathComponent("second-test").appendingPathComponent("ios-academy").appendingPathComponent("ios-academy").appendingPathComponent("ios-academy") // 폴더 타고 타고 들어가는 구조
    
    do {
      // 디렉토리 폴더 생성 
      try manager.createDirectory(at: newFolderUrl, withIntermediateDirectories: true, attributes: [:])
      try manager.createDirectory(at: secondSubFolder, withIntermediateDirectories: true, attributes: [:])
    }
    catch {
      print(error)
    }
    
  }


}


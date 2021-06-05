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
//    let secondSubFolder = url.appendingPathComponent("second-test").appendingPathComponent("ios-academy").appendingPathComponent("ios-academy").appendingPathComponent("ios-academy") // 폴더 타고 타고 들어가는 구조
    
    // logs.text 에 string text 넣기
//    let fileUrl = newFolderUrl.appendingPathComponent("logs. txt") // logs.txt 라는 파일 생성
//    let data = "Writing text to a text file!".data(using : .utf8) // 텍스트 string 을 data 로 생성해서 content 에 넣으면 적힌다.
//    manager.createFile(atPath: fileUrl.path, contents: data, attributes: [FileAttributeKey.creationDate: Date()])
    
    
    // 2. delete
    let fileUrl = url.appendingPathComponent("ios-academy")
    if manager.fileExists(atPath: fileUrl.path) {
      do {
        try manager.removeItem(at: fileUrl)
      }
      catch {
        print(error)
      }
    }
  }


}


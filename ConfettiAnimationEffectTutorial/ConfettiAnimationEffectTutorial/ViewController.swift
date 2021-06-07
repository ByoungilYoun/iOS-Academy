//
//  ViewController.swift
//  ConfettiAnimationEffectTutorial
//
//  Created by 윤병일 on 2021/06/07.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    createLayer()
  }
  
  //MARK: - Functions
  private func createLayer() {
    let layer = CAEmitterLayer()
    layer.emitterPosition = CGPoint(x: view.center.x, y: view.center.y) // where to start
    
    let cell = CAEmitterCell()
    cell.scale = 0.1
    cell.emissionRange = .pi * 2
    cell.lifetime = 20 // lifetime of the cell
    cell.birthRate = 100
    cell.velocity = 200 // 속도
    cell.color = UIColor.systemPink.cgColor // Important! 하얀 이미지를 사용해야 색이 render 되서 입혀진다.
    cell.contents = UIImage(named: "image2")!.cgImage
    
    layer.emitterCells = [cell]
    view.layer.addSublayer(layer)
  }

}


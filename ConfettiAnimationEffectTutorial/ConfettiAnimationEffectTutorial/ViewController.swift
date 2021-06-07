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
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    view.addSubview(button)
    button.backgroundColor = .systemBlue
    button.center = view.center
    button.setTitle("FINISH", for: .normal)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }
  
  //MARK: - Functions
  private func createLayer() {
    let layer = CAEmitterLayer()
    layer.emitterPosition = CGPoint(x: view.center.x, y: -100) // where to start
    
    let colors : [UIColor] = [.systemRed, .systemBlue, .systemOrange, .systemGreen, .systemPink, .systemYellow]
    
    let cells : [CAEmitterCell] = colors.compactMap {
      let cell = CAEmitterCell()
      cell.scale = 0.05 // 크기
      cell.emissionRange = .pi * 2
      cell.lifetime = 10 // lifetime of the cell
      cell.birthRate = 50
      cell.velocity = 150 // 속도
      cell.color = $0.cgColor // Important! 하얀 이미지를 사용해야 색이 render 되서 입혀진다.
      cell.contents = UIImage(named: "image2")!.cgImage
      return cell
    }
    
    layer.emitterCells = cells
    view.layer.addSublayer(layer)
  }

  @objc private func didTapButton() {
    createLayer()
  }
}


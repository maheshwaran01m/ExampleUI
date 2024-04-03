//
//  CustomAnimationVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomAnimationVC: UIViewController {
  
  
  private let imageView = UIImageView()
  
  private let button = UIButton()
  
  private var currentAnimation = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    view.addSubview(imageView)
    imageView.image = .init(systemName: "star.fill")
    
    imageView.make {
      $0.top(view.safeAreaLayoutGuide.topAnchor, constant: 10)
      $0.centerX(view.centerXAnchor)
      $0.height(200)
      $0.width(200)
    }
    
    // button
    button.setTitle("Tap", for: .normal)
    button.backgroundColor = .link
    button.border(16)
    
    view.addSubview(button)
    
    button.make {
      $0.bottom(view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
      $0.height(44)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
    }
    
    button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
  }
  
  @objc func buttonClicked() {
    button.isHidden = false
    
    UIView.animate(
      withDuration: 1,
      delay: 0,
      usingSpringWithDamping: 0.5, // with spring Animation
      initialSpringVelocity: 5,
      
      options: [],
      animations: { [weak self] in
        guard let self else { return }
        switch currentAnimation {
          
        case 0:
          imageView.transform = .init(scaleX: 2, y: 2)
        case 1:
          imageView.transform = .identity
        case 2:
          imageView.transform = .init(translationX: -256, y: -256)
        case 3:
          imageView.transform = .identity
        case 4:
          imageView.transform = .init(rotationAngle: CGFloat.pi)
        case 5:
          imageView.transform = .identity
        case 6:
          imageView.alpha = 0.1
          imageView.backgroundColor = UIColor.green
          
        case 7:
          imageView.alpha = 1
          imageView.backgroundColor = UIColor.clear
          
        default: break
        }
      }, completion: { [weak self] isFinished in
        self?.button.isHidden = false
      })
    
    currentAnimation += 1
    
    if currentAnimation > 7 {
      currentAnimation = 0
    }
  }
}


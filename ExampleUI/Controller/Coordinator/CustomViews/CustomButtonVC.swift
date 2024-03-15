//
//  CustomButtonVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomButtonVC: UIViewController {
  
  lazy var topButton: UIButton = {
    $0.setTitle("Submit", for: .normal)
    $0.backgroundColor = .link
    $0.titleLabel?.font = .font(.headline)
    $0.layer.cornerRadius = 16
    return $0
  }(UIButton())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    
    view.addSubview(topButton)
    topButton.addTarget(self, action: #selector(topButtonClicked), for: .touchUpInside)
    
    topButton.make {
      $0.centerY(view.centerYAnchor)
      $0.height(44)
      $0.leading(view.leadingAnchor, constant: 5)
      $0.trailing(view.trailingAnchor, constant: -5)
    }
  }
  
  @objc func topButtonClicked() {
    print("Button Clicked")
  }
}

//
//  CustomTextVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

class CustomTextVC: UIViewController {
  
  private var textLabel: UILabel = {
    $0.text = "Label"
    $0.font = .font(.subheadline)
    $0.textAlignment = .center
    return $0
  }(UILabel())
  
  private var detailLabel: UILabel = {
    $0.text = "DetailLabel"
    $0.font = .font(.subheadline)
    $0.textAlignment = .center
    return $0
  }(UILabel())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    title = "Text"
    view.backgroundColor = .systemBackground
    setupLabel()
  }
  
  private func setupLabel() {
    view.addSubview(textLabel)
    
    textLabel.backgroundColor = .secondarySystemBackground
    textLabel.border(16, width: 1, color: .gray)
    
    view.addSubview(detailLabel)
    detailLabel.backgroundColor = .systemCyan.withAlphaComponent(0.5)
    detailLabel.border(20, width: 1, color: .red)
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    textLabel.make {
      $0.centerX(view.centerXAnchor)
      $0.centerY(view.centerYAnchor)
      $0.height(44)
      $0.width(textLabel.contentWidth + 40)
    }
    
    detailLabel.make {
      $0.top(textLabel.bottomAnchor, constant: 10)
      $0.height(44)
      $0.width(detailLabel.contentWidth + 40)
      $0.leading(textLabel.leadingAnchor)
    }
  }
}

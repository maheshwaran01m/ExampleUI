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
    detailLabel.backgroundColor = .red
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    detailLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      textLabel.heightAnchor.constraint(equalToConstant: 44),
      textLabel.widthAnchor.constraint(equalToConstant: textLabel.width + 40),
      
      detailLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
      detailLabel.heightAnchor.constraint(equalToConstant: 44),
      detailLabel.widthAnchor.constraint(equalToConstant: detailLabel.width + 40),
      detailLabel.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor)
    ])
  }
}

//
//  CustomImageView.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 30/01/24.
//

import UIKit

class CustomImageView: UIViewController {
  
  private var avatarImageView = AvatarImage()
  private var bellImageView = AvatarImage()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    title = "Image"
    view.backgroundColor = .systemBackground
    setupLabel()
  }
  
  private func setupLabel() {
    view.addSubviews(avatarImageView, bellImageView)
    
    avatarImageView.image = Icon.bell
    avatarImageView.setCornerRadius(.custom(12), borderColor: .red, width: 1)
    
    bellImageView.image = Icon.personCircle
    bellImageView.tintColor = .red
    bellImageView.setCornerRadius(.rounded, borderColor: .gray, width: 1)
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    avatarImageView.make {
      $0.top(view.safeAreaLayoutGuide.topAnchor, constant: 10)
      $0.centerX(view.centerXAnchor)
      $0.width(75)
      $0.height(75)
    }
    
    bellImageView.make {
      $0.top(avatarImageView.bottomAnchor, constant: 10)
      $0.centerX(view.centerXAnchor)
      $0.width(75)
      $0.height(75)
    }
  }
}

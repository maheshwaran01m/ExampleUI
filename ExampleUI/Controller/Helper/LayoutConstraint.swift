//
//  LayoutConstraint.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 28/01/24.
//

import UIKit

extension UIView {
  
  func edges(to superView: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
      leadingAnchor.constraint(equalTo: superView.leadingAnchor),
      trailingAnchor.constraint(equalTo: superView.trailingAnchor),
      bottomAnchor.constraint(equalTo: superView.bottomAnchor),
    ])
  }
}

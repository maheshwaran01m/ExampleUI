//
//  UIViewExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

extension UIView {
  
  func addSubviews(_ views: UIView...) {
    for view in views {
      addSubview(view)
    }
  }
  
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

// MARK: - Border

extension UIView {
  
  func border(_ radius: CGFloat, width: CGFloat, color: UIColor = .clear) {
    layer.cornerRadius = radius
    layer.masksToBounds = true
    layer.borderColor = color.cgColor
    layer.borderWidth = width
    
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSizeMake(2.0, 2.0)
    layer.shadowOpacity = 1.0
  }
}

// MARK: - Size

extension UIView {
  
  var height: CGFloat {
    intrinsicContentSize.height
  }
  
  var width: CGFloat {
    intrinsicContentSize.width
  }
  
  var size: CGSize {
    intrinsicContentSize
  }
}

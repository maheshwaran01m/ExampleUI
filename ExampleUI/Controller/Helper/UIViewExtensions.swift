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
  
  func autoresizingMask(_ views: UIView..., to value: Bool = false) {
    for view in views {
      view.translatesAutoresizingMaskIntoConstraints = value
    }
  }
}

// MARK: - Border

extension UIView {
  
  func border(_ radius: CGFloat, width: CGFloat, color: UIColor = .clear, showShadow: Bool = false) {
    layer.cornerRadius = radius
    layer.masksToBounds = true
    layer.borderColor = color.cgColor
    layer.borderWidth = width
    
    if showShadow {
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOffset = CGSizeMake(2.0, 2.0)
      layer.shadowOpacity = 1.0
    }
  }
}

// MARK: - Size

extension UIView {
  
  var contentHeight: CGFloat {
    intrinsicContentSize.height
  }
  
  var contentWidth: CGFloat {
    intrinsicContentSize.width
  }
  
  var contentSize: CGSize {
    intrinsicContentSize
  }
}

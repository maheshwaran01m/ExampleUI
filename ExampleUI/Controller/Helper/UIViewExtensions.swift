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
  
  func border(_ radius: CGFloat, width: CGFloat = 1, color: UIColor = .clear, showShadow: Bool = false) {
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

// MARK: - UIColor

extension UIColor {
  
  public func opacity(_ value: CGFloat) -> UIColor {
    withAlphaComponent(value)
  }
  
  var disabled: UIColor {
    let selector = NSSelectorFromString("_disabledColorForColor:")
    let color = perform(selector, with: self).takeUnretainedValue()
    
    return color as? UIColor ?? self
  }
}

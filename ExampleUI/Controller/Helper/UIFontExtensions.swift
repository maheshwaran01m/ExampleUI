//
//  UIFontExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

extension UIFont {
  
  class func font(_ style: UIFont.TextStyle) -> UIFont {
    .preferredFont(forTextStyle: style)
  }
}

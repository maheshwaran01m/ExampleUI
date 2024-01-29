//
//  Constants.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 28/01/24.
//

import UIKit

enum Constants {
  
  static var keyWindow: UIWindow? {
    UIApplication
      .shared
      .connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .first?.windows
      .filter { $0.isKeyWindow }
      .first
  }
  
  static var top: CGFloat {
    keyWindow?.safeAreaInsets.top ?? .zero
  }
  
  static var bottom: CGFloat {
    keyWindow?.safeAreaInsets.bottom ?? .zero
  }
  
  static var width: CGFloat {
    keyWindow?.frame.width ?? .zero
  }
  
  static var height: CGFloat {
    keyWindow?.frame.height ?? .zero
  }
}

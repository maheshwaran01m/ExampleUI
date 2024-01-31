//
//  UITextViewExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 31/01/24.
//

import UIKit

extension UITextView {
  
  func addDoneButton() {
    let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: Constants.width, height: 44))
    toolBar.barStyle = .default
    
    let doneButton = UIBarButtonItem(systemItem: .done, primaryAction: .init(handler: { [weak self] _ in
      self?.resignFirstResponder()
    }))
    
    toolBar.items = [.flexibleSpace(), doneButton]
    toolBar.sizeToFit()
    inputAccessoryView = toolBar
  }
}


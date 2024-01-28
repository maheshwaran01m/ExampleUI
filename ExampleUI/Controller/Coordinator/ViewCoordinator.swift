//
//  ViewCoordinator.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

enum ViewCoordinator: CaseIterable {
  case text, textField
  
  var title: String {
    switch self {
    case .text: return "Text"
    case .textField: return "TextField"
    }
  }
  
  var destinationView: UIViewController {
    switch self {
    case .text: return CustomTextVC()
    case .textField: return CustomTextFieldVC()
    }
  }
}

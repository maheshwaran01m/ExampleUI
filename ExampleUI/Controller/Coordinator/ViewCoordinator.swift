//
//  ViewCoordinator.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

enum ViewCoordinator: CaseIterable {
  case text, textField, image
  
  var title: String {
    switch self {
    case .text: return "Text"
    case .textField: return "TextField"
    case .image: return "Image"
    }
  }
  
  var destinationView: UIViewController {
    switch self {
    case .text: return CustomTextVC()
    case .textField: return CustomTextFieldVC()
    case .image: return CustomImageView()
    }
  }
}

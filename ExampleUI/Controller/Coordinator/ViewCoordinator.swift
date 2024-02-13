//
//  ViewCoordinator.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

enum ViewCoordinator: CaseIterable {
  case text, textField, textView, image, search
  
  var title: String {
    switch self {
    case .text: return "Text"
    case .textField: return "TextField"
    case .textView: return "TextView"
    case .image: return "Image"
    case .search: return "Search"
    }
  }
  
  var destinationView: UIViewController {
    switch self {
    case .text: return CustomTextVC()
    case .textField: return CustomTextFieldVC()
    case .textView: return CustomTextViewVC()
    case .image: return CustomImageView()
    case .search: return CustomSearchVC()
    }
  }
}

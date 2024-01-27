//
//  ViewCoordinator.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

enum ViewCoordinator: CaseIterable {
  case text
  
  var title: String {
    switch self {
    case .text: return "Text"
    }
  }
  
  var destinationView: UIViewController {
    switch self {
    case .text: return CustomTextVC()
    }
  }
}

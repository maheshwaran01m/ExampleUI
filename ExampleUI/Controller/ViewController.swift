//
//  ViewController.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

class ViewController: UIViewController {
  
  private var searchText = ""
  
  private var filterVC: [ViewCoordinator] {
    guard searchText.isNotEmpty else { return ViewCoordinator.allCases }
    return ViewCoordinator.allCases
      .filter { $0.title.lowercased().localizedStandardContains(searchText ) }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    title = "Example"
    view.backgroundColor = .systemBackground
  }
}


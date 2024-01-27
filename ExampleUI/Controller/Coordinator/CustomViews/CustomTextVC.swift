//
//  CustomTextVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

class CustomTextVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    title = "Text"
    view.backgroundColor = .systemBackground
  }
}

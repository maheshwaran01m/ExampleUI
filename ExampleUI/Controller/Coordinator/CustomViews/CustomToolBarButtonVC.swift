//
//  CustomToolBarButtonVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomToolBarButtonVC: UIViewController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Open URL",
      style: .done,
      target: self,
      action: #selector(openButtonClicked))
  }
  
  @objc private func openButtonClicked() {
    
    let alert = UIAlertController(
      title: "Example will leave and open safari",
      message: nil,
      preferredStyle: .actionSheet)
    
    alert.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
    
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    
    alert.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    detail(alert)
  }
  
  func openPage(action: UIAlertAction) {
    let url = URL(string: "https://" + action.title!)!
    UIApplication.shared.open(url)
  }
}


//
//  CustomDialogAlertVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomDialogAlertVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    
    let button = UIButton()
    button.setTitle("Open URL", for: .normal)
    button.backgroundColor = .link
    button.border(22)
    button.addTarget(
      self,
      action: #selector(openButtonClicked),
      for: .touchUpInside)
    
    view.addSubview(button)
    
    button.make {
      $0.bottom(view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
      $0.height(44)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
    }
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


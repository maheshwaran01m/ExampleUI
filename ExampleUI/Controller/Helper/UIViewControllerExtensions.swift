//
//  UIViewControllerExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 28/01/24.
//

import UIKit

extension UIViewController {
  
  func autoresizingMask(_ views: UIView..., to value: Bool = false) {
    for view in views {
      view.translatesAutoresizingMaskIntoConstraints = value
    }
  }
  
  func show(_ vc: UIViewController) {
    show(vc, sender: self)
  }
  
  func detail(_ vc: UIViewController) {
    showDetailViewController(vc, sender: self)
  }
  
  var presenterVC: UIViewController {
    parent?.presenterVC ?? parent ?? self
  }
  
  static func newInstance() -> Self {
    Self(nibName: "\(self)", bundle: nil)
  }
  
  func enableLargeTitles(_ enable: Bool) {
    navigationController?.navigationBar.prefersLargeTitles = enable
    navigationItem.largeTitleDisplayMode = enable ? .always : .never
  }
}

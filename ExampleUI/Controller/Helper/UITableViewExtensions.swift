//
//  UITableViewExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

protocol ResusableIdentifier: AnyObject {
  static var reuseIdentifier: String { get }
}

extension ResusableIdentifier {
  
  static var reuseIdentifier: String {
    String(describing: self)
  }
}

// MARK: -

extension UITableViewCell: ResusableIdentifier {}
extension UITableViewHeaderFooterView: ResusableIdentifier {}

extension UITableView {
  
  func register<T: UITableViewCell>(_ : T.Type) {
    register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func registerNib<T: UITableViewCell>(_: T.Type) {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
    register(nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func registerHeaderNib<T: UITableViewHeaderFooterView>(_: T.Type) {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
    register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(
      withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
  
  func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(for section: Int) -> T {
    guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
      fatalError("Could not dequeue HeaderFooterView with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
}

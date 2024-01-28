//
//  UICollectionViewExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

extension UICollectionViewCell: ResusableIdentifier {}

extension UICollectionView {
  
  func register<T: UICollectionViewCell>(_: T.Type) {
    register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
  
  func registerNib<T: UICollectionViewCell>(_: T.Type) {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
    register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(
      withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
    }
    return cell
  }
}

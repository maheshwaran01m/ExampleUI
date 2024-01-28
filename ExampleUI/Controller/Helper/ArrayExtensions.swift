//
//  ArrayExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

extension Sequence where Iterator.Element: Hashable {
  
  var unique: [Iterator.Element] {
    var inserted = Set<Iterator.Element>()
    return filter { inserted.insert($0).inserted }
  }
}

extension Collection {
  
  ///  ```
  ///   var collection = [1,2,3,4,5],
  ///   let value = collection[index: 6] // nil 
  ///  ```
  ///
  subscript(index index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
  
  var isNotEmpty: Bool { !isEmpty }
}

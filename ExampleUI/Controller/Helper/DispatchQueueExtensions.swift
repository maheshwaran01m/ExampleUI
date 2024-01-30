//
//  DispatchQueueExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 29/01/24.
//

import UIKit

extension DispatchQueue {
  
  static func mainAsyncIfNeeded(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
      work()
    } else {
      main.async(execute: work)
    }
  }
}

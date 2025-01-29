//
//  Observable.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 28/01/25.
//

import Foundation

/// `Observable` is used to bind view and viewModel
///
///  Example Usage
///  ```
///  class ExampleVC {
///
///   //  View
///
///    private var viewModel = ExampleVM()
///
///      func setupBinding() {
///         viewModel.records.bind { records in
///             print(records)
///          }
///      }
///
///   // ViewModel
///
///     class ExampleVM {
///
///        var records = Observable<[String]>([])
///      }
///   }
///  ```
///
final class Observable<T> {
  
  typealias Listener = (T) -> Void
  
  private var listener: ((T) -> Void)?
  
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(_ listener: @escaping (T) -> Void) {
    self.listener = listener
    listener(value)
  }
}

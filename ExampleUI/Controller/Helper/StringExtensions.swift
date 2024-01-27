//
//  StringExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import Foundation

extension String {
  
  var isNotEmpty: Bool {
    !trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
}

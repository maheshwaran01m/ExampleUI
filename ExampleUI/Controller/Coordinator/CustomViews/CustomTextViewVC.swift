//
//  CustomTextViewVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 31/01/24.
//

import UIKit

class CustomTextViewVC: UIViewController {
  
  private let titleTextView: PlaceholderTextView = {
    $0.setPlaceholder("Enter your text")
    $0.backgroundColor = .systemGray6
    $0.border(12, color: .secondaryLabel)
    
    return $0
  }(PlaceholderTextView())
  
  private let decimalTextView: PlaceholderTextView = {
    $0.setPlaceholder("Enter your Value")
    $0.backgroundColor = .systemGray6
    $0.border(12, color: .secondaryLabel)
    
    return $0
  }(PlaceholderTextView())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  private func setupViews() {
    title = "TextView"
    view.backgroundColor = .systemBackground
    view.addSubviews(titleTextView, decimalTextView)
    
    titleTextView.delegate = self
    titleTextView.addDoneButton()
    
    decimalTextView.delegate = self
    decimalTextView.addDoneButton()
    decimalTextView.keyboardType = .decimalPad
    
    titleTextView.make {
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
      $0.top(view.safeAreaLayoutGuide.topAnchor, constant: 20)
      $0.height(100)
    }
    
    decimalTextView.make {
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
      $0.top(titleTextView.bottomAnchor, constant: 10)
      $0.height(44)
    }
  }
}

extension CustomTextViewVC: UITextViewDelegate {
  
  func textViewDidEndEditing(_ textView: UITextView) {
    textView.text = textView.text.trimmingCharacters(in: .whitespacesAndNewlines)
  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange,
                replacementText text: String) -> Bool {
    
    if  textView == decimalTextView {
      // valid letters
      let vaildSet = NSCharacterSet(charactersIn: "0123456789.").inverted
      let filtered = text.components(separatedBy: vaildSet).joined(separator: "")
      
      let validLetter = text == filtered // only digits
      
      // maxLimit
      let currentString = (textView.text ?? "") as NSString
      let newString = currentString.replacingCharacters(in: range, with: text)
      
      let maxLimit = newString.count <= 10 // max limit
      
      // to resolve multiple dots
      if currentString.contains(".") && text == "." {
        return false
      }
      return validLetter && maxLimit
    }
    
    return true
  }
}

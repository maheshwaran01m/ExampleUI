//
//  CustomTextFieldVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

class CustomTextFieldVC: UIViewController {
  
  private lazy var scrollView: UIScrollView = {
    $0.clipsToBounds = true
    $0.isScrollEnabled = true
    $0.isUserInteractionEnabled = true
    $0.backgroundColor = .systemBackground
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIScrollView())
  
  private let contentView = UIView()
  
  private lazy var emailField: UITextField = {
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.returnKeyType = .next
    $0.keyboardType = .emailAddress
    $0.layer.cornerRadius = 16
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.placeholder = "Email Address"
    $0.leftView = .init(frame: .init(x: 0, y: 0, width: 10, height: 0))
    $0.leftViewMode = .always
    $0.delegate = self
    $0.clearButtonMode = .whileEditing
    $0.backgroundColor = .secondarySystemGroupedBackground
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UITextField())
  
  private lazy var passwordField: UITextField = {
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.returnKeyType = .done
    $0.isSecureTextEntry = true
    $0.layer.cornerRadius = 16
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.placeholder = "Password"
    $0.leftView = .init(frame: .init(x: 0, y: 0, width: 10, height: 0))
    $0.leftViewMode = .always
    $0.delegate = self
    $0.clearButtonMode = .whileEditing
    $0.backgroundColor = .secondarySystemGroupedBackground
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UITextField())
  
  private lazy var decimalField: UITextField = {
    $0.autocapitalizationType = .none
    $0.autocorrectionType = .no
    $0.returnKeyType = .done
    $0.layer.cornerRadius = 16
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.lightGray.cgColor
    $0.placeholder = "Decimal"
    $0.keyboardType = .decimalPad
    
    $0.leftView = .init(frame: .init(x: 0, y: 0, width: 10, height: 0))
    $0.leftViewMode = .always
    $0.delegate = self
    $0.clearButtonMode = .whileEditing
    $0.backgroundColor = .secondarySystemGroupedBackground
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UITextField())
  
  private lazy var emojiField: UITextField = {
    $0.keyboardType = UIKeyboardType(rawValue: 124) ?? .default // Emoji
    $0.placeholder = "Enter your Emoji"
    $0.returnKeyType = .done
    $0.layer.cornerRadius = 16
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.lightGray.cgColor
    
    $0.leftView = .init(frame: .init(x: 0, y: 0, width: 10, height: 0))
    $0.leftViewMode = .always
    $0.delegate = self
    $0.clearButtonMode = .whileEditing
    $0.backgroundColor = .secondarySystemGroupedBackground
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UITextField())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    title = "Text Field"
    view.backgroundColor = .systemBackground
    setupConstraints()
  }
  
  private func setupConstraints() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubviews(emailField, passwordField, decimalField, emojiField)
    contentView.backgroundColor = .systemBackground
    
    let viewHeight: CGFloat = 44
    let padding: CGFloat = 20
    
    autoresizingMask(scrollView, contentView, emailField, passwordField, decimalField, emojiField)
    scrollView.edges(to: view)
    contentView.edges(to: scrollView)
    
    decimalField.addDoneButton()
    emojiField.addDoneButton()
    
    contentView.make {
      $0.width(scrollView.widthAnchor)
      $0.height(scrollView.heightAnchor)
    }
    
    emailField.make {
      $0.top(contentView.topAnchor, constant: padding)
      $0.leading(contentView.leadingAnchor, constant: padding)
      $0.trailing(contentView.trailingAnchor, constant: -padding)
      $0.height(viewHeight)
    }
    
    passwordField.make {
      $0.top(emailField.bottomAnchor, constant: padding)
      $0.leading(contentView.leadingAnchor, constant: padding)
      $0.trailing(contentView.trailingAnchor, constant: -padding)
      $0.height(viewHeight)
    }
    
    decimalField.make {
      $0.top(passwordField.bottomAnchor, constant: padding)
      $0.leading(contentView.leadingAnchor, constant: padding)
      $0.trailing(contentView.trailingAnchor, constant: -padding)
      $0.height(viewHeight)
    }
    
    emojiField.make {
      $0.top(decimalField.bottomAnchor, constant: padding)
      $0.leading(contentView.leadingAnchor, constant: padding)
      $0.trailing(contentView.trailingAnchor, constant: -padding)
      $0.height(viewHeight)
    }
  }
}

extension CustomTextFieldVC: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == emailField {
      passwordField.becomeFirstResponder()
    } else if textField == passwordField {
      decimalField.becomeFirstResponder()
    } else if textField == decimalField {
      emojiField.becomeFirstResponder()
    } else if textField == emojiField {
      emojiField.resignFirstResponder()
    }
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    
    if  textField == decimalField {
      // valid letters
      let vaildSet = NSCharacterSet(charactersIn: "0123456789.").inverted
      let filtered = string.components(separatedBy: vaildSet).joined(separator: "")
      
      let validLetter = string == filtered // only digits
      
      // maxLimit
      let currentString = (textField.text ?? "") as NSString
      let newString = currentString.replacingCharacters(in: range, with: string)
      
      let maxLimit = newString.count <= 10 // max limit
      
      // to resolve multiple dots
      if currentString.contains(".") && string == "." {
        return false
      }
      
      return validLetter && maxLimit
    }
    return true
  }
}

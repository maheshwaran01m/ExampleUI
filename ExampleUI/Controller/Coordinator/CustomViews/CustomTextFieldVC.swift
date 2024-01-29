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
  
  private lazy var demicalField: UITextField = {
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
    contentView.addSubviews(emailField, passwordField, demicalField)
    contentView.backgroundColor = .systemBackground
    
    let viewHeight: CGFloat = 44
    let padding: CGFloat = 20
    
    autoresizingMask(scrollView, contentView, emailField, passwordField, demicalField)
    scrollView.edges(to: view)
    contentView.edges(to: scrollView)
    
    demicalField.addDoneButton()
    
    NSLayoutConstraint.activate([
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
      
      emailField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
      emailField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      emailField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      emailField.heightAnchor.constraint(equalToConstant: viewHeight),
      
      passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: padding),
      passwordField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      passwordField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      passwordField.heightAnchor.constraint(equalToConstant: viewHeight),
      
      demicalField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: padding),
      demicalField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      demicalField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      demicalField.heightAnchor.constraint(equalToConstant: viewHeight),
    ])
  }
}

extension CustomTextFieldVC: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == emailField {
      passwordField.becomeFirstResponder()
    } else if textField == passwordField {
      demicalField.becomeFirstResponder()
    } else if textField == demicalField {
      demicalField.resignFirstResponder()
    }
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    
    if  textField == demicalField {
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

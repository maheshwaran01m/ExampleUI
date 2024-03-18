//
//  CustomAlertVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit
import LocalAuthentication

class CustomAlertVC: UIViewController {
  
  private let button = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    button.setTitle("Verify user profile", for: .normal)
    button.backgroundColor = .link
    button.border(16)
    
    view.addSubview(button)
    
    button.make {
      $0.centerY(view.centerYAnchor)
      $0.height(44)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
    }
    
    button.addTarget(self, action: #selector(authenticateTapped), for: .touchUpInside)
  }
  
  @objc func authenticateTapped() {
    
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
      let reason = "Identify yourself!"
      
      context.evaluatePolicy(
        .deviceOwnerAuthenticationWithBiometrics,
        localizedReason: reason) { [weak self] success, authenticationError in
          
          DispatchQueue.main.async {
            if success {
              self?.title = "Verified User"
              self?.button.setTitle("Verified User", for: .normal)
              
            } else {
              let ac = UIAlertController(
                title: "Authentication failed",
                message: "You could not be verified, please try again.", preferredStyle: .alert)
              ac.addAction(UIAlertAction(title: "OK", style: .default))
              self?.detail(ac)
            }
          }
        }
      
    } else {
      let ac = UIAlertController(
        title: "Biometry unavailable",
        message: "Your device is not configured for biometric authentication.",
        preferredStyle: .alert)
      
      ac.addAction(UIAlertAction(title: "OK", style: .default))
      detail(ac)
    }
  }
}


//
//  CustomProgressVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomProgressVC: UIViewController {
  
  private let progressView = UIProgressView(progressViewStyle: .default)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    let button = UIButton()
    button.setTitle("Progress", for: .normal)
    button.backgroundColor = .link
    button.border(22)
    button.addTarget(
      self,
      action: #selector(progressButtonClicked),
      for: .touchUpInside)
    
    view.addSubview(button)
    
    button.make {
      $0.bottom(view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
      $0.height(44)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
    }
    
    view.addSubview(progressView)
    progressView.progressTintColor = .blue
    
    progressView.make {
      $0.bottom(button.topAnchor, constant: -10)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
    }
  }
  
  @objc private func progressButtonClicked() {
    if progressView.progress >= 0.95 {
      progressView.progress = 0.0
    } else {
      progressView.progress += 0.10
    }
  }
}


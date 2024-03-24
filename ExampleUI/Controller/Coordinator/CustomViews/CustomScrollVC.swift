//
//  CustomScrollVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomScrollVC: UIViewController {
  
  private let scrollView = UIScrollView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    view.addSubview(scrollView)
    scrollView.backgroundColor = .systemPink.opacity(0.3)
    
    
    let imageView = (0..<50).map { _ in Icon.randomElement }.map {
      let view = UIImageView()
      view.backgroundColor = .systemBackground
      view.border(16)
      
      view.image = $0
      return view
    }
    
    let stackView = UIStackView(arrangedSubviews: imageView)
    stackView.alignment = .center
    stackView.axis = .vertical
    stackView.spacing = 20
    
    for image in imageView {
      image.make {
        $0.width(100)
        $0.height(100)
      }
    }
    
    scrollView.addSubview(stackView)
    
    stackView.make {
      $0.top(scrollView.topAnchor, constant: 10)
      $0.leading(scrollView.leadingAnchor, constant: 10)
      $0.trailing(scrollView.trailingAnchor, constant: -10)
      $0.bottom(scrollView.bottomAnchor, constant: 10)
    }
    
    scrollView.showsVerticalScrollIndicator = true
    scrollView.isScrollEnabled = true
    
    scrollView.edges(to: view)
  }
}


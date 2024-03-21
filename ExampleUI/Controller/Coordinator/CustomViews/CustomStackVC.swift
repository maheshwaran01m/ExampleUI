//
//  CustomStackVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomStackVC: UIViewController {
  
  lazy var verticalStackView: UIStackView = {
    $0.axis = .vertical
    $0.distribution = .fillEqually
    $0.backgroundColor = .gray
    $0.setContentHuggingPriority(.required, for: .vertical)
    $0.spacing = 10
    return $0
  }(UIStackView())
  
  lazy var horizontalStackView: UIStackView = {
    $0.axis = .horizontal
    $0.distribution = .fillEqually
    $0.backgroundColor = .blue
    $0.setContentHuggingPriority(.required, for: .horizontal)
    $0.spacing = 10
    return $0
  }(UIStackView())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    
    let exampleView1 = UIView()
    exampleView1.backgroundColor = .red.withAlphaComponent(0.7)
    
    let exampleView2 = UIView()
    exampleView2.backgroundColor = .yellow
    
    verticalStackView.addArrangedSubview(exampleView1)
    verticalStackView.addArrangedSubview(exampleView2)
    
    // horizontal
    
    let exampleView3 = UIView()
    exampleView3.backgroundColor = .systemGreen
    
    let exampleView4 = UIView()
    exampleView4.backgroundColor = .systemCyan
    
    horizontalStackView.addArrangedSubview(exampleView3)
    horizontalStackView.addArrangedSubview(exampleView4)
    
    
    let parentStackView = UIStackView(arrangedSubviews: [verticalStackView, horizontalStackView])
    parentStackView.axis = .vertical
    parentStackView.distribution = .fillEqually
    
    parentStackView.setCustomSpacing(50, after: verticalStackView)
    
    view.addSubview(parentStackView)
    parentStackView.backgroundColor = .secondarySystemGroupedBackground
    
    parentStackView.edges(to: view)
  }
}

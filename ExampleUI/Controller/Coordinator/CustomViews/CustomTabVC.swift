//
//  CustomTabVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomTabVC: UIViewController {
  
  private let tabController = UITabBarController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    let action = UIAction { [weak self] _ in
      guard let self else { return }
      
      let vc = UIViewController()
      vc.view.backgroundColor = .secondarySystemBackground
      vc.tabBarItem = UITabBarItem(title: "Home", image: .init(systemName: "house"), tag: 0)
      
      let vc2 = UIViewController()
      vc2.view.backgroundColor = .tertiarySystemBackground
      vc2.tabBarItem = UITabBarItem(title: "Settings", image: .init(systemName: "gear"), tag: 1)
      
      let tabController = UITabBarController()
      tabController.viewControllers = [vc, vc2]
      tabController.selectedIndex = 0
      
      detail(tabController)
    }
        
    let button = UIButton(type: .roundedRect, primaryAction: action)
    button.setTitle("Show Tab", for: .normal)
    button.border(22, width: 1, color: .link)
    
    view.addSubview(button)
    
    button.make {
      $0.bottom(view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
      $0.height(44)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
    }
  }
}


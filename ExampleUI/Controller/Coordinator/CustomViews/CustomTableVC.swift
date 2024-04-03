//
//  CustomTableVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomTableVC: UIViewController {
  
  private let tableView = UITableView(frame: .zero, style: .grouped)
 
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    setupTableView()
  }
  
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.edges(to: view)
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
    
    tableView.register(UITableViewCell.self)
  }
}

// MARK: - TableViewStyle

extension CustomTableVC {
  
  enum TableViewStyle: CaseIterable {
    case title, subTitle, image, custom
    
    var style: UIListContentConfiguration {
      var style = UIListContentConfiguration.cell()
      style.text = "Title"
      
      switch self {
      case .title:
        style.text = "Title"
        
      case .subTitle:
        style.secondaryText = "SubTitle"
        
      case .image:
        style.image = Icon.star
        
      case .custom:
        style.secondaryText = "SubTitle"
        style.image = Icon.starFill
      }
      
      return style
    }
  }
  
  private var randomColor: UIColor {
    [.systemBackground, .secondarySystemBackground,
     .systemPink, .tertiarySystemBackground, .systemCyan,
     .systemGreen, .systemYellow, .systemGray
    ].randomElement() ?? .systemBackground
  }
}

// MARK: - UITableViewDataSource

extension CustomTableVC: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return TableViewStyle.allCases.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    
    cell.contentConfiguration = TableViewStyle.allCases[indexPath.row].style
    return cell
  }
}

// MARK: - UITableViewDelegate

extension CustomTableVC: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    let vc = UIViewController()
    vc.title = TableViewStyle.allCases[indexPath.row].style.text
    vc.view.backgroundColor = randomColor
    show(vc)
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView,
                 trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let delete = UIContextualAction(style: .destructive, title: nil) { action, view, completion in
      completion(true)
    }
    delete.image = Icon.trash
    
    return UISwipeActionsConfiguration(actions: [delete])
  }
  
  func tableView(_ tableView: UITableView,
                 leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let edit = UIContextualAction(style: .normal, title: "Edit") { action, view, completion in
      view.backgroundColor = .systemGreen
      
      completion(true)
    }
    edit.backgroundColor = .systemGreen
    
    return UISwipeActionsConfiguration(actions: [edit])
  }
}

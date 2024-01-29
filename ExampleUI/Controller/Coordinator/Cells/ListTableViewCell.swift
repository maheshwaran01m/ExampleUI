//
//  ListTableViewCell.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {
  
  static let reuseIdentifier = "ListTableViewCell"
  
  private let containerView = UIView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  private func setupView() {
    contentView.backgroundColor = .clear
    contentView.addSubview(containerView)
    containerView.layer.cornerRadius = 16
    containerView.backgroundColor = .secondarySystemBackground
    setupConstraints()
    
    separatorInset.right = .greatestFiniteMagnitude
    selectionStyle = .none
  }
  
  private func setupConstraints() {
    containerView.make {
      $0.top(contentView.topAnchor, constant: 2)
      $0.leading(contentView.leadingAnchor, constant: 5)
      $0.trailing(contentView.trailingAnchor, constant: -5)
      $0.bottom(contentView.bottomAnchor, constant: -2)
    }
  }
  
  func configure(_ item: ViewCoordinator) {
    textLabel?.text = item.title
  }
}

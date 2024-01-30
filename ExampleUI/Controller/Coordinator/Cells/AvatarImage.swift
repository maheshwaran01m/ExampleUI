//
//  AvatarImage.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 30/01/24.
//

import UIKit

class AvatarImage: UIImageView {
  
  private var style: Style
    
  override init(frame: CGRect) {
    style = .init()
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    style = .init()
    super.init(coder: coder)
    setupView()
  }
  
  init() {
    style = .init()
    super.init(frame: .zero)
    setupView()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    defaultCornerRadius()
  }
  
  private func setupView() {
    image = UIImage(systemName: "person.circle")
  }
  
  func configure(_ image: UIImage) {
    self.image = image
  }
  
  // MARK: - CornerRadius
  
  private func defaultCornerRadius() {
    setCornerRadius(style.cornerStyle, borderColor: style.borderColor, width: style.borderWidth)
  }
  
  func setCornerRadius(_ type: CornerStyle = .rounded, borderColor: UIColor = .clear, width: CGFloat = 1) {
    style.cornerStyle = type
    style.borderColor = borderColor
    style.borderWidth = width
    
    layer.cornerRadius = style.radius(frame)
    layer.masksToBounds = true
    layer.borderColor = borderColor.cgColor
    layer.borderWidth = width
  }
  
  enum CornerStyle {
    case rounded, custom(CGFloat)
  }
  
  struct Style {
    var cornerStyle: CornerStyle = .rounded
    var borderColor = UIColor.clear
    var borderWidth: CGFloat = 1
    
    
    func radius(_ frame: CGRect) -> CGFloat {
      switch cornerStyle {
      case .rounded: return frame.height/2
      case .custom(let radius): return radius
      }
    }
  }
}

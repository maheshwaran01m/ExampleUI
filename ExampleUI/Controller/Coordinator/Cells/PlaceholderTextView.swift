//
//  PlaceholderTextView.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 31/01/24.
//

import UIKit

class PlaceholderTextView: UITextView {
  
  private var placeholderStyle: PlaceholderStyle
  
  private let placeholderLabel: UILabel = {
    $0.numberOfLines = 0
    $0.backgroundColor = .clear
    return $0
  }(UILabel())
  
  // MARK: - Override
  
  override var text: String! {
    didSet {
      hidePlaceholder()
    }
  }
  
  override var attributedText: NSAttributedString! {
    didSet {
      hidePlaceholder()
    }
  }
  
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    placeholderStyle = .init()
    super.init(frame: frame, textContainer: textContainer)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    placeholderStyle = .init()
    super.init(coder: coder)
    setupView()
  }
  
  override var textContainerInset: UIEdgeInsets {
    didSet {
      setupPlaceholderView()
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupView()
  }
  
  // MARK: - Placeholder
  
  private func setupView() {
    textContainerInset = .init(top: 15, left: 5, bottom: -15, right: -5)
    setupPlaceholderView()
    registerObservers()
  }
  
  private func setupPlaceholderView() {
    guard text.isEmpty else { return }
    placeholderLabel.font = .font(placeholderStyle.font)
    placeholderLabel.textColor = placeholderStyle.textColor
    placeholderLabel.textAlignment = placeholderStyle.alignment
    placeholderLabel.text = placeholderStyle.text
    
    addSubview(placeholderLabel)
    
    placeholderLabel.make {
      $0.top(topAnchor, constant: 8)
      $0.leading(leadingAnchor, constant: 8)
      $0.trailing(trailingAnchor, constant: -8)
      $0.height(30)
    }
  }
  
  func setPlaceholder(_ text: String, textColor: UIColor = .secondaryLabel,
                      font: UIFont.TextStyle = .caption1,
                      alignment: NSTextAlignment = .left) {
    placeholderStyle.font = font
    placeholderStyle.text = text
    placeholderStyle.textColor = textColor
    placeholderStyle.alignment = alignment
  }
  
  // MARK: - Notifications
  
  private func registerObservers() {
    NotificationCenter.default.addObserver(
      self, selector: #selector(hidePlaceholder),
      name: UITextView.textDidEndEditingNotification,
      object: nil)
    
    NotificationCenter.default.addObserver(
      self, selector: #selector(hidePlaceholder),
      name: UITextView.textDidChangeNotification,
      object: nil)
  }
  
  @objc func hidePlaceholder() {
    placeholderLabel.isHidden = text.isNotEmpty
  }
}

// MARK: - PlaceholderStyle

extension PlaceholderTextView {
  
  struct PlaceholderStyle {
    var text: String = ""
    var textColor = UIColor.systemGray6
    var font = UIFont.TextStyle.footnote
    var alignment: NSTextAlignment = .left
  }
}

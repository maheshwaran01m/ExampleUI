//
//  CustomSquareVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 02/03/25.
//

import UIKit

class CustomSquareVC: UIViewController {
  
  private var stackView: UIStackView = {
    $0.spacing = .zero
    $0.axis = .horizontal
    $0.distribution = .fillEqually
    $0.backgroundColor = .systemBackground
    return $0
  }(UIStackView(frame: .zero))
  
  private var selectedSquare: UIColor?
  private var squareColorDict = [UIColor: Int]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    view.addSubview(stackView)
    setupButtons()
    setupLayoutConstraint()
    setupTapGesture()
  }
  
  private func setupButtons() {
    let color = [UIColor.red, .blue, .yellow, .purple]
    
    for i in 0..<4 {
      let button = createButton(for: color[i], action: UIAction(handler: { action in
        guard let button = action.sender as? UIButton else { return }
        self.stackView.subviews.forEach { $0.alpha = 0.3 } // to show selection button
        button.alpha = 0.8
        self.selectedSquare = button.backgroundColor
      }))
      stackView.addArrangedSubview(button)
    }
  }
  
  private func setupLayoutConstraint() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      stackView.heightAnchor.constraint(equalToConstant: 75)
    ])
  }
  
  private func createButton(
    for color: UIColor,
    action: UIAction?) -> UIButton {
      
      let button = UIButton(primaryAction: action)
      button.backgroundColor = color
      return button
    }
  
  private func setupTapGesture() {
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addSquares)))
  }
  
  @objc private func addSquares(_ sender: UITapGestureRecognizer) {
    let location = sender.location(in: view) // tap location
    
    let squareLabel = UILabel(frame: .init(x: location.x, y: location.y, width: 40, height: 40))
    squareLabel.backgroundColor = selectedSquare ?? .green
    squareLabel.textAlignment = .center
    squareLabel.textColor = .label
    
    if let selectedSquare {
      if let exisitingCount = squareColorDict[selectedSquare] {
        squareLabel.text = "\(exisitingCount + 1)"
        
        squareColorDict[selectedSquare]! += 1
      } else {
        squareLabel.text = "1"
        squareColorDict[selectedSquare] = 1
      }
    }
    view.addSubview(squareLabel)
  }
}

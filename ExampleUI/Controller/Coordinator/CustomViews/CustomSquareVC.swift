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
  
  private lazy var undoButton: UIButton = {
    let undoButton = UIButton(primaryAction: UIAction { [weak self] action in
      self?.undoButtonAction(action)
    })
    undoButton.setTitle("Undo", for: .normal)
    return undoButton
  }()
  
  private lazy var redoButton: UIButton = {
    let undoButton = UIButton(primaryAction: UIAction { [weak self] action in
      self?.redoButtonAction(action)
    })
    undoButton.setTitle("Redo", for: .normal)
    return undoButton
  }()
  
  private var selectedSquare: UIColor?
  private var squareColorDict = [UIColor: Int]()
  
  private var undoLabelStack = [UILabel]()
  
  private var redoLabelStack = [UILabel]()
  
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
    setupUndoButton()
    setupRedoButton()
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
    
    undoLabelStack.append(squareLabel)
    // undo button state
    updateUndoButtonState()
    // redo button state
    updateRedoButtonState()
  }
  
  // MARK: - Undo Button
  
  func setupUndoButton() {
    view.addSubview(undoButton)
    undoButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      undoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      undoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      undoButton.heightAnchor.constraint(equalToConstant: 44),
    ])
    updateUndoButtonState()
  }
  
  private func updateUndoButtonState() {
    if undoLabelStack.isEmpty, undoButton.isEnabled {
      undoButton.isEnabled = false
    } else if !undoLabelStack.isEmpty, !undoButton.isEnabled {
      undoButton.isEnabled = true
    }
  }
  
  private func undoButtonAction(_ action: UIAction) {
    guard let lastLabel = undoLabelStack.popLast() else { return }
    
    if let labelColor = lastLabel.backgroundColor,
       let count = squareColorDict[labelColor] {
      squareColorDict[labelColor]! = count - 1
    }
    lastLabel.removeFromSuperview()
    redoLabelStack.append(lastLabel) // for redo
    
    updateUndoButtonState()
    updateRedoButtonState()
  }
  
  // MARK: - Redo Button
  
  func setupRedoButton() {
    view.addSubview(redoButton)
    redoButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      redoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      redoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      redoButton.heightAnchor.constraint(equalToConstant: 44),
    ])
    updateRedoButtonState()
  }
  
  private func updateRedoButtonState() {
    if redoLabelStack.isEmpty, redoButton.isEnabled {
      redoButton.isEnabled = false
    } else if !redoLabelStack.isEmpty, !redoButton.isEnabled {
      redoButton.isEnabled = true
    }
  }
  
  private func redoButtonAction(_ action: UIAction) {
    guard let lastLabel = redoLabelStack.popLast() else { return }
    
    undoLabelStack.append(lastLabel) // undo stack
    
    if let labelColor = lastLabel.backgroundColor,
       let count = squareColorDict[labelColor] {
      squareColorDict[labelColor]! = count + 1
    }
    view.addSubview(lastLabel)
    updateUndoButtonState()
    updateRedoButtonState()
  }
}

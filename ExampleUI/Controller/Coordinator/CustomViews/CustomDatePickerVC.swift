//
//  CustomDatePickerVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomDatePickerVC: UIViewController {
  
  private let pickerTextField: UITextField = {
    $0.backgroundColor = .systemGray6
    $0.layer.cornerRadius = 16
    $0.placeholder = "Choose Date/Time"
    
    return $0
  }(UITextField())
  
  private let pickerTextField1: UITextField = {
    $0.backgroundColor = .systemGray6
    $0.layer.cornerRadius = 16
    $0.placeholder = "Choose Date/Time"
    
    return $0
  }(UITextField())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    
    view.addSubview(pickerTextField)
    
    pickerTextField.datePicker { [weak self] picker in
      self?.doneButtonClicked(picker)
    }
    
    pickerTextField.make {
      $0.top(view.safeAreaLayoutGuide.topAnchor, constant: 30)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
      $0.height(44)
    }
    
    view.addSubview(pickerTextField1)
    
    pickerTextField1.datePicker(picker: .date, style: .inline) { [weak self] picker in
      self?.pickerTextField1.text = picker.date.fullDateString
    }
    
    pickerTextField1.make {
      $0.top(pickerTextField.bottomAnchor, constant: 30)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
      $0.height(44)
    }
  }
  
  func doneButtonClicked(_ value: UIDatePicker) {
    pickerTextField.text = value.date.fullDateString
  }
}


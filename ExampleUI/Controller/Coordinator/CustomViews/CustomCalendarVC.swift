//
//  CustomCalendarVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomCalendarVC: UIViewController {
  
  private var picker: CalendarPicker?
  
  private let pickerTextField: UITextField = {
    $0.backgroundColor = .systemGray6
    $0.border(16)
    $0.placeholder = "Choose Calender"
    
    return $0
  }(UITextField())
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    view.addSubview(pickerTextField)
    
    picker = CalendarPicker(for: pickerTextField) { [weak self] dateComponents in
      self?.pickerTextField.text = dateComponents.date?.fullDateString ?? ""
    }
    
    pickerTextField.make {
      $0.top(view.safeAreaLayoutGuide.topAnchor, constant: 30)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
      $0.height(44)
    }
  }
}

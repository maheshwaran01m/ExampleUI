//
//  UITextFieldExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 28/01/24.
//

import UIKit

extension UITextField {
  
  func addDoneButton() {
    let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: Constants.width, height: 44))
    toolBar.barStyle = .default
    
    let doneButton = UIBarButtonItem(systemItem: .done, primaryAction: .init(handler: { [weak self] _ in
      self?.resignFirstResponder()
    }))
    
    toolBar.items = [.flexibleSpace(), doneButton]
    toolBar.sizeToFit()
    inputAccessoryView = toolBar
  }
  
  func datePicker(
    picker mode: UIDatePicker.Mode = .dateAndTime,
    style: UIDatePickerStyle = .wheels,
    timeZone: TimeZone = .current,
    calendar: Calendar = .current,
    date: Date = .now,
    minimumDate: Date? = nil,
    maximumDate: Date? = nil,
    clearSelectedDate: Bool = false,
    _ completion: @escaping (UIDatePicker) -> Void) {
    
      let datePicker: UIDatePicker = {
        $0.preferredDatePickerStyle = style
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.timeZone = timeZone
        $0.calendar = calendar
        
        $0.datePickerMode = mode
        $0.date = date
        
        $0.minimumDate = minimumDate ?? .distantPast
        $0.maximumDate = maximumDate ?? .distantFuture
        
        return $0
      }(UIDatePicker())
      
      let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: Constants.width, height: 44))
      toolBar.barStyle = .default
      
      let doneButton = UIBarButtonItem(
        systemItem: .done,
        primaryAction: .init(handler: { [weak self] _ in
          
          self?.resignFirstResponder()
          completion(datePicker)
        }))
      
      let cancelButton = UIBarButtonItem(
        systemItem: .cancel,
        primaryAction: .init(handler: { [weak self] _ in
          
          self?.resignFirstResponder()
          if clearSelectedDate { self?.text = nil }
        }))
      
      toolBar.items = [cancelButton, .flexibleSpace(), doneButton]
      toolBar.sizeToFit()
      inputAccessoryView = toolBar
      
      leftView = .init(frame: .init(x: 0, y: 0, width: 10, height: 0))
      leftViewMode = .always
      
      inputView = datePicker
    }
}

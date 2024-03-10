//
//  CalendarPicker.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 10/03/24.
//

import UIKit

class CalendarPicker: NSObject {
  
  private var calenderView: UICalendarView?
  
  private let selectionStyle: SelectionStyle
  
  private var didSelectDate: (DateComponents) -> Void
  
  private var didDeselectDate: (DateComponents) -> Void
  
  private var decoration: UICalendarView.Decoration?
  
  // MARK: - Init
  
  init(for view: UITextField,
       style: Calendar = .current,
       locale: Locale = .current,
       fontDesign: UIFontDescriptor.SystemDesign = .rounded,
       dateRange: DateInterval = .init(start: .distantPast, end: .distantFuture),
       decoration: UICalendarView.Decoration? = nil,
       didSelectDate: @escaping (DateComponents) -> Void) {
    
    self.decoration = decoration
    self.didSelectDate = didSelectDate
    didDeselectDate = { _ in }
    selectionStyle = .single
    
    super.init()
    calenderPicker(for: view, style: style, locale: locale, fontDesign: fontDesign, dateRange: dateRange)
  }
  
  
  init(for view: UITextField,
       style: Calendar = .current,
       locale: Locale = .current,
       fontDesign: UIFontDescriptor.SystemDesign = .rounded,
       dateRange: DateInterval = .init(start: .distantPast, end: .distantFuture),
       decoration: UICalendarView.Decoration? = nil,
       didSelectDate: @escaping (DateComponents) -> Void,
       didDeselectDate: @escaping (DateComponents) -> Void) {
    
    self.decoration = decoration
    self.didSelectDate = didSelectDate
    self.didDeselectDate = didDeselectDate
    selectionStyle = .multiple
    
    super.init()
    calenderPicker(for: view, style: style, locale: locale, fontDesign: fontDesign, dateRange: dateRange)
  }
  
  // MARK: - Picker
  
  func calenderPicker(
    for view: UITextField,
    style: Calendar = .current,
    locale: Locale = .current,
    fontDesign: UIFontDescriptor.SystemDesign = .rounded,
    dateRange: DateInterval = .init(start: .distantPast, end: .distantFuture)) {
      
      calenderView = UICalendarView()
      
      calenderView?.calendar = style
      calenderView?.locale = locale
      calenderView?.fontDesign = fontDesign
      calenderView?.availableDateRange = dateRange
      calenderView?.delegate = self
      
      switch selectionStyle {
      case .single:
        calenderView?.selectionBehavior = UICalendarSelectionSingleDate(delegate: self)
      case .multiple:
        calenderView?.selectionBehavior = UICalendarSelectionMultiDate(delegate: self)
      }
      calenderView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      
      let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: Constants.width, height: 44))
      toolBar.barStyle = .default
      
      let doneButton = UIBarButtonItem(
        systemItem: .done,
        primaryAction: .init(handler: { _ in
          view.resignFirstResponder()
        }))
      
      toolBar.items = [.flexibleSpace(), doneButton]
      toolBar.sizeToFit()
      view.inputAccessoryView = toolBar
      
      view.leftView = .init(frame: .init(x: 0, y: 0, width: 10, height: 0))
      view.leftViewMode = .always
      
      view.inputView = calenderView
    }
  
  // MARK: - SelectionStyle
  
  private enum SelectionStyle {
    case single, multiple
  }
}

// MARK: - UICalendarViewDelegate

extension CalendarPicker: UICalendarViewDelegate {
  
  func calendarView(_ calendarView: UICalendarView,
                    decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
    return decoration
  }
}

// MARK: - UICalendarSelectionSingleDateDelegate

extension CalendarPicker: UICalendarSelectionSingleDateDelegate {
  
  public func dateSelection(_ selection: UICalendarSelectionSingleDate,
                     didSelectDate dateComponents: DateComponents?) {
    guard let dateComponents else { return }
    didSelectDate(dateComponents)
  }
}

// MARK: - UICalendarSelectionMultiDateDelegate

extension CalendarPicker: UICalendarSelectionMultiDateDelegate {
  
  public func multiDateSelection(_ selection: UICalendarSelectionMultiDate,
                          didSelectDate dateComponents: DateComponents) {
    
    didSelectDate(dateComponents)
  }
  
  public func multiDateSelection(_ selection: UICalendarSelectionMultiDate,
                          didDeselectDate dateComponents: DateComponents) {
    
    didDeselectDate(dateComponents)
  }
}

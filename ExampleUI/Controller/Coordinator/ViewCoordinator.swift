//
//  ViewCoordinator.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

enum ViewCoordinator: CaseIterable {
  case text, textField, textView, image, search, button, stack, datePicker, calender, photoPicker, videoPicker,
       moveItem, table, list, scroll, alert, dialogAlert, animation, tab, loader, colorPicker, toolBarButton, toggle,
       segment, swipe, refresh, progress, gesture, sheet, quickLook, menu, notification, navigation, audio
  
  var title: String {
    switch self {
    case .text: return "Text"
    case .textField: return "TextField"
    case .textView: return "TextView"
    case .image: return "Image"
    case .search: return "Search"
    case .button: return "Button"
    case .stack: return "Stack"
    case .datePicker: return "Date Picker"
    case .calender: return "Calender"
    case .photoPicker: return "Photo Picker"
    case .videoPicker: return "Video Picker"
    case .moveItem: return "Move Item"
    case .table: return "Table"
    case .list: return "List"
    case .scroll: return "Scroll"
    case .alert: return "Alert"
    case .dialogAlert: return "Dialog Alert"
    case .animation: return "Animation"
    case .tab: return "Tab"
    case .loader: return "Loader"
    case .colorPicker: return "Color Picker"
    case .toolBarButton: return "ToolBar Button"
    case .toggle: return "Toggle"
    case .segment: return "Segment"
    case .swipe: return "Swipe"
    case .refresh: return "Refresh"
    case .progress: return "Progress"
    case .gesture: return "Gesture"
    case .sheet: return "Sheet"
    case .quickLook: return "Quick Look"
    case .menu: return "Menu"
    case .notification: return "Notification"
    case .navigation: return "Navigation"
    case .audio: return "Audio"
    }
  }
  
  var destinationView: UIViewController {
    switch self {
    case .text: return CustomTextVC()
    case .textField: return CustomTextFieldVC()
    case .textView: return CustomTextViewVC()
    case .image: return CustomImageView()
    case .search: return CustomSearchVC()
    case .button: return CustomButtonVC()
    case .stack: return CustomStackVC()
    case .datePicker: return CustomDatePickerVC()
    case .calender: return CustomCalenderVC()
    case .photoPicker: return CustomPhotoPickerVC()
    case .videoPicker: return CustomVideoPickerVC()
    case .moveItem: return CustomMoveItemVC()
    case .table: return CustomTableVC()
    case .list: return CustomListVC()
    case .scroll: return CustomScrollVC()
    case .alert: return CustomAlertVC()
    case .dialogAlert: return CustomDialogAlertVC()
    case .animation: return CustomAnimationVC()
    case .tab: return CustomTabVC()
    case .loader: return CustomLoaderVC()
    case .colorPicker: return CustomColorPickerVC()
    case .toolBarButton: return CustomToolBarButtonVC()
    case .toggle: return CustomToggleVC()
    case .segment: return CustomSegmentVC()
    case .swipe: return CustomSwipeVC()
    case .refresh: return CustomRefreshVC()
    case .progress: return CustomProgressVC()
    case .gesture: return CustomGestureVC()
    case .sheet: return CustomSheetVC()
    case .quickLook: return CustomQuickLookVC()
    case .menu: return CustomMenuVC()
    case .notification: return CustomNotificationVC()
    case .navigation: return CustomNavigationVC()
    case .audio: return CustomAudioVC()
    }
  }
}

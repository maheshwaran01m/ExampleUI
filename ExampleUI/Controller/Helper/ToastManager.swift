//
//  ToastManager.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

final class ToastManager {
  
  static let shared = ToastManager()
  
  private init() {}
  
  var style = ToastStyle()
  var position = ToastPosition.bottom
  var duration: TimeInterval = 3.0
  var isTapToDismissEnabled = true
  
  var currentToastView: UIView?
}

// MARK: - Toast Position

extension ToastManager {
  
  enum ToastPosition {
    case top, center, bottom
    
    
    func centerPoint(_ toast: UIView, superview: UIView,
                     verticalPadding: CGFloat = 10, horizontalPadding: CGFloat = 10) -> CGPoint {
      
      let topPadding = verticalPadding + superview.safeAreaInsets.top
      let bottomPadding = verticalPadding + verticalPadding + superview.safeAreaInsets.bottom
      
      let size = superview.bounds.size
      
      switch self {
      case .top: return .init(x: size.width/2, y: toast.frame.size.height/2 + topPadding)
      case .center: return .init(x: size.width/2, y: size.height/2)
      case .bottom: return .init(x: size.width/2, y: (size.height - (toast.frame.size.height/2)) - bottomPadding)
      }
    }
  }
}

// MARK: - Toast Style

extension ToastManager {
  
  struct ToastStyle {
    
    init() {}
    
    var toastColor: ToastColor = .primary
    
    var titleColor: UIColor = .white
    
    var maxWidthPercentage: CGFloat = 0.8 {
      didSet {
        maxWidthPercentage = max(min(maxWidthPercentage, 1.0), 0.0)
      }
    }
    
    var maxHeightPercentage: CGFloat = 0.8 {
      didSet {
        maxHeightPercentage = max(min(maxHeightPercentage, 1.0), 0.0)
      }
    }
    
    var cornerRadius: CGFloat = 20.0
    
    var messageFont: UIFont = .systemFont(ofSize: 16.0)
    
    var imageSize = CGSize(width: 20.0, height: 20.0)
    
    var fadeDuration: TimeInterval = 0.2
  }
  
  enum ToastColor {
    case success(UIColor), error(UIColor), info(UIColor), primary(UIColor), custom(UIColor)
    
    static let success = ToastColor.success(.systemGreen.withAlphaComponent(0.8))
    static let error = ToastColor.success(.systemRed.withAlphaComponent(0.8))
    static let info = ToastColor.success(.systemGray.withAlphaComponent(0.8))
    static let primary = ToastColor.success(.systemBlue.withAlphaComponent(0.8))
    
    var color: UIColor {
      switch self {
      case .success(let success): return success
      case .error(let error): return error
      case .info(let info): return info
      case .primary(let primary): return primary
      case .custom(let custom): return custom
      }
    }
  }
}

// MARK: - Default Toast View

extension ToastManager {
  
  func defaultToastView(
    _ message: String, image: UIImage? = nil,
    superview: UIView, style: ToastStyle,
    toastColor: ToastColor? = .primary,
    horizontalPadding: CGFloat = 10, verticalPadding: CGFloat = 10) -> UIView? {
      
      guard message.isNotEmpty || image != nil else { return nil }
      
      var messageLabel: UILabel?
      var imageView: UIImageView?
      
      let toastView = UIView()
      toastView.backgroundColor = toastColor?.color ?? style.toastColor.color
      toastView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
      toastView.layer.cornerRadius = style.cornerRadius
      
      if let image {
        imageView = UIImageView(image: image)
        imageView?.contentMode = .scaleAspectFit
        imageView?.frame = CGRect(x: horizontalPadding, y: verticalPadding,
                                  width: style.imageSize.width, height: style.imageSize.height)
      }
      var imageRect = CGRect.zero
      
      if let imageView {
        imageRect.origin.x = horizontalPadding
        imageRect.origin.y = verticalPadding
        imageRect.size.width = imageView.bounds.size.width
        imageRect.size.height = imageView.bounds.size.height
      }
      
      messageLabel = UILabel()
      messageLabel?.text = message
      messageLabel?.numberOfLines = 0
      messageLabel?.font = style.messageFont
      messageLabel?.textAlignment = .left
      messageLabel?.lineBreakMode = .byTruncatingTail;
      messageLabel?.textColor = style.titleColor
      messageLabel?.backgroundColor = UIColor.clear
      
      let maxMessageSize = CGSize(width: (superview.bounds.size.width * style.maxWidthPercentage) - imageRect.size.width,
                                  height: superview.bounds.size.height * style.maxHeightPercentage)
      
      let messageSize = messageLabel?.sizeThatFits(maxMessageSize)
      
      if let messageSize {
        let actualWidth = min(messageSize.width, maxMessageSize.width)
        let actualHeight = min(messageSize.height, maxMessageSize.height)
        messageLabel?.frame = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
      }
      
      
      var messageRect = CGRect.zero
      
      if let messageLabel = messageLabel {
        messageRect.origin.x = imageRect.origin.x + imageRect.size.width + horizontalPadding
        messageRect.origin.y = verticalPadding
        messageRect.size.width = messageLabel.bounds.size.width
        messageRect.size.height = messageLabel.bounds.size.height
      }
      
      let longerWidth = messageRect.size.width
      let longerX = messageRect.origin.x
      let wrapperWidth = max((imageRect.size.width + (horizontalPadding * 2.0)), (longerX + longerWidth + horizontalPadding))
      
      let wrapperHeight = max((messageRect.origin.y + messageRect.size.height + verticalPadding),
                              (imageRect.size.height + (verticalPadding * 2.0)))
      
      toastView.frame = CGRect(x: 0.0, y: 0.0, width: wrapperWidth, height: wrapperHeight)
      
      if let messageLabel = messageLabel {
        messageRect.size.width = longerWidth
        messageLabel.frame = messageRect
        
        toastView.addSubview(messageLabel)
      }
      
      if let imageView = imageView {
        toastView.addSubview(imageView)
      }
      
      return toastView
    }
  
  @objc func handleToastDismiss(_ recognizer: UITapGestureRecognizer) {
    guard let toast = recognizer.view else { return }
    hideToast(toast)
  }
  
  func hideToast(_ toast: UIView, onDismiss: (() -> Void)? = nil) {
    UIView.animate(
      withDuration: ToastManager.shared.style.fadeDuration,
      delay: 0.0,
      options: [.curveEaseIn, .beginFromCurrentState],
      animations: {
        toast.alpha = 0.0
      }) { _ in
        toast.removeFromSuperview()
        ToastManager.shared.currentToastView = nil
        onDismiss?()
      }
  }
  
  func removeToast() {
    currentToastView?.removeFromSuperview()
    ToastManager.shared.currentToastView = nil
  }
}

// MARK: - Toast Extensions

extension UIView {
  
  func showToast(
    _ toastView: UIView, duration: TimeInterval = ToastManager.shared.duration,
    position: ToastManager.ToastPosition = .bottom,
    style: ToastManager.ToastStyle = .init(),
    animationOptions: UIView.AnimationOptions = [.curveEaseInOut, .allowUserInteraction],
    onDismiss: (() -> Void)? = nil) {
      ToastManager.shared.removeToast()
      
      let point = position.centerPoint(toastView, superview: self)
      
      toastView.center = point
      toastView.alpha = 0.0
      
      if ToastManager.shared.isTapToDismissEnabled {
        let recognizer = UITapGestureRecognizer(
          target: ToastManager.shared.self,
          action: #selector(ToastManager.shared.handleToastDismiss))
        toastView.addGestureRecognizer(recognizer)
        toastView.isUserInteractionEnabled = true
        toastView.isExclusiveTouch = true
      }
      
      addSubview(toastView)
      ToastManager.shared.currentToastView = toastView
      
      UIView.animate(
        withDuration: ToastManager.shared.style.fadeDuration,
        delay: 0.1, options: animationOptions,
        animations: { toastView.alpha = 1.0 }) { _ in
          
          DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            ToastManager.shared.hideToast(toastView, onDismiss: onDismiss)
          }
        }
    }
  
  func showToast(
    _ message: String, duration: TimeInterval = ToastManager.shared.duration,
    position: ToastManager.ToastPosition = .bottom,
    style: ToastManager.ToastStyle = .init(),
    toastColor: ToastManager.ToastColor? = nil,
    animationOptions: UIView.AnimationOptions = [.curveEaseInOut, .allowUserInteraction],
    onDismiss: (() -> Void)? = nil) {
      
      guard let toastView = ToastManager.shared.defaultToastView(
        message, superview: self, style: style, toastColor: toastColor) else {
        return
      }
      showToast(toastView)
    }
}

// MARK: - Toast

extension UIViewController {
  
  func showToast(_ message: String, style: ToastManager.ToastColor = .primary,
                 duration: TimeInterval = 2.0, position: ToastManager.ToastPosition = .bottom) {
    view.showToast(message, duration: duration, position: position, toastColor: style)
  }
}

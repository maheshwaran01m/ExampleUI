//
//  CustomPhotoPickerVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit
import PhotosUI

class CustomPhotoPickerVC: UIViewController {
  
  private var imageView = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    setupImagePickerView()
  }
  
  private func setupImagePickerView() {
    
    let action = UIAction { [weak self] _ in
      var config = PHPickerConfiguration()
      config.filter = .images
      
      let picker = PHPickerViewController(configuration: config)
      picker.delegate = self
      
      self?.detail(picker)
    }
    
    let button = UIButton(type: .custom, primaryAction: action)
    button.setTitle("Select Image", for: .normal)
    button.backgroundColor = .systemBlue
    button.border(16)
    
    view.addSubview(button)
    
    view.addSubview(imageView)
    
    imageView.image = Icon.photo
    imageView.border(16)
    
    imageView.make {
      $0.top(view.safeAreaLayoutGuide.topAnchor, constant: 10)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
      $0.height(200)
    }
    
    button.make {
      $0.top(imageView.bottomAnchor, constant: 30)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
      $0.height(44)
    }
  }
}

// MARK: - PHPickerViewControllerDelegate

extension CustomPhotoPickerVC: PHPickerViewControllerDelegate {
  
  func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    guard let result = results.first else { return }
    picker.dismiss(animated: true)
    
    result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] item, error in
      
      guard let self, error == nil,
            let image = item as? UIImage else {
        return
      }
      DispatchQueue.mainAsyncIfNeeded {
        self.imageView.image = image
      }
    }
  }
}

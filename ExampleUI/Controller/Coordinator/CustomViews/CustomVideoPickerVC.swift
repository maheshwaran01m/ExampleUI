//
//  CustomVideoPickerVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import AVFoundation
import MobileCoreServices
import UIKit
import UniformTypeIdentifiers

class CustomVideoPickerVC: UIViewController {
  
  private var sourceType: SourceType = .library
  private var imageView = UIImageView()
  private var videoUrlLabel = UILabel()
  
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
      let picker = UIImagePickerController()
      picker.allowsEditing = false
      
      self?.sourceType = .library
      self?.checkSourceType(for: picker)
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
    
    // Video
    
    let videoAction = UIAction { [weak self] _ in
      let picker = UIImagePickerController()
      picker.allowsEditing = false
      self?.sourceType = .takePhoto
      self?.checkSourceType(for: picker)
      picker.delegate = self
      
      self?.detail(picker)
    }
    
    let videoButton = UIButton(type: .custom, primaryAction: videoAction)
    videoButton.setTitle("Select Photo", for: .normal)
    videoButton.backgroundColor = .systemBlue
    videoButton.border(16)
    
    view.addSubview(videoUrlLabel)
    view.addSubview(videoButton)
    
    videoUrlLabel.text = "Video URL"
    videoUrlLabel.border(16)
    
    videoUrlLabel.make {
      $0.top(button.bottomAnchor, constant: 30)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
      $0.height(50)
    }
    
    videoButton.make {
      $0.top(videoUrlLabel.bottomAnchor, constant: 10)
      $0.leading(view.leadingAnchor, constant: 10)
      $0.trailing(view.trailingAnchor, constant: -10)
      $0.height(44)
    }
  }
  
  private func checkSourceType(for picker: UIImagePickerController) {
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      if sourceType == .takePhoto {
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
      } else if sourceType == .takeVideo {
        picker.sourceType = .camera
        picker.mediaTypes = [UTType.movie.identifier]
        picker.cameraCaptureMode = .video
        picker.videoQuality = .typeHigh
        /* picker.videoMaximumDuration = 60 */
      }
    } else {
      picker.sourceType = .photoLibrary
    }
  }
  
  public enum SourceType {
    case takePhoto, takeVideo, library
    
    var type: UIImagePickerController.SourceType {
      switch self {
      case .library: return .photoLibrary
      case .takePhoto, .takeVideo: return .camera
      }
    }
  }
}

// MARK: - UIImagePickerControllerDelegate

extension CustomVideoPickerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  public func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let mediaType = info[.mediaType] as? String else { return }
    picker.dismiss(animated: true)
    
    if mediaType == UTType.movie.identifier, let url = info[.mediaURL] as? URL {
      DispatchQueue.mainAsyncIfNeeded {
        self.videoUrlLabel.text = url.description
      }
    } else if mediaType == UTType.image.identifier, let image = info[.originalImage] as? UIImage {
      DispatchQueue.mainAsyncIfNeeded {
        self.imageView.image = image
      }
    }
  }
}

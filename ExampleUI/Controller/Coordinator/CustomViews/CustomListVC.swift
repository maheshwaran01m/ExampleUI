//
//  CustomListVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 09/03/24.
//

import UIKit

class CustomListVC: UIViewController {
  
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = .init(width: 75, height: 75)
    layout.minimumLineSpacing = 4
    layout.minimumInteritemSpacing = 4
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .systemBackground
    collectionView.alwaysBounceVertical = true
    collectionView.showsVerticalScrollIndicator = false
    
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = false
    
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.edges(to: view)
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self)
  }
}

// MARK: - CollectionViewStyle

extension CustomListVC {
  
  enum CollectionViewStyle: CaseIterable {
    case title, subTitle, image, custom
    
    var style: UIListContentConfiguration {
      var style = UIListContentConfiguration.cell()
      style.text = "Title"
      
      switch self {
      case .title:
        style.text = "Title"
        
      case .subTitle:
        style.secondaryText = "SubTitle"
        
      case .image:
        style.image = Icon.randomElement
        
      case .custom:
        style.secondaryText = "SubTitle"
        style.image = Icon.randomElement

      }
      return style
    }
  }
  
  private var randomColor: UIColor {
    [.blue, .orange, .brown, .magenta,
     .systemPink, .black, .systemCyan,
     .systemGreen, .systemYellow, .systemGray
    ].randomElement() ?? .systemBackground
  }
}

// MARK: - UICollectionViewDataSource

extension CustomListVC: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(for: indexPath)
    
    let style = CollectionViewStyle.allCases.randomElement()?.style ?? .cell()
    
    cell.contentConfiguration = style
    cell.backgroundColor = randomColor
    return cell
  }
}

// MARK: - UICollectionViewDelegate

extension CustomListVC: UICollectionViewDelegate {
  
}

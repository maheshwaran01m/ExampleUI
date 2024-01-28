//
//  UICollectionViewFlowLayoutExtensions.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
  
  let cellSpacing: CGFloat = 8.0
  
  override func layoutAttributesForElements(
    in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      
      self.minimumLineSpacing = 8.0
      self.sectionInset = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
      
      let attributes = super.layoutAttributesForElements(in: rect)
      
      var leftMargin = sectionInset.left
      var maxY: CGFloat = -1.0
      attributes?.forEach { layoutAttribute in
        if layoutAttribute.frame.origin.y >= maxY {
          leftMargin = sectionInset.left
        }
        layoutAttribute.frame.origin.x = leftMargin
        leftMargin += layoutAttribute.frame.width + cellSpacing
        maxY = max(layoutAttribute.frame.maxY, maxY)
      }
      return attributes
    }
}

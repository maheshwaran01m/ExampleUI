//
//  CustomSearchVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 11/02/24.
//

import UIKit

class CustomSearchVC: UIViewController {
  
  private var viewModel = CustomSearchViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    title = "Search"
    view.backgroundColor = .systemBackground
    setupSearch()
  }
  
  private func setupSearch() {
    let searchView = SearchBarView(view, canShow: !true, needDelaySearch: false) { [weak self] text in
      self?.viewModel.searchText = text
    }
    view.addSubview(searchView)
    
    searchView.make {
      $0.centerX(view.centerXAnchor)
      $0.centerY(view.centerYAnchor)
      $0.height(24)
    }
  }
}

// MARK: - CustomSearchViewModel

fileprivate class CustomSearchViewModel {
  var isSearchEnabled = true
  var searchText = ""
  
  init() {}
}

 // MARK: - Search

class SearchBarView: UIView {
  
  private let container = UIView()
  private let searchContainer = UIView()
  
  private lazy var search: UIButton = {
    $0.setImage(.init(systemName: "magnifyingglass"), for: .normal)
    $0.tintColor = color
    return $0
  }(UIButton())
  
  private lazy var textField: UITextField = {
    return $0
  }(UITextField())
  
  private lazy var backButton: UIButton = {
    $0.setImage(.init(systemName: "chevron.left"), for: .normal)
    $0.tintColor = color
    return $0
  }(UIButton())
  
  private lazy var cancelButton: UIButton = {
    $0.setImage(.init(systemName: "xmark"), for: .normal)
    $0.tintColor = color
    $0.isHidden = true
    return $0
  }(UIButton())
  
  private let superView: UIView
  
  private var searchItem: SearchItem
  private var isShown: Bool {
    didSet {
      setupView()
    }
  }
  
  private var isEditing: Bool
  private var needDelaySearch: Bool
  
  private var color: UIColor
  
  var onEditing: (String) -> Void
  
  private var text: String = "" {
    didSet {
      if oldValue != text {
        onEditing(text)
      }
    }
  }
  
  init(_ superView: UIView,
       searchItem: SearchItem = .init(),
       canShow: Bool = false,
       needDelaySearch: Bool,
       tintColor: UIColor = .systemGray,
       onEditing: @escaping (String) -> Void) {
    
    isEditing = false
    self.superView = superView
    self.isShown = canShow
    self.needDelaySearch = needDelaySearch
    self.onEditing = onEditing
    self.searchItem = searchItem
    self.color = tintColor
    
    super.init(frame: .zero)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    superView = .init()
    
    isShown = false
    isEditing = false
    needDelaySearch = false
    onEditing = { _ in }
    searchItem = .init()
    color = .systemGray
    
    super.init(coder: coder)
    setupView()
  }
  
  private func setupView() {
    if isShown {
      superView.addSubview(container)
      
      container.layer.zPosition = 1
      
      container.addSubviews(backButton, textField, cancelButton)
      
      textField.placeholder = searchItem.placeholder
      textField.text = searchItem.text
      textField.returnKeyType = needDelaySearch ? .search : .default
      textField.delegate = self
      
      backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
      cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
      
      setupSearchBarConstraints()
      container.border(22, color: .red)
      
      search.removeFromSuperview()
      
    } else {
      superView.addSubview(search)
      
      search.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
      
      search.make {
        $0.centerX(superView.centerXAnchor)
        $0.centerY(superView.centerYAnchor)
        $0.height(28)
        $0.width(28)
      }
      container.removeFromSuperview()
    }
  }
  
  private func setupSearchBarConstraints() {
    container.make {
      $0.leading(superView.leadingAnchor, constant: 5)
      $0.trailing(superView.trailingAnchor, constant: -5)
      $0.centerY(superView.centerYAnchor)
      $0.height(44)
    }
    
    backButton.make {
      $0.leading(container.leadingAnchor, constant: 5)
      $0.centerY(container.centerYAnchor)
    }
    
    textField.make {
      $0.leading(backButton.trailingAnchor, constant: 5)
      $0.centerY(container.centerYAnchor)
    }
    
    cancelButton.make {
      $0.trailing(container.trailingAnchor, constant: -5)
      $0.leading(textField.trailingAnchor, constant: 10)
      $0.centerY(container.centerYAnchor)
    }
  }
  
  @objc private func backButtonClicked() {
    isShown = false
    searchItem.text = ""
  }
  
  @objc private func cancelButtonClicked() {
    guard isShown else { return }
    isShown = false
    searchItem.text = ""
  }
  
  @objc private func searchButtonClicked() {
    isShown.toggle()
  }
}

extension SearchBarView: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    isEditing = false
    let currentText = textField.text ?? ""
    searchItem.text = currentText
    text = currentText
    
    textField.resignFirstResponder()
    updateEditingState(isEditing)
    
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    updateEditingState(false)
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, 
                 replacementString string: String) -> Bool {
    guard !needDelaySearch else { return true }
    let currentText = textField.text ?? ""
    searchItem.text = currentText
    text = currentText
    updateEditingState()
    return true
  }
  
  private func updateEditingState(_ show: Bool = true) {
    isEditing = show
    cancelButton.isHidden = !(isShown && isEditing && searchItem.text.isNotEmpty)
  }
}

extension SearchBarView {
  
  struct SearchItem {
    var text: String
    var placeholder: String
    
    init(_ text: String = "", placeholder: String = "Search") {
      self.text = text
      self.placeholder = placeholder
    }
  }
}

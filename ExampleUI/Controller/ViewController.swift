//
//  ViewController.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 27/01/24.
//

import UIKit

class ViewController: UIViewController {
  
  private let tableView = UITableView()
  
  private var searchText = ""
  
  private var filterVC: [ViewCoordinator] {
    guard searchText.isNotEmpty else { return ViewCoordinator.allCases }
    return ViewCoordinator.allCases
      .filter { $0.title.lowercased().localizedStandardContains(searchText ) }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupView() {
    title = "Example"
    view.backgroundColor = .systemBackground
    setupTableView()
    setupSearhBar()
  }
}

// MARK: - TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.edges(to: view)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 50
    tableView.tableFooterView = UIView()
    tableView.register(ListTableViewCell.self)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    filterVC.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
    cell.configure(filterVC[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    navigationController?.pushViewController(filterVC[indexPath.row].destinationView, animated: true)
  }
}

// MARK: - SearchBar

extension ViewController: UISearchBarDelegate, UISearchResultsUpdating {
  
  private func setupSearhBar() {
    let searchVC = UISearchController()
    searchVC.searchResultsUpdater = self
    searchVC.searchBar.delegate = self
    searchVC.searchBar.placeholder = "Search"
    searchVC.obscuresBackgroundDuringPresentation = false
    
    navigationItem.searchController = searchVC
    navigationItem.preferredSearchBarPlacement = .stacked
    navigationItem.hidesSearchBarWhenScrolling = false
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    handleSearch()
  }
  
  func updateSearchResults(for searchController: UISearchController) {
    handleSearch(searchController.searchBar.text)
  }
  
  private func handleSearch(_ searchText: String? = nil) {
    guard let searchText, searchText.isNotEmpty else {
      updateSearchResult()
      return
    }
    updateSearchResult(searchText)
  }
  
  private func updateSearchResult(_ text: String = "") {
    self.searchText = text
    tableView.reloadData()
  }
}

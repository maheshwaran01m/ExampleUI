//
//  CustomCombineTableVC.swift
//  ExampleUI
//
//  Created by MAHESHWARAN on 28/01/25.
//

import Combine
import UIKit

class CustomCombineTableVC: UIViewController {
  
  // MARK: - Property
  
  private var tableView: UITableView = {
    $0.backgroundColor = .secondarySystemBackground
    $0.tableFooterView = UIView()
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UITableView(frame: .zero, style: .plain))
  
  
  private var viewModel = CustomCombineTableViewModel()
  
  // MARK: - Override Methods
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - Custom Methods

extension CustomCombineTableVC {
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    title = "Home"
    setupTableView()
    setupPublisher()
  }
  
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor)
    ])
  }
}

extension CustomCombineTableVC {
  
  func setupPublisher() {
    viewModel.$reloadPublisher.sink { [weak self] hasUpdate in
      guard hasUpdate else { return }
      self?.tableView.reloadData()
    }
    .store(in: &viewModel.cancelBag)
  }
}

// MARK: - TableView DataSource

extension CustomCombineTableVC: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.records.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    var config = UIListContentConfiguration.cell()
    config.text = viewModel.records[indexPath.row].id.description
    config.secondaryText = viewModel.records[indexPath.row].name
    cell.contentConfiguration = config
    
    return cell
  }
  
  // MARK: - TableView Delegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

// MARK: - CustomCombineTableVC

extension CustomCombineTableVC {
  
  class CustomCombineTableViewModel {
    
    @Published var reloadPublisher = false
    
    private(set) var records = [ResponseItem]()
    
    private(set) var baseRecords: [ResponseItem] = [] {
      didSet {
        records = baseRecords
        reloadPublisher = true
      }
    }
    
    private let manager: APIManager
    
    var cancelBag = Set<AnyCancellable>()
    
    init(service: APIManager = APIManager()) {
      manager = service
      fetchRecords()
    }
    
    private func fetchRecords() {
      guard let url = URL(string: "https://api.disneyapi.dev/character") else { return }
      manager
        .get(url)
        .receive(on: DispatchQueue.main)
        .catch(Fail.init)
      
        .sink { result in
          switch result {
          case .finished: break
            
          case .failure(let error):
            print("Error \(error.localizedDescription)")
          }
        } receiveValue: { [weak self] (records: APIResponse) in
          guard let self else { return }
          self.baseRecords = records.data
        }
        .store(in: &cancelBag)
    }
    
    // MARK: - Combine
    
    // var reloadPublisher = CurrentValueSubject<Bool, Never>(false)
    
    var passThroughActionItem = PassthroughSubject<ResponseItemAction, Never>()
    
    /// In cell action to while user interaction
    func updateResponseItem() {
      passThroughActionItem.send(.tapAction(.init(id: 1, name: "Name")))
    }
    
    /// In tableView cell
    func performResponseItem() {
      passThroughActionItem.sink { type in
        switch type {
        case .tapAction(let item):
          print(item)
        case .clearAction(let item):
          print(item)
        }
      }.store(in: &cancelBag)
    }
    
    enum ResponseItemAction {
      case tapAction(ResponseItem), clearAction(ResponseItem)
    }
  }
  // MARK: - APIManager
  
  class APIManager {
    
    func get<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
      URLSession
        .shared
        .dataTaskPublisher(for: url)
        .catch(Fail.init)
        .map {
          /*
          if let json = try? JSONSerialization.jsonObject(with: $0.data) {
            print(json)
          }
          */
          return $0.data
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
  }
  
  // MARK: - APIResponse

  struct APIResponse: Codable {
    let data: [ResponseItem]
  }

  struct ResponseItem: Codable {
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
      self.id = id
      self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
      case id = "_id", name
    }
    
    init(from decoder: any Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try container.decode(Int.self, forKey: .id)
      self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: any Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(self.id, forKey: .id)
      try container.encode(self.name, forKey: .name)
    }
  }
}

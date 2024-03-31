import ComposableArchitecture

@Reducer
public struct CatFactsListViewModelReducer {
  @ObservableState
  public struct State: Equatable, Codable {
    public var facts: IdentifiedArrayOf<CatFactViewModel> = []
    public var loading = false
    public var scrollPosition: Float = 0.0

    public init(
      facts: IdentifiedArrayOf<CatFactViewModel> = [],
      loading: Bool = false,
      scrollPosition: Float = 0.0
    ) {
      self.facts = facts
      self.loading = loading
      self.scrollPosition = scrollPosition
    }
  }

  public enum Action: Equatable {
    case task
    case newFacts([CatFactModel])
    case scroll(position: Float)
  }

  public init() {}

  public var body: some Reducer<State, Action> {
    Reduce { state, action in
      switch action {
      case .task:
        return .none
      case let .newFacts(factModels):
        state.facts.removeAll()
        state.facts.append(contentsOf: factModels.map(CatFactViewModel.init(model:)))
        return .none
      case let .scroll(position):
        state.scrollPosition = position
        return .none
      }
    }
  }
}

public struct CatFactViewModel: Codable, Equatable, Identifiable {
  public var id: String { fact }
  public let fact: String

  public init(model: CatFactModel) {
    self.fact = model.fact
  }
}

public struct CatFactModel: Codable, Equatable {
  let fact: String
}

//struct FetchCatFactsKey: DependencyKey {
//  static let liveValue: (_ count: Int) async throws -> CatFactsResponseModel = { _ in
//    let urlString = "https://catfact.ninja/facts?limit=5"
//    guard let url = URL(string: urlString) else {
//      throw NetworkRequestError.malformedRequest(message: "Attempted to connect to a malformed URL: \(urlString)")
//    }
//    
//    @Dependency(\.repositoryGenerator) var repositoryGenerator
//    let repository = repositoryGenerator()
//    var urlRequest = URLRequest(url: url)
//    urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
//    
//    return try await repository.makeRequest(urlRequest, modelType: CatFactsResponseModel.self)
//  }
//}
//
//extension DependencyValues {
//  var fetchCatFacts: (_ count: Int) async throws -> CatFactsResponseModel {
//    get { self[FetchCatFactsKey.self] }
//    set { self[FetchCatFactsKey.self] = newValue }
//  }
//}


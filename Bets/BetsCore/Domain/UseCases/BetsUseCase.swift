protocol BetsUseCaseContract {
    func run() async throws -> [BetModel]
}

class BetUseCase: BetsUseCaseContract {
    private let repository: BetsRepositoryContract

    init(repository: BetsRepositoryContract = BetsRepository()) {
        self.repository = repository
    }

    func run() async throws -> [BetModel] {
        try await repository.updateOdds()
    }
}

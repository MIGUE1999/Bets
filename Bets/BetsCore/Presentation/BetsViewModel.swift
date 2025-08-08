//
protocol BetsViewModelContract {
    func updateOdds() async throws -> [BetModel]
}

final class BetsViewModel: BetsViewModelContract {
    private let betsUseCase: BetsUseCaseContract

    init(betsUseCase: BetsUseCaseContract = BetUseCase()) {
        self.betsUseCase = betsUseCase
    }

    func updateOdds() async throws -> [BetModel] {
        try await betsUseCase.run()
    }
}

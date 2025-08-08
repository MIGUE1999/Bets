protocol BetsRepositoryContract {
    func updateOdds() async throws -> [BetModel]
}

final class BetsRepository: BetsRepositoryContract {
    private let remoteDataSource: RemoteBetDataSourceContract
    private let betsFactory: BetsFactoryContract

    init(remoteDataSource: RemoteBetDataSourceContract = RemoteBetDataSource(),
                betsFactory: BetsFactoryContract = BetsFactory()) {
        self.remoteDataSource = remoteDataSource
        self.betsFactory = betsFactory
    }

    func updateOdds() async throws -> [BetModel] {
        var bets = try await remoteDataSource.loadBets()
         bets = bets.map { bet in
             let updater = betsFactory.updater(for: bet)
             return updater.update(bet: bet)
         }
         return bets
    }
}

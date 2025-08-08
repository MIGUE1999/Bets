protocol RemoteBetDataSourceContract {
    func loadBets() async throws -> [BetModel]
    func saveBets(_ bets: [BetModel]) async throws
}

final class RemoteBetDataSource: RemoteBetDataSourceContract {
    private var service: BetServiceContract

    init(service: BetServiceContract = RemoteBetService()) {
        self.service = service
    }

    func loadBets() async throws -> [BetModel] {
        try await service.loadBets().map { BetMapper.entityToModel($0) }
    }

    func saveBets(_ bets: [BetModel]) async throws {
        try await service.saveBets(bets.map{BetMapper.modelToEntity($0)})
    }
}

@testable import BetsCore

final class RemoteDataSourceMock: RemoteBetDataSourceContract {
    var loadBetsResult: [BetModel]?
    var saveBetsCalled = false

    func loadBets() async throws -> [BetModel] {
        guard let loadBetsResult else {
            fatalError("loadBetsResult not set")
        }
        return loadBetsResult
    }
    
    func saveBets(_ bets: [BetModel]) async throws {
        saveBetsCalled = true
    }
}

extension BetModel {
    static func dummyInsance() -> Self {
        BetModel(name: "mock", sellIn: 0, quality: 0)
    }
}

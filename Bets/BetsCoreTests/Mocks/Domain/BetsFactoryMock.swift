@testable import BetsCore

final class BetsFactoryMock: BetsFactoryContract {
    var betsUpdaterMock: BetsUpdaterContract?

    func updater(for bet: BetModel) -> any BetsUpdaterContract {
        guard let betsUpdaterMock else {
            fatalError("BetsUpdaterMock not set")
        }
        return betsUpdaterMock
    }
}

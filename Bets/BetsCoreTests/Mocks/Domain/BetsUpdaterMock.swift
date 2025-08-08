@testable import BetsCore

final class BetsUpdaterMock: BetsUpdaterContract {
    var result: BetModel?

    func update(bet: BetsCore.BetModel) -> BetsCore.BetModel {
        guard let result = result else {
            fatalError("result not set")
        }
        return result
    }
}

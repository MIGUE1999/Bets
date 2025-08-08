protocol BetsUpdaterContract {
    func update(bet: BetModel) -> BetModel
}

final class DefaultBetUpdater: BetsUpdaterContract {
    func update(bet: BetModel) -> BetModel {
        var updatedBet = bet
        if updatedBet.quality > 0 {
            updatedBet.quality -= 1
        }
        updatedBet.sellIn -= 1
        if updatedBet.sellIn < 0 && updatedBet.quality > 0 {
            updatedBet.quality -= 1
        }
        return updatedBet
    }
}

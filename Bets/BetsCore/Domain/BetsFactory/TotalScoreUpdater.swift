final class TotalScoreUpdater: BetsUpdaterContract {
    func update(bet: BetModel) -> BetModel {
        var updatedBet = bet
        if updatedBet.quality < 50 {
            updatedBet.quality += 1
            if updatedBet.sellIn < 11 && updatedBet.quality < 50 {
                updatedBet.quality += 1
            }
            if updatedBet.sellIn < 6 && updatedBet.quality < 50 {
                updatedBet.quality += 1
            }
        }
        updatedBet.sellIn -= 1
        if updatedBet.sellIn < 0 {
            updatedBet.quality = 0
        }
        return updatedBet
    }
}

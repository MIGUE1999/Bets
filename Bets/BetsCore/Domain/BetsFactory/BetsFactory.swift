protocol BetsFactoryContract {
    func updater(for bet: BetModel) -> BetsUpdaterContract
}

final class BetsFactory: BetsFactoryContract {
    required init() {}
    
    func updater(for bet: BetModel) -> BetsUpdaterContract {
        switch bet.name {
        case "Player performance": return PlayerPerformanceUpdater()
        case "Total score": return TotalScoreUpdater()
        default: return DefaultBetUpdater()
        }
    }
}

protocol BetServiceContract {
    func loadBets() async throws -> [BetEntity]
    func saveBets(_ bets: [BetEntity]) async throws
}

actor RemoteBetService: BetServiceContract {
    private static let delay: UInt64 = 1_000_000_000
    
    public static let instance = RemoteBetService()
    
    init() { }
    
    private var bets: [BetEntity] = [
        BetEntity(name: "Winning team", sellIn: 8, quality: 15),
        BetEntity(name: "Total score", sellIn: 5, quality: 26),
        BetEntity(name: "Player performance", sellIn: 9, quality: 4),
        BetEntity(name: "First goal scorer", sellIn: 10, quality: 49),
        BetEntity(name: "Number of fouls", sellIn: 4, quality: 21),
        BetEntity(name: "Corner kicks", sellIn: 9, quality: 32),
        BetEntity(name: "Yellow cards", sellIn: 0, quality: 45),
        BetEntity(name: "Red cards", sellIn: 2, quality: 11),
        BetEntity(name: "Offsides", sellIn: 2, quality: 14),
        BetEntity(name: "Penalties", sellIn: 4, quality: 10),
        BetEntity(name: "Half-time score", sellIn: 1, quality: 42),
        BetEntity(name: "Clean sheet", sellIn: 10, quality: 34),
        BetEntity(name: "Hat trick", sellIn: 9, quality: 32),
        BetEntity(name: "Number of sets won", sellIn: 8, quality: 17),
        BetEntity(name: "Number of aces", sellIn: 6, quality: 46),
        BetEntity(name: "Set score", sellIn: 9, quality: 12),
    ]
    
    func loadBets() async throws -> [BetEntity] {
        try await Task.sleep(nanoseconds: RemoteBetService.delay)
        return bets
    }
    
    func saveBets(_ bets: [BetEntity]) async throws {
        try await Task.sleep(nanoseconds: RemoteBetService.delay)
        self.bets = bets
    }
}

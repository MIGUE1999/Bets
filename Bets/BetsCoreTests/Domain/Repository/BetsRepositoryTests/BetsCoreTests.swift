import XCTest
@testable import BetsCore

final class BetsRepositoryTests: XCTestCase {
    var sut: BetsRepository!

    var remoteDataSourceMock: RemoteDataSourceMock!
    var betsFactoryMock: BetsFactoryMock!
    var betsUpdaterMock: BetsUpdaterMock!

    override func setUp() {
        super.setUp()
        remoteDataSourceMock = RemoteDataSourceMock()
        betsFactoryMock = BetsFactoryMock()
        betsUpdaterMock = BetsUpdaterMock()
        sut = BetsRepository(remoteDataSource: remoteDataSourceMock,
                             betsFactory: betsFactoryMock)
    }

    func testUpdateOddsWhenSuccess() async throws {
        // Given
        remoteDataSourceMock.loadBetsResult = [.dummyInsance()]
        let betsUpdaterMock = BetsUpdaterMock()
        betsUpdaterMock.result = .dummyInsance()
        betsFactoryMock.betsUpdaterMock = betsUpdaterMock
        betsUpdaterMock.result = .dummyInsance()

        // When
        let result = try await sut.updateOdds()

        // Then
        XCTAssertEqual(result, [.dummyInsance()])
    }

}

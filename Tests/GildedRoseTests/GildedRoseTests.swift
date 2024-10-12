import ApprovalTests_Swift
@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func testFoo() throws {
        let names = ["Foo", "Aged Brie",
                     "Backstage passes to a TAFKAL80ETC concert",
                     "Sulfuras, Hand of Ragnaros"]
        let sellIns = [-1, 0, 2, 6, 11]
        let qualities = [0, 1, 49, 50]

        try CombinationApprovals.verifyAllCombinations(makeGildedRose, names, sellIns, qualities)
    }
}

// MARK: Helpers

extension GildedRoseTests {
    func makeGildedRose(name: String, sellIn: Int, quality: Int) -> GildedRose {
        let items = [Item.makeItem(name, sellIn, quality)]
        let app = GildedRose(items: items)
        app.updateQuality()
        return app
    }
}

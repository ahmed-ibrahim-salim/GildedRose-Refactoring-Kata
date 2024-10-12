public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        for i in 0 ..< items.count {
            items[i].updateQuality()
        }
    }
}

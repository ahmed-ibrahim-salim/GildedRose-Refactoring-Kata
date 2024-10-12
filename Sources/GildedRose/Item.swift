public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }

    static func makeItem(_ name: String, _ sellIn: Int, _ quality: Int) -> Item {
        switch name {
        case "Sulfuras, Hand of Ragnaros":
            return Sulfuras(sellIn: sellIn, quality: quality)
        case "Aged Brie":
            return AgedBrie(sellIn: sellIn, quality: quality)
        case "Backstage passes to a TAFKAL80ETC concert":
            return BackstagePass(sellIn: sellIn, quality: quality)
        default:
            return Item(name: name, sellIn: sellIn, quality: quality)
        }
    }

    func updateQuality() {
        if quality > 0 {
            quality = quality - 1
        }

        sellIn = sellIn - 1

        if sellIn < 0 {
            if quality > 0 {
                quality = quality - 1
            }
        }
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        name + ", " + String(sellIn) + ", " + String(quality)
    }
}

class Sulfuras: Item {
    init(sellIn: Int, quality: Int) {
        super.init(name: "Sulfuras, Hand of Ragnaros", sellIn: sellIn, quality: quality)
    }

    override func updateQuality() {}
}

class BackstagePass: Item {
    init(sellIn: Int, quality: Int) {
        super.init(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: sellIn, quality: quality)
    }

    override func updateQuality() {
        if quality < 50 {
            quality = quality + 1

            if sellIn < 11 {
                if quality < 50 {
                    quality = quality + 1
                }
            }

            if sellIn < 6 {
                if quality < 50 {
                    quality = quality + 1
                }
            }
        }

        sellIn = sellIn - 1

        if sellIn < 0 {
            quality = 0
        }
    }
}

class AgedBrie: Item {
    init(sellIn: Int, quality: Int) {
        super.init(name: "Aged Brie", sellIn: sellIn, quality: quality)
    }

    override func updateQuality() {
        if quality < 50 {
            quality = quality + 1
        }

        sellIn = sellIn - 1

        if sellIn < 0 {
            if quality < 50 {
                quality = quality + 1
            }
        }
    }
}

import UIKit

var width: Float = 3.4
var height: Float = 2.1

var bucketsOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        return Int(ceilf(numberOfBuckets))
    }
    set {
        let areaCanCover = Double(newValue) * 1.5
        print("It can cover an area of \(areaCanCover) square meter")
    }
}

print(bucketsOfPaint)


bucketsOfPaint = 4

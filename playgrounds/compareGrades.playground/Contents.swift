import UIKit

func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    if (a.count == 0) {
        return [0,0]
    }
    var result: [Int] = [0,0]

    for i in 0..<a.count {
        if (a[i] == b[i]) {
            result[0] += 0
            result[1] += 0
        } else if (a[i] > b[i]) {
            result[0] += 1
            result[1] += 0
        } else {
            result[0] += 0
            result[1] += 1
        }
    }
    return result
}

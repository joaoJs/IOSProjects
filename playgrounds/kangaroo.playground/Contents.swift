import UIKit

// given two kangaroos with starting points x1 and x2
// with two speeds v1 and v2 (respectively)
// check if kangaroos will lend the same spot at some point

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    // if y1 > x1 && (y2 - y1) > (x2 - x1) --> NO
    if (v2 > v1 && x2 > x1) {
        return "NO"
    } else if (x1 < x2 && v1 > v2) {
        var k1 = x1
        var k2 = x2
        while (k1 < k2) {
            k1 += v1
            k2 += v2
            if (k1 == k2) {
                return "YES"
            }
        }
    }
    return "NO"
}


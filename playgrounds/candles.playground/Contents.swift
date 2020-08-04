import UIKit

func birthdayCakeCandles(arr: [Int]) -> Int {
    if (arr.count == 0) {
        return 0
    }
    var count: Int = 0
    var tallest: Int = arr[0]
    
    arr.forEach{ candle in
        if (candle > tallest) {
            tallest = candle
            count = 1
        } else if (candle == tallest) {
            count += 1
        }
    }
    return count
}

print(birthdayCakeCandles(arr: [3,2,1,3]))

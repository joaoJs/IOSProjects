import UIKit

func countingValleys(n: Int, s: String) -> Int {
    var current: Int = 0
    var valleysCount: Int = 0
    var local = "start"
    
    for c in s {
        if (local == "start") {
            if (c == "U") {
                current += 1
                local = "mountain"
            } else {
                current -= 1
                local = "valley"
            }
        } else {
            if (c == "U") {
                current += 1
            } else {
                current -= 1
            }
            if (current == 0) {
                if (local == "valley") {
                    valleysCount += 1
                }
                local = "start"
            }
        }
        
    }
    
    return valleysCount
}

print(countingValleys(n: 8, s: "UDDDUDUU"))
print(countingValleys(n: 8, s: "DDUUDDUU"))

//

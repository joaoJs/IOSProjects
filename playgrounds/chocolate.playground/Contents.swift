import UIKit

func birthday(s: [Int], d: Int, m: Int) -> Int {
    if (s.count == 0) {
        return 0
    }
    if (s.count == 1 && s[0] == d) {
        return 1
    }
    if (s.count == 1 && s[0] != d) {
        return 0
    }
    var queue: [Int] = [] // array of size m
    var count: Int = 0
    var result: Int = 0
    
    for i in 0..<s.count{
        // check where in month count
        if (queue.count < m) {
            queue.append(s[i])
            count += s[i]
        } else {
            if (queue.count == m && count == d) {
                result += 1
            }
            let first = queue.removeFirst()
            count -= first
            queue.append(s[i])
            count += s[i]
        }
    }
    if (queue.count == m && count == d) {
        result += 1
    }
    return result
}

print(birthday(s: [1,2,2,2,1,1,3,1,1,1,3], d: 8, m: 5))


import UIKit

func diffPairs(arr: [Int], n: Int) {
    var dict: [Int: Int] = [:]
    var count: Int = 0

    for i in 0..<arr.count {
        if (dict[arr[i] - n] != nil) {
            count += 1
        }

        if (dict[arr[i] + n] != nil) {
            count += 1
        }

        dict[arr[i]] = 1
        print(dict)
    }
    print(count)
}

diffPairs(arr: [3,6,10,13],n: 3) // 2
diffPairs(arr: [1,3,2,4],n: 1) // 3

func sumPairs(arr: [Int], sum: Int) {
    var dict: [Int: Int] = [:]
    var count: Int = 0
    
    for i in 0..<arr.count {
        // dict needs to have sum - current // current = arr[i]
        if (dict[sum - arr[i]] != nil) {
            count += 1
        }
        
        dict[arr[i]] = 1
        print(dict)
    }
    print(count)
}

sumPairs(arr: [1,2,3,4],sum: 5) // 2
sumPairs(arr: [1,3,2,4],sum: 5) // 2


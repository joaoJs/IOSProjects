import UIKit

func climbingLeaderboard(scores: [Int], alice: [Int]) -> [Int] {
    var result: [Int] = []
    var uniques: [Int: Int] = [:]
    var uniquesArr: [Int] = []
    var place: Int = 1
    scores.forEach{score in
        if (uniques[score] == nil) {
            uniquesArr.append(score)
            uniques[score] = place
            place += 1
        }
    }
    
    var scorePointer = 0
    var i = alice.count - 1
    while i >= 0 {
        let currAlice = alice[i]
        let currScore = uniquesArr[scorePointer]
        if (currAlice >= currScore) {
            guard let currPlace = uniques[currScore] else { return result }
            if (currPlace - 1 == 0) {
                result.append(1)
            } else {
                result.append(currPlace)
            }
        } else {
            var thisScore = uniquesArr[scorePointer]
            while(scorePointer < uniquesArr.count - 1 && currAlice < thisScore) {
                scorePointer += 1
                thisScore = uniquesArr[scorePointer]
            }
            guard let currPlace = uniques[thisScore] else { return result }
            if (scorePointer == uniquesArr.count - 1 && currAlice < thisScore) {
                result.append(currPlace + 1)
            } else {
                result.append(currPlace)
            }
        }
        i -= 1
    }
    
    return result.reversed()
}

print(climbingLeaderboard(scores: [100, 90, 90, 80, 75, 60], alice: [50, 65, 77, 90, 102]))
print(climbingLeaderboard(scores: [100,100,50,40,40,20,10], alice: [5,25,50,120]))


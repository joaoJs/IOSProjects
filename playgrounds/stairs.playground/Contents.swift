import UIKit

func staircase(n: Int) -> Void {
    var spaces: Int = n - 1
    var dashes: Int = n - spaces
    var result: String = ""
    for _ in 0..<n{
        
        for _ in 0..<spaces{
            result.append(" ")
        }
        
        
        for _ in 0..<dashes{
            result.append("#")
        }
        
        result.append("\n")
        spaces -= 1
        dashes += 1
    }
    print(result)
}

staircase(n: 6)


//     #
//    ##
//   ###
//  ####
// #####
//######

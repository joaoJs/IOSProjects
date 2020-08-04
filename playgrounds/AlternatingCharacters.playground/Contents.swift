import UIKit


func alternatingCharacters(s: String) -> Int {
    var res: Int = 0
    var rootA: Character?
    var rootB: Character?
    
    for (index, char) in s.enumerated() {
        if (index == 0) {
            rootA = char
            rootB = char
        } else {
            rootB = char
            if (rootB != rootA) {
                rootA = rootB
            } else {
                res += 1
            }
        }
    }
    return res
}

print(alternatingCharacters(s: "AAABBB"))
print(alternatingCharacters(s: "AAAA"))
print(alternatingCharacters(s: "BBBB"))
print(alternatingCharacters(s: "ABABABAB"))
print(alternatingCharacters(s: "BABABA"))

import Foundation

var array = [Int]()
array.reserveCapacity(10)
array.removeAll(keepingCapacity: true)

// Failable init can return nil
struct FailabelStruct {
    let num: Int
    
    init?(num: Int) {
        guard num % 2 == 0 else {
            return nil
        }
        
        self.num = num
    }
}

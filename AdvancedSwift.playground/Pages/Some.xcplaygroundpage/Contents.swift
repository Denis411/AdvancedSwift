import Foundation

// 1
var array = [Int]()
array.reserveCapacity(10)
array.removeAll(keepingCapacity: true)

// 2
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

// Dependent type cuz has another type inside
struct DependentStruct {
    let dependency: FailabelStruct
}

// 3
let someOptional: Int? = 42
// Match using an enumeration case pattern.
if case .some(let x) = someOptional {
    print(x)
}

// Match using an optional pattern.
if case let x? = someOptional {
    print(x)
}

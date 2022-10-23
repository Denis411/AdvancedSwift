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

let emoji: StaticString = "\u{1F600}"
emoji.hasPointerRepresentation  //-> true
emoji.isASCII                   //-> false
emoji.unicodeScalar             //-> Fatal error!
emoji.utf8CodeUnitCount         //-> 4
emoji.utf8Start[0]              //-> 0xF0
emoji.utf8Start[1]              //-> 0x9F
emoji.utf8Start[2]              //-> 0x98
emoji.utf8Start[3]              //-> 0x80
emoji.utf8Start[4]              //-> 0x00

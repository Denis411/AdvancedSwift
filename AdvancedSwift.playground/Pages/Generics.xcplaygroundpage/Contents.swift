import Foundation

// Generic aka Parametric polymorphisme
let anyArray: [Any] = [1,2,3]
let newAnyArray = anyArray as! [Int]
// - casting
// - time on a type lookup
// - might have another type in

let genericArray: Array<Int> = [1,2,3]

func addNums<Num: Numeric>(_ a: Num, _ b: Num) -> Num {
    a + b
}

func addNumsTwo<Num>(_ a: Num, _ b: Num) -> Num where Num: Numeric {
    a + b
}

protocol SomeElement {
    var id: String { get set }
}

class GenericClass<T: SomeElement> { }
struct GenericStruct<T: SomeElement> { }
enum GenericEnum<T: SomeElement> { }

// MARK: -- Associated type

protocol AssociatedProtocol {
    associatedtype NumericType: Numeric
}

class TypealiasClass: AssociatedProtocol {
    typealias NumericType = Int
}

struct TypealiasStruct: AssociatedProtocol {
    typealias NumericType = Int
}

enum TypealiasEnum: AssociatedProtocol {
    typealias NumericType = Int
}

extension Sequence where Element: Numeric {
    func someFunc() { }
}

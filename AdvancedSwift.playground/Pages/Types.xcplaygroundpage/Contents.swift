import Foundation

struct EquatableStruct: Equatable {
    let id: Int
    let name: String
    
//  the struct is automatically conformed to Equatable
}

class EquatableClass: Equatable {
    let id: Int
    let name: String
    
    init(id: Int, name: String) { self.id = id; self.name = name }
    
// reference types do not automatically conform to Equatable to avoid reference cycles
// and circular graph of objects and create an infitit loop of checking equality
    static func == (lhs: EquatableClass, rhs: EquatableClass) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
}

class CodableClass: Codable {
    let id: Int
    let name: String
    
// unlike Equatable reference types can conform to Codable and create a graph of referenc cycles
}

// For an enum, all its associated values must conform to Equatable. (An enum without associated values has Equatable conformance even without the declaration.)

typealias Country = String
typealias Capital = String

let country = Country("the USA")
let capital = Capital("Washinkton")

let list: [Country: Capital] = [country: capital]

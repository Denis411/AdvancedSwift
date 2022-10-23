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
// and circular graph of objects and create an infinit loop of checking equality
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

// Hashable
// hash value is calculated by the means of modulo
// hash value is used to get fast access to an element in a set or a dictionary
// hash value is not random the same variables combined in a hasher give the same value
// two different types with the same values give the same hash value
// two different types with different values might give the same hash this is known as a collision
//

// structs automatically conform to both Equatable and Hashale
struct HashableStruct: Hashable {
    let num: Int
}

// classes do not automatically conform to either Hashable or Equatable
// you have to conform to Equatable first to conform to Hashable
// ⚠️ if objects are equal they MUST retuen the same hash value the reverse is not true 
class HashableClass: Hashable {
    var num: Int = 0
    
    static func == (lhs: HashableClass, rhs: HashableClass) -> Bool {
//      a goog practice is to use the same vars in the hash func
        lhs.num == rhs.num
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(num)
    }
}


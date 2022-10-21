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
    static func == (lhs: EquatableClass, rhs: EquatableClass) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
}

class CodableClass: Codable {
    let id: Int
    let name: String
    
// unlike Equatable reference types can conform to Codable and reate graph of referencd cycles
    
}

import Foundation

let range: ClosedRange<Int> = 1...3
let rangeOne = 1...3

class BaseClass {
    func overrideMe() {
        fatalError()
    }
}

extension BaseClass {
    func youCannotOverrideMe() {
//     you cannot override this method cuz it is in the extension therefore is not put into a V-table that allows polymorphism. It is put into message table
    }
    
    @objc func youCanOverrideMe() {
//     you can override it because you use a message dispatch here. You do not need you use @objc in parents cuz it is interfered
    }
}

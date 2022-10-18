import Foundation
import UIKit

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

class SomeNSClass: NSObject {
    final func staticFoo() {
//      final makes this method static dispathc
    }
    
    @objc func messageFoo() {
//      @objc makes it message dispatch
    }
}

extension SomeNSClass {
    func messageFooTwo() {
//     its always message dispatch in extensions of NSObject
    }
}

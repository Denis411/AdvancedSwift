// see also https://github.com/Denis411/Phantom-pattern

// PROBLEM: You can mix up some similar types

typealias Country = String
typealias Capital = String

let lookup: [Country: Capital] = [ "Canada"   : "Ottawa",
                                   "the USA"  : "Washincton",
                                   "China"    : "Beijing",
                                   "Australia": "Canberra"]

func printCountryAndCapital(_ country: Country, _ capital: Capital) {
    print("The capital of \(country) is \(capital)")
}

func test(_ country:  Country) {
    guard let capital = lookup[country] else {
        assertionFailure()
        return
    }
    
    //  ❗️ I didn't mention the difference
    //   The same can happen with blood types https://github.com/Denis411/Phantom-pattern
    printCountryAndCapital(capital, country)
}

// SOLUTION: Create types that cannot be mixed up
// use phantome tyes for thatn

struct Named<T>: Hashable, ExpressibleByStringLiteral, CustomStringConvertible {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    init(stringLiteral value: StringLiteralType) {
        name = value
    }
    
    var description: String {
        return name
    }
}

// Enums cannot use the same names as type aliesas cush those names are already take by the typealiases
// The enum make distinct tyes
enum PhantomCountryUninhabitedEnum { }
enum PhantomCapitalUninhabitedEnum { }

// better names would be
// CountryTag
// CapitalTag

typealias PhantomCountry = Named<PhantomCountryUninhabitedEnum>
typealias PhantomCapital = Named<PhantomCapitalUninhabitedEnum>


let lookupWithPhantoms: [PhantomCountry: PhantomCapital] = [ "Canada"   : "Ottawa",
                                                             "the USA"  : "Washincton",
                                                             "China"    : "Beijing",
                                                             "Australia": "Canberra"]

func printCountryAndCapitalCorrected(_ country: PhantomCountry, _ capital: PhantomCapital) {
    print("The capital of \(country) is \(capital)")
}

func test(_ country:  PhantomCountry) {
    guard let capital = lookupWithPhantoms[country] else {
        assertionFailure()
        return
    }
    
// COMPILE ERROR
//    printCountryAndCapitalCorrected(capital, country)
    
    printCountryAndCapitalCorrected(country, capital)
}

import UIKit

final class Person: NSObject {
    var first: String
    var last: String
    var yearOfBirth: Int
    init(first: String, last: String, yearOfBirth: Int) {
        self.first = first
        self.last = last
        self.yearOfBirth = yearOfBirth
    }
}

var people = [
    Person(first: "Jo", last: "Smith", yearOfBirth: 1970),
    Person(first: "Joanne", last: "Williams", yearOfBirth: 1985),
    Person(first: "Annie", last: "Williams", yearOfBirth: 1985),
    Person(first: "Robert", last: "Jones", yearOfBirth: 1990),
]

typealias SortDescriptor<T> = (T, T) -> Bool

func sortDescriptor<Value, Property>(property: @escaping (Value) -> Property,
                                     comparator: @escaping (Property) -> (Property) -> ComparisonResult) -> SortDescriptor<Value> {
    return {
        comparator(property($0))(property($1)) == .orderedAscending
    }
}

let lastNameSortDescriptor: SortDescriptor<Person> = sortDescriptor(property: { $0.last }, comparator: String.localizedCaseInsensitiveCompare)
let firstNameSortDescriptor: SortDescriptor<Person> = sortDescriptor(property: { $0.first }, comparator: String.localizedCaseInsensitiveCompare)

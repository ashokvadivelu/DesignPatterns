import UIKit
import Foundation
var str = "Hello, playground"

class Person : CustomStringConvertible {
    
    var name = "", streetAdress = ""
    var companyName = "", postion = ""
    var income = 0
    init(_ name: String) {
        self.name = name
    }
    var description: String {
        return "Peson name is \(name), lives in \(streetAdress) and works at company \(companyName). "
    }
}
class PersonBuilder {
    var person =  Person("ashok")
    var lives: PersonAdressBuilder {
        return PersonAdressBuilder(person)
    }
    var works: PersonJobBuilder {
        return PersonJobBuilder(person)
    }
    func build() -> Person {
        return person
    }
}
class PersonAdressBuilder: PersonBuilder {
    internal init(_ person: Person) {
        super.init()
        self.person = person
    }
    func at(_ street: String) -> PersonAdressBuilder {
        person.streetAdress = street
        return self
    }
}
class PersonJobBuilder: PersonBuilder {
    internal init(_ person: Person) {
        super.init()
        self.person = person
    }
    
    func workat(_ work: String) -> PersonJobBuilder {
        person.companyName = work
        return self
    }
}
let person1 = Person("ashok")
person1.streetAdress = "Chennai"
person1.companyName = "Cognizant"
print(person1)
let p = PersonBuilder().lives.at("Chennai").works.workat("Cognizant").build()




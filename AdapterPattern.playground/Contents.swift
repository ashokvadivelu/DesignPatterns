protocol Jumping {
  func jump()
}

class Dog: Jumping {
  func jump() {
    print("Jumps Excitedly")
  }
}

class Cat: Jumping {
  func jump() {
    print("Pounces")
  }
}
 
let dog = Dog()
let cat = Cat()

//The Adaptee

class Frog {
  func leap() {
    print("Leaps")
  }
}

let frog = Frog()

//The Adapter
extension Frog: Jumping {
  func jump() {
    leap()
  }
}

// Before
var animals: [Jumping] = [dog, cat]
func jumpAll(animals: [Jumping], frog: Frog) {
  for animal in animals {
    animal.jump()
  }
    frog.leap()
}

//
class FrogAdapter: Jumping {
  private let frog = Frog()
  
  func jump() {
    frog.leap()
  }
}

let frogAdapter = FrogAdapter()


//After
var animalsJump: [Jumping] = [dog, cat, frogAdapter]

func jumpAll(animals: [Jumping]) {
  for animal in animals {
    animal.jump()
  }
}



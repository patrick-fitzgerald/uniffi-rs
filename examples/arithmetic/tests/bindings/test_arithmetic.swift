import arithmetic

assert(try! add(a: 2, b: 3, overflow: .saturating) == 5, "addition works")

assert(try! equal(a: 4, b: 4), "equality works")
assert(try! !equal(a: 4, b: 5), "non-equality works")
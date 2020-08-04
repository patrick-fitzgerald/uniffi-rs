import todolist


let todo = try! TodoList()
do {
    let _ = try todo.getLast()
    fatalError("Should have thrown an EmptyTodoList error!")
} catch TodoError.EmptyTodoList{
    //It's okay! There are not todos!
}
try! todo.addItem(todo: "Write swift bindings")
assert( try! todo.getLast() == "Write swift bindings")

try! todo.addItem(todo: "Write tests for bindings")
assert(try! todo.getLast() == "Write tests for bindings")

let entry = TodoEntry(text: "Write bindings for strings as record members")
try! todo.addEntry(entry: entry)
assert(try! todo.getLast() == "Write bindings for strings as record members")

try! todo.addItem(todo: "Test Ünicode hàndling without an entry can't believe I didn't test this at first 🤣")
assert(try! todo.getLast() == "Test Ünicode hàndling without an entry can't believe I didn't test this at first 🤣")

do {
    let _ = try createEntryWith(todo: "")
    fatalError("Should have thrown an EmptyString error!")
} catch TodoError.EmptyString {
    // It's okay! It was an empty string
}

let entry2 = TodoEntry(text: "Test Ünicode hàndling in an entry can't believe I didn't test this at first 🤣")
try! todo.addEntry(entry: entry2)
assert(try! todo.getLastEntry() == entry2)

assert(try! todo.getEntries().count == 5)

try! todo.addEntries(entries: [TodoEntry(text: "foo"), TodoEntry(text: "bar")])
assert(try! todo.getEntries().count == 7)
assert(try! todo.getItems().count == 7)
assert(try! todo.getLast() == "bar")

try! todo.addItems(items: ["bobo", "fofo"])
assert(try! todo.getItems().count == 9)
assert(try! todo.getItems()[7] == "bobo")
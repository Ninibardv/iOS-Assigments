import Foundation

/*
1. შევქმნათ Class Book.
 
Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
Designated Init.
Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.
 */

class Book {
    
    var bookID: Int
    static var nextID: Int = 1
    var title: String
    var author: String
    var borrowed: Bool

    init(bookID: Int, title: String, author: String) {
        self.bookID = Book.nextID
        Book.nextID += 1
        self.title = title
        self.author = author
        self.borrowed = false
    }

    func markAsBorrowed() {
        if !borrowed {
            borrowed = true
            print("\(title) რომლის ავტორია \(author) წაიღეს ბიბლიოთეკიდან.")
        } else {
            print("\(title) რომლის ავტორია \(author) დაკავებულია, კითხულობს ადამიანი და აცდი?")
        }
    }

    func markAsReturned() {
        if borrowed {
            borrowed = false
            print("\(title) რომლის ავტორია \(author) დააბრუნეს, გასკდნენ იმდენი იკითხეს.")
        } else {
            print("\(title) რომლის ავტორია \(author) გვაქვს მარაგში, მომილოცავს გაგიმართლა.")
        }
    }
}

let book1 = Book(bookID: 1, title: "ნინი-ს ბიოგრაფია", author: "თვით ნინი")

book1.markAsBorrowed()
book1.markAsBorrowed()
book1.markAsReturned()
book1.markAsReturned()
 
 
/*
2. შევქმნათ Class Owner

Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
Designated Init.
Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
*/

class Book1 {
    let id: Int
    let title: String
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

class Owner {
    let ownerId: Int
    let name: String
    var borrowedBooks: [Book1] = []
    
    init(ownerId: Int, name: String) {
        self.ownerId = ownerId
        self.name = name
    }
    
    func borrowBook(book: Book1) {
        borrowedBooks.append(book)
        print("\(name) აიღო \(book.title)")
    }
    
    func returnBook(book: Book1) {
        if let index = borrowedBooks.firstIndex(where: { $0.id == book.id }) {
            borrowedBooks.remove(at: index)
            print("\(name) დააბრუნა \(book.title)")
        } else {
            print("\(name) არც იკადრა ეს წიგნი \(book.title)")
        }
    }
}

let book2 = Book1(id: 1, title: "ნინი-ს ბიოგრაფია")
let owner = Owner(ownerId: 1, name: "ფუჩქიმ")

owner.borrowBook(book: book2)
owner.returnBook(book: book2)




/*
3.შევქმნათ Class Library
 
 Properties: Books Array, Owners Array.
 Designated Init.
 Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
 Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
 Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
 Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
 Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
 Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
 Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.
 */

class Book2 {
    var title: String
    var author: String
    var owner: Owner1?
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
}

class Owner1 {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

class Library {
    var books: [Book2] = []
    var owners: [Owner1] = []
    
    func addBook(title: String, author: String) {
        let newBook = Book2(title: title, author: author)
        books.append(newBook)
    }
    
    func addOwner(id: Int, name: String) {
        let newOwner = Owner1(id: id, name: name)
        owners.append(newOwner)
    }
    
    func getAvailableBooks() -> [Book2] {
        return books.filter { $0.owner == nil }
    }
    
    func getRetrievedBooks() -> [Book2] {
        return books.filter { $0.owner != nil }
    }
    
    func findOwnerById(id: Int) -> Owner1? {
        return owners.first { $0.id == id }
    }
    
    func findBooksTakenByOwner(ownerId: Int) -> [Book2] {
        return books.filter { $0.owner?.id == ownerId }
    }
    
    func takeBook(title: String, ownerId: Int) -> String {
        guard let book = books.first(where: { $0.title == title && $0.owner == nil }) else {
            return "არ არის ხელმისაწვდომი."
        }
        guard let owner = findOwnerById(id: ownerId) else {
            return "ვერ ვშოულობთ პატრონს."
        }
        book.owner = owner
        return "\(title) აიღო \(owner.name)."
    }
}

let library = Library()

library.addBook(title: "ნინის სიმაგრე", author: "თვით ნინი")
library.addBook(title: "ნინის ეძინება", author: "თვით ნინი")
library.addBook(title: "ნინის აღარ შეუძლია", author: "თვით ნინი")

library.addOwner(id: 1, name: "მე")
library.addOwner(id: 2, name: "ვარზსქენი")

print(library.takeBook(title: "ნინის სიმაგრე", ownerId: 1))

let availableBooks = library.getAvailableBooks()
for book in availableBooks {
    print("ხელმისაწვდომი წიგნი: \(book.title) \(book.author) - ის მიერ")
}

let retrievedBooks = library.getRetrievedBooks()
for book in retrievedBooks {
    print("დაკავებული წიგნი: \(book.title) \(book.author) - ის მიერ")
}

if let owner = library.findOwnerById(id: 1) {
    print("ID 1: \(owner.name)")
}

let ownerBooks = library.findBooksTakenByOwner(ownerId: 1)
for book in ownerBooks {
    print("მე -ს მიერ წაღებული წიგნები: \(book.title) \(book.author) - ის მიერ")
}


/*
4.
გავაკეთოთ ბიბლიოთეკის სიმულაცია.

შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნებ
 კონკრეტულად ერთი Owner-ის მიერ.
 */

class Book9 {
    let title: String
    var isAvailable: Bool
    
    init(title: String) {
        self.title = title
        self.isAvailable = true
    }
}

class Owner9 {
    let name: String
    var checkedOutBooks: [Book9]
    
    init(name: String) {
        self.name = name
        self.checkedOutBooks = []
    }
    
    func checkOut(book: Book9) {
        if book.isAvailable {
            book.isAvailable = false
            checkedOutBooks.append(book)
            print("\(name) -მ  წაიღო '\(book.title)'")
        } else {
            print("ბოდიში, '\(book.title)' არ არის ხელმისაწვდომი.")
        }
    }
    
    func returnBook(book: Book9) {
        if let index = checkedOutBooks.firstIndex(where: { $0.title == book.title }) {
            book.isAvailable = true
            checkedOutBooks.remove(at: index)
            print("\(name) -მ  დააბრუნა '\(book.title)'")
        } else {
            print("\(name) -ს არ აქვს გატანილი '\(book.title)'.")
        }
    }
}

class Library9 {
    var books: [Book9]
    var owners: [Owner9]
    
    init() {
        self.books = []
        self.owners = []
    }
    
    func addBook(book: Book9) {
        books.append(book)
    }
    
    func addOwner(owner: Owner9) {
        owners.append(owner)
    }
    
    func displayAvailableBooks() {
        print("ხელმისაწვდომი წიგნები:")
        for book in books {
            if book.isAvailable {
                print("- \(book.title)")
            }
        }
    }
    
    func displayCheckedOutBooks(by owner: Owner9) {
        print("\(owner.name)-ს გატანილი წიგნები :")
        for book in owner.checkedOutBooks {
            print("- \(book.title)")
        }
    }
}


let book9 = Book9(title: "ყვავილები ელჯერნონისთვის")
let book10 = Book9(title: "451 გრადუსი ფარენჰაიტით")
let book11 = Book9(title: "ქარიშხლიანი უღელტეხილი")

let owner1 = Owner9(name: "ნონა")
let owner2 = Owner9(name: "ბადრი")

let library1 = Library9()

library1.addBook(book: book9)
library1.addBook(book: book10)
library1.addBook(book: book11)

library1.addOwner(owner: owner1)
library1.addOwner(owner: owner2)

owner1.checkOut(book: book9)
owner2.checkOut(book: book10)
owner1.checkOut(book: book11)
owner1.returnBook(book: book9)
owner2.returnBook(book: book10)

library1.displayAvailableBooks()
library1.displayCheckedOutBooks(by: owner1)
library1.displayCheckedOutBooks(by: owner2)

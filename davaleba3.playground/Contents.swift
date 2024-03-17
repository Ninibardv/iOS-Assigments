//1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)


func mirror (random: String) -> (Bool) {
    var endResult = ""
    var endMirror = false
    
    for char in random {
        endResult = String(char) + endResult
    }
    if endResult == random {
        endMirror = true
    } else {
        endMirror = false
    }
    return(endMirror)
}

let randomString = "ნინი"
let isMirror = mirror(random: randomString)
print("\(isMirror)")

//2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.


func squareArray(_ numbers: [Int]) -> [Int] {
    var squaredArray = [Int]()
    
    for number in numbers {
        let squaredValue = number * number
        squaredArray.append(squaredValue)
    }
    
    return squaredArray
}

let numbers = [1, 2, 3, 34, 55]
let squaredNumbers = squareArray(numbers)
print("\(squaredNumbers)")


//3. დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.


let nums = [12, 21, 25, 31, 52, 62, 78]

let evenNumbers = nums.filter { nums in
    return nums % 2 == 0
    //return nums % 2 !=
}

print("\(evenNumbers)")
    

//4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.


import Foundation

func delay(_ numbers1: [Int]) {
    func calculate() {
        let sum = numbers1.reduce(0, +)
        print(sum)
    }
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
        calculate()
    }
}

let numbers1 = [1, 2, 3, 4, 5]
delay(numbers1)


//5. შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი



var contacts = [String: String]()

func add(name: String, phoneNumber: String) {
    contacts[name] = phoneNumber
}

func search() {
    if contacts.isEmpty {
        print("No contacts found.")
    } else {
        print("Contacts:")
        for (name, phoneNumber) in contacts {
            print("\(name): \(phoneNumber)")
        }
    }
}

func delete(name: String) {
    if contacts[name] != nil {
        contacts.removeValue(forKey: name)
        print("Contact \(name) deleted successfully.")
    } else {
        print("Contact not found.")
    }
}

add(name: "Nini", phoneNumber: "04162002")
add(name: "Luarsabi", phoneNumber: "11223344")
add(name: "Ingorokva", phoneNumber: "123098765")
print(contacts)
search()
delete(name: "Luarsabi")



//6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.

func sortedKeys(from dictionary: [String: Int]) -> [String] {
    let sortedKeys = dictionary.keys.sorted()
    return sortedKeys
}

let dictionary = ["legvi": 5, "txili": 3, "stafilo": 8, "mandarini": 1]
let sortedKeyArray = sortedKeys(from: dictionary)
print(sortedKeyArray)


//7. შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.


let numbers3: [Double] = [3.14, 5.67, 8.91, 2.35, 9.81, 6.28]

var largestNumber = numbers3[0]
for number in numbers3 {
    if number > largestNumber {
        largestNumber = number
    }
}

print(largestNumber)

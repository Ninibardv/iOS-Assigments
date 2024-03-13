//1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.

let number1: Int = 2
let number2: Int = 5
let number3: Int = 8
let number = number1 * number2 * number3
print("Multiplication of \(number1), \(number2), and \(number3) is : \(number)")


//2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.

let numberCheck = 2
let result = (numberCheck % 2 == 0) ? "even" : "odd"
print("\(numberCheck) is \(result)")


//3.შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ

let optionalName: String? = "Nini"

if let name = optionalName {
    print("\(name)")
} else {
    print("No name provided.")
}


//4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა. If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.

let isRaining: Bool = true
if isRaining {
    print("ქოლგის წაღება არ დამავიწყდეს")
}
else {
    print("დღეს ქოლგა არ დამჭირდება")
}

//5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”

let a: Int = 1
let b: Int = 2

if a>b {
    print("a მეტია")
}
else {
    print("ბ მეტია")
}

//6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.


let firstCharacter: Character = "N"
print("\(firstCharacter)")

//7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე ციფრისგან შემდგარი

let ourNumber: Int = 15
if ourNumber >= 10 && ourNumber <= 99 {
    let twoDigit = ourNumber / 10
    let oneDigit = ourNumber % 10
    if twoDigit == oneDigit {
        print("\(ourNumber) consists two same digits")
   } else {
        print("\(ourNumber) consists two different digits")
    }
} else {
    print("\(ourNumber) is not two digit number")
}


//8. აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.

let numberOfMonths: Int = 4
if numberOfMonths == 3 || numberOfMonths == 4 || numberOfMonths == 5 {
    print ("გაზაფხული")
}
if numberOfMonths == 6 || numberOfMonths == 7 || numberOfMonths == 8 {
    print ("ზაფხული")
}
if numberOfMonths == 9 || numberOfMonths == 10 || numberOfMonths == 11 {
    print ("შემოდგომა")
}
if numberOfMonths == 12 || numberOfMonths == 1 || numberOfMonths == 2 {
    print ("ზამთარი")
}

//9. შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”, თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”


let resultNumber: Int = 12
if resultNumber % 3 == 0 && resultNumber % 4 == 0  {
    print("\(resultNumber) იყოფა 3-ზე და 4-ზე")
} else if resultNumber % 3 == 0 {
    print("\(resultNumber) იყოფა 3-ზე")
} else if resultNumber % 4 == 0 {
    print("\(resultNumber) იყოფა 4-ზე")
} else {
    print("\(resultNumber) არ იყოფა არცერთზე")
}


//1. while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.

var number = 1
var result = 1

while number <= 20 {
    if  number % 2 != 0 {
        result *= number
    }
    number += 2
}
print("ყველა კენტი რიცხვის ნამრავლი 1-დან 20-მდე არის:", result)




//2. შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”

var mainString = "Malayalam" //რაღაც ინდური ენა ყოფილა ეს
var reversedString = ""

for character in mainString {
    reversedString = String(character) + reversedString
}
print("ამ სიტყვის შებრუნებული ვერსიაა:", (reversedString))




//3. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."
//ამის კოდი ჩავაკომენტარე იმიტომ, რომ შემაღონა sorry:დდდ

/* var currentState = 0
let red = "🔴"
let yellow = "🌕"
let green = "🟢"

while true {
    switch currentState {
    case 0:
        print(red, terminator: "->")
        currentState = 1
    case 1:
        print(yellow, terminator: "->")
        currentState = 2
    case 2:
        print(green, terminator: "->")
        currentState = 0
    default:
        break
    }
} */




//4. Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე” (მე Red Hot Chilli Peppers- ზე წავალ თქვენი ნებართვით)

var tickets = 10

while tickets > 0 {
    print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(tickets)")
    tickets -= 1
    if tickets == 0 {    // ეს if- ის გარეშეც იპრინტება, მაგრამ იყოს ასე დავტოვებ თუ შეცდომა არაა;დ
        print("ყველა ბილეთი გაყიდულია, გელოდებით კონცერტზე")
    }
}




//5. შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)

var array = [1, 2, 3, 3]
var unique = Set(array)
if unique.count == array.count {
    print("array-ში ყველა ელემენტი განსხვავებულია")
} else {
    print("array შეიცავს მსგავს ელემენტებს")
}




//6. დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას

let myClosure:(Double, Double) -> (Double) =  { x,y in
    return x - y
}

print("ამ ორი რიცხვის სხვაობა არის:", (myClosure(223.1,123.1)))




//7. დაწერეთ ფუნქცია, რომელიც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამენტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.

func Consonants (Word : String) -> (Int){
    var count1 = 0
    let consonants = "qwrtypsdfghjklzxcvbnm"
    
    for cons in Word {
        
        for  char in consonants {
            if cons.lowercased() == char.lowercased() {
                count1 += 1
            }
        }
    }
    
    return count1
}
print("ამ წინადადებაში თანხმოვნების რაოდენობა არის:", (Consonants(Word:  "hidroelektrosadguri")))

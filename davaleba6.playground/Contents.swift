import Foundation


//1. შექმენით ენამი Gender სადაც იქნება 2 გენდერი

enum Gender {
    case female
    case male
}

//2. შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender

protocol SuperBeing {
    var name: String {get}
    var strength: Int {get}
    var speed: Int {get}
    var weakness: String {get}
    var gender: Gender {get}
}

//3. SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა

extension SuperBeing {
    var strength: Int {return 100}
    var speed: Int {return 100}
}

//4. შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.

class Superhero: SuperBeing {
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    
    init(name: String, strength: Int, speed: Int, weakness: String, gender: Gender) {
        self.name = name
        self.strength = strength
        self.speed = speed
        self.weakness = weakness
        self.gender = gender
       
    }
}

class SuperVillain: SuperBeing {
    var name: String
    var strength: Int
    var speed: Int
    var weakness: String
    var gender: Gender
    
    init(name: String, strength: Int, speed: Int, weakness: String, gender: Gender) {
        self.name = name
        self.strength = strength
        self.speed = speed
        self.weakness = weakness
        self.gender = gender
        
    }
}

//5. გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String

extension Superhero {
    var outfitColor: String { return "Red" }
    var equipment: String { return "Shield" }
    var vehicle: String { return "Jet" }
}

//6. გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს -
//'სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).

extension Superhero {
    func rescue(victimName: String) {
        print("\(self.name) არ შეუშინდა სახიფათო სიტუაციას და \(victimName) გადაარჩინა სიკვდილს")
    }
    
}


//7. გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -
//“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)

extension Superhero {
    func combat(villain: SuperVillain) {
        print("\(self.name) შეერკინა და დაამარცხა \(villain.name)")
    }
}


//8. გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String

extension SuperVillain {
    var evilScheme: String { return "გავათენებინო ყველას"  }
    var obsession: String { return "კითხვების მოსმენა და პასუხების გაცემა"}
    var rivalry: String { return "დავითის კომენტარები ჩათში"}
}

//9. გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -
//“ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)

extension SuperVillain {
    func attack(superhero: Superhero) {
        print("\(self.name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(superhero.name) მის შეჩერებას თუ შეძლებს")
    }
}

//10. გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
//“‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა”

extension SuperVillain {
    func experimentation(subject: String) {
        print("\(self.name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამჟამად \(subject) აღმოჩნდა")
    }
}

//11. შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან

let hero1 = Superhero(name: "სუპერბექა", strength: 99, speed: 100, weakness: "მარტივი დავალებების დაწერა", gender: .male)
let hero2 = Superhero(name: "უძლიერესი ნინი", strength: 100, speed: 100, weakness: "ბექას დავალებები", gender: .female)
let hero3 = Superhero(name: "კაპიტანი დავითი", strength: 99, speed: 99, weakness: "რაისას პასუხები", gender: .male)
let hero4 = Superhero(name: "დაუმარცხებელი ვასო", strength: 100, speed: 100, weakness: "აკაკის კითხვები", gender: .male)
let hero5 = Superhero(name: "Steve Jobs", strength: 0, speed: 0, weakness: "იაფიანი პროდუქტები", gender: .male)

let villain1 = SuperVillain(name: "ამომეწურა ფანტაზია", strength: 100, speed: 100, weakness: "ფანტაზია", gender: .male)
let villain2 = SuperVillain(name: "ბექას დავალება", strength: 100, speed: 100, weakness: "აიოეს სქუადის კრიტიკა", gender: .male)
let villain3 = SuperVillain(name: "თანოსი",strength: 100, speed: 100, weakness: "უთავობა", gender: .male)
let villain4 = SuperVillain(name: "ჯოკერა",strength: 100, speed: 100, weakness: "პოკერი", gender: .male)
let villain5 = SuperVillain(name: "ჩემი ნერვები",strength: 100, speed: 100, weakness: "უნერვო მე", gender: .male)

hero3.rescue(victimName: "ფუჩქი")
villain1.attack(superhero: hero2)
villain2.experimentation(subject: "აიოეს სქუადი")
hero1.combat(villain: villain5)

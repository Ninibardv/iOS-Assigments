import Foundation

//1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday

    func isWorkday() -> Bool {
        switch self {
        case .saturday, .sunday:
            return false
        default:
            return true
        }
    }
}

func checkDayType(_ day: WeekDay) {
    let type = day.isWorkday() ? "სამუშაო დღე" : "დასვენება"
    print("\(day) არის \(type).")
}

let monday = WeekDay.monday
let saturday = WeekDay.saturday

checkDayType(monday)
checkDayType(saturday)


//2. შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

enum GialaSquad {
    case tsigroviManto, moshishvlebuliMkerdi, tuGapatio

    static func monthlyPrice(for level: GialaSquad) -> Int {
        switch level {
        case .tsigroviManto:
            return 100
        case .moshishvlebuliMkerdi:
            return 50
        case .tuGapatio:
            return 20
        }
    }

    static func printPrices() {
        print("GialaSquad-ის თვიური ფასები:")
        print("Tsigrovi Manto: \(monthlyPrice(for: .tsigroviManto)) ლარი თვეში")
        print("Moshishvlebuli Mkerdi: \(monthlyPrice(for: .moshishvlebuliMkerdi)) ლარი თვეში")
        print("Tu Gapatio: \(monthlyPrice(for: .tuGapatio)) ლარი თვეში")
    }
}
GialaSquad.printPrices()

//3. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case sunny(celsius: Int)
    case cloudy(celsius: Int)
    case rainy(celsius: Int)
    case snowy(celsius: Int)
}

func wear(for weather: Weather) {
    switch weather {
    case .sunny(let celsius) where celsius > 30:
        print("Wear thin clothes, it's hot outside.")
    case .cloudy(let celsius) where celsius > 20 && celsius < 25:
        print("It's a bit chilly outside, grab a jacket.")
    case .rainy(let celsius) where celsius > 15 && celsius < 20:
        print("It's raining, grab an umbrella and wear some boots.")
    case .snowy(let celsius) where celsius < 10 && celsius > 1:
        print("It's cold outside, wear something to feel warm and cozy, don't forget the hat!")
    default:
        print("The weather is ქრეიზი.")
    }
}

let currentWeather = Weather.sunny(celsius: -1)
wear(for: currentWeather)


//4. შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye {
    let album: String
    let releaseYear: Int
}

func Albums(releasedSince year: Int, kanyeArray: [Kanye]) -> [Kanye] {
    let filteredAlbums = kanyeArray.filter { $0.releaseYear >= year }
    return filteredAlbums
}

var kanyeAlbums: [Kanye] = [
    Kanye(album: "The College Dropout", releaseYear: 2004),
    Kanye(album: "Late Registration", releaseYear: 2005),
    Kanye(album: "Graduation", releaseYear: 2007),
    Kanye(album: "808s & Heartbreak", releaseYear: 2008),
    Kanye(album: "My Beautiful Dark Twisted Fantasy", releaseYear: 2010),
    Kanye(album: "Yeezus", releaseYear: 2013),
    Kanye(album: "The Life of Pablo", releaseYear: 2016),
    Kanye(album: "Ye", releaseYear: 2018),
    Kanye(album: "Jesus Is King", releaseYear: 2019)
]

let filteredAlbums = Albums(releasedSince: 2013, kanyeArray: kanyeAlbums)
print("Albums released since 2013:")
filteredAlbums.forEach { print("\($0.album)") }


//5.შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა

@propertyWrapper
struct LazyCachedData {
    private var storage: String?
    private let closure: () -> String

    init(_ closure: @autoclosure @escaping () -> String) {
        self.closure = closure
    }

    var wrappedValue: String {
        mutating get {
            if storage == nil {
                storage = closure()
            }
            return storage!
        }
    }
}

struct SomeStruct {
    @LazyCachedData("lazy ინიციალიზებულია")
    var cachedData: String
}

var instance = SomeStruct()
print(instance.cachedData)


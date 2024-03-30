import Foundation


//შექმენით ციკლური რეფერენცები და გაწყვიტეთ +
//აუცილებელია ქლოჟერების გამოყენება +
//აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები) +
//აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც +
//დაიჭირეთ self ქლოჟერებში +
//გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით +




protocol Worker: AnyObject {    // არ ჭირდება მიწერა მგონი მაგრამ მივაწერ, პროტოკოლი
    var name: String { get }
    func introduce() -> String
}

class Staff: Worker {              // ასევე, მაგრამ კლასი
    let name: String
    weak var team: Team?           //Weak რეფერესი
    var onDeinit: (() -> Void)?    //ქლოჟერ
    
    init(name: String) {
        self.name = name
    }
    
    func introduce() -> String {
        return "გამარჯობა, მე ვარ \(name), თქვენი გუნდის წევრი."
    }
    
    deinit {
        onDeinit?()
        print("\(name) staff member instance deinitialized.")
    }
}

class Manager: Worker {
    let name: String
    weak var team: Team?
    var onDeinit: (() -> Void)?
    
    init(name: String) {
        self.name = name
    }
    
    func introduce() -> String {
        return "გამარჯობა, მე ვარ \(name), მენეჯერი."
    }
    
    deinit {
        onDeinit?()
        print("\(name) manager instance deinitialized.")
    }
}

class Team {
    let name: String
    unowned let company: Company      //Unowned
    var members: [Worker]
    var onDeinit: (() -> Void)?
    
    init(name: String, company: Company) {
        self.name = name
        self.company = company        //Strong
        self.members = []
    }
    
    func teamInfo() -> String {
        return "\(company.name)-ში არის \(name)-ის გუნდი რომელშიც \(members.count) თანამშრომელი ჰყავთ."
    }
}

class Company {
    let name: String
    var teams: [Team]
    var onDeinit: (() -> Void)?
    
    init(name: String) {
        self.name = name
        self.teams = []
    }
    
    func companyInfo() -> String {
        return "\(name)-ს ყავს \(teams.count) გუნდი."
    }
}

//ინსტანსები
var company: Company? = Company(name: "ყველაზე მაგარი კომპანია")                //Strong
var development: Team? = Team(name: "იოს დეველოპერები", company: company!)
var john: Staff? = Staff(name: "მამლაყინწა")
var jane: Staff? = Staff(name: "ვარსზქენი")
var managerA: Manager? = Manager(name: "უძერსკესი მენეჯერი")

//ციკლური რეფერენსები
john?.team = development
jane?.team = development
managerA?.team = development
development?.members.append(john!)
development?.members.append(jane!)
development?.members.append(managerA!)

//ქლოჟერი გაწყვეტა
john?.onDeinit = { [weak john] in
    guard let john = john else { return }
    print("\(john.name) is being deinitialized.")
}
jane?.onDeinit = { [weak jane] in
    guard let jane = jane else { return }
    print("\(jane.name) is being deinitialized.")
}
managerA?.onDeinit = { [weak managerA] in
    guard let managerA = managerA else { return }
    print("\(managerA.name) is being deinitialized.")
}
development?.company.onDeinit = { [weak company] in
    guard let company = company else { return }
    print("\(company.name) is being deinitialized.")
}
development?.onDeinit = { [weak development] in
    guard let development = development else { return }
    print("\(development.name) team is being deinitialized.")
}

print(development!.teamInfo())
print(company!.companyInfo())

//გაწყდააა
john = nil
jane = nil
managerA = nil
development = nil
company = nil

import Foundation

enum TextInputTypes {
    case Name
    case Password
    case PasswordRepeat
}

enum KeyChainError: Error {
    case sameItemFound
    case unknown
    case noSuchDataFound
    case keychainErrorWithCode(Int)
}

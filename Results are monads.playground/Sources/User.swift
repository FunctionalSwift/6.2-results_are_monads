import Foundation

public struct User {
    public let name: String
    public let password: String
    public let premium: Bool
    public let newsletter: Bool

    
    public init(name: String, password: String, premium: Bool, newsletter: Bool) {
        self.name = name
        self.password = password
        self.premium = premium
        self.newsletter = newsletter
    }
}

public enum UserError {
    case userNameOutOfBounds
    case passwordTooShort
    case mustBePremium
    case mustAcceptNewsletter
}

public class UserValidator {
    public class var Name: Validator<User, UserError> {
        return validate(.userNameOutOfBounds) {
            !$0.name.isEmpty && $0.name.count <= 15
        }
    }
    
    public class var Password: Validator<User, UserError> {
        return validate(.passwordTooShort) {
            $0.password.count > 10
        }
    }
    
    public class var Premium: Validator<User, UserError> {
        return validate(.mustBePremium) {
            $0.premium
        }
    }

    public class var Newsletter: Validator<User, UserError> {
        return validate(.mustAcceptNewsletter) {
            $0.newsletter
        }
    }
}

//: Playground - Results are monads

func validatePassword(of user: User) -> Result<User, UserError> {
    if user.password.count > 10 {
        return .success(user)
    }
    
    return .failure(.passwordTooShort)
}

func validateName(of user: User) -> Result<User, UserError> {
    if !user.name.isEmpty && user.name.count <= 15 {
        return .success(user)
    }
    
    return .failure(.userNameOutOfBounds)
}

func createUser(name: String, password: String, premium: Bool, newsletter: Bool) -> Result<User, UserError> {
    let validator = UserValidator.Name && UserValidator.Password &&
        (UserValidator.Premium || UserValidator.Newsletter)
    let user = User(name: name, password: password, premium: premium, newsletter: newsletter)
    
    return validator(user)
}

let user = createUser(name: "alex", password: "functionalswift", premium: true, newsletter: false)

user.map { print("SUCCESS: User created - \($0)") }







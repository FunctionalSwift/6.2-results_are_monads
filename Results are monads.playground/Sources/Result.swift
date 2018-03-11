public enum Result<A, E> {
    case success(_: A)
    case failure(_: E)
    
    public func map<B>(_ transform: (A) -> B) -> Result<B, E> {
        switch self {
        case let .success(value):
            return .success(transform(value))
        case let .failure(reason):
            return .failure(reason)
        }
    }
}

extension Result {
    func flatMap<B>(_ transform: (A) -> Result<B, E>) -> Result<B, E> {
        switch self {
        case let .success(value):
            return transform(value)
        case let .failure(reason):
            return .failure(reason)
        }
    }
}

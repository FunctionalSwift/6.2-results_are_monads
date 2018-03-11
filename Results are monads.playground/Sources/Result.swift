public enum Result<A, E> {
    case success(_: A)
    case failure(_: E)
    
    public func map<B>(_ transform: (A) -> B) -> Result<B, E> {
        return self.flatMap { .success(transform($0)) }
    }
}

extension Result {
    public func flatMap<B>(_ transform: (A) -> Result<B, E>) -> Result<B, E> {
        switch self {
        case let .success(value):
            return transform(value)
        case let .failure(reason):
            return .failure(reason)
        }
    }
}

struct Minion {
    let name: String
}

extension Minion: Equatable {
    static func == (lhs: Minion, rhs: Minion) -> Bool {
        return lhs.name == rhs.name
    }
}

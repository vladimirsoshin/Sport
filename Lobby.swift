import DataDetection

class Game {
    let title: String
    let date: Date
    var players: [String]

    init(title: String, date: Date, players: [String] = []) {
        self.title = title
        self.date = date
        self.players = players
    }
}


import UIKit
import GameplayKit
let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum GameState {
    case start, win , lose , draw
    
    var description:String {
        switch self {
        case .start:
            return "가위~ 바위~ 보!?"
        case .win:
            return "와 이걸 이기네.."
        case .lose:
            return "낄낔ㅋㅋ낄낔ㅋㅋㅋ븅X"
        case .draw:
            return "찌찌뽕😘"
        }
    }
}

enum Sing {
    case rock, paper, scissors
    // 칼큘레이터 를 만들어서 이모지를 리턴 하라
    var emoji : String {
        switch self {
        case .rock:
            return "👊🏻"
        case .paper:
            return "👋🏻"
        case . scissors:
            return "✌🏻"
        }
    }
    func match(opponent: Sing) -> GameState{
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .scissors:
                return .win
            }
        case .paper:
            switch opponent {
            case .rock:
                return .win
            case .paper:
                return .draw
            case .scissors:
                return .lose
            }
        case .scissors:
            switch opponent {
            case .rock:
                return .lose
            case .paper:
                return .win
            case .scissors:
                return .draw
            }
        }
    }
}

func randomSign() -> Sing{
    let sign = randomChoice.nextInt() // 어떤한 랜덤한 값이 튀어나온다
    if sign == 0 {
        return .rock
    }else if sign == 1 {
        return .paper
    }else {
        return .scissors
    }
}

let myChoice:Sing = .scissors
let appChoice:Sing = randomSign()

myChoice.match(opponent: appChoice)

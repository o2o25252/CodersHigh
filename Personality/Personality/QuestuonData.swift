//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by 임희찬 on 2021/05/12.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case sigle, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    //rawvalue
    case dog = "🐶", cat = "🐱", rabbit = "🐰" , turtle = "🐢"
    
    var definition : String {
        switch self {
        case .dog:
            return "You are incredibly outjoing. You surround yourself with the people you love, and enjoy activities with your friends"
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms"
        case .rabbit:
            return "You love everthing that's soft. You are healthy and full of energy"
        case .turtle:
            return "You are wise beyond your years, and focus on the details. Slow and steady wins the race"
        }
    }
}

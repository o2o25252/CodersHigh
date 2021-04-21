struct MyQuestionAnswerer {
    func responseTo(question: String) -> String {
        
        let lowerQuestion = question.lowercased()
        
        if lowerQuestion == "where are the cookies?" {
            return "몰라 묻지마 팍씨🖕🏿!"
        } else if lowerQuestion.hasPrefix("where") {
            return "There's a pig in the North!"
        } else {
            let defaultNumber = question.count % 2
            if defaultNumber == 0 {
                return "That really depends"
            } else {
                return "Ask me again tommorrow"
            }
        }
        
    }
}

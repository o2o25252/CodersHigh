//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by 임희찬 on 2021/05/12.
//

import UIKit

class ResultViewController: UIViewController {
    var responses: [Answer] = []
    
    
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true // back  버튼 비활성화 작업 
        // Do any additional setup after loading the view.
        calculatePersonalityResult()
    }
    func calculatePersonalityResult() {
        var frequencyOfAnswer : [AnimalType: Int] = [:]
        let responseTypes = responses.map{$0.type}
        
        for response in responseTypes {
            frequencyOfAnswer[response] = (frequencyOfAnswer[response] ?? 0) + 1 // 없으면 0
        }
        
        let frequentAnswersSorted = frequencyOfAnswer.sorted(by: { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        }) // 더 큰 값을 리턴하는 클로져
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key // 동물 이름
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!" // emojji
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


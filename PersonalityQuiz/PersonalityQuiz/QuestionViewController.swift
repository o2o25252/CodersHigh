//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by 임희찬 on 2021/05/12.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questions: [Question] = [
        Question(text: "Which food do you live the most", type: .sigle,
            answers:
            [Answer(text: "Steak", type: .dog),
             Answer(text: "Fish", type: .cat),
             Answer(text: "Carrot", type: .rabbit),
             Answer(text: "Corn", type: .turtle)
        ]),
        Question(text: "Which activities do you enjoy?", type: .multiple,
            answers: [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog)
        ]),
        Question(text: "How much do you enjoy car rides?", type: .ranged, answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I love them", type: .dog)
        ])
    ]
    
    var questionIndex = 0
    
    var answersChosen:[Answer] = [] // 답 기록하는 배열
    
    
    //Outlet
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
   
    @IBOutlet var multiLabels: [UILabel]!
    
    @IBOutlet var multiSwitches: [UISwitch]!
    
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
   
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        updateUI()
    }
    
    func updateUI() { // 문제에 맞게 업데이트
        singleStackView.isHidden = true // 숨기기
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        
        // 세팅
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
        
        
        
        switch currentQuestion.type { //ResponseType
        case .sigle:
            //singleStackView.isHidden = false
            updateSingleStack(using: currentAnswers)
        case .multiple:
            multipleStackView.isHidden = false
        case .ranged:
            rangedStackView.isHidden = false
        }
    }
    
    //각각의 문제 타입 마다 업데이트 해야할 UI 들이 많은데 이건 별도의 함수들로 분리해서 작업하는게 좋다 .
    
    func updateSingleStack(using answers:[Answer] ) {
        singleStackView.isHidden = false // 일단 화면에 보이게 하고
        
        for i in 0...3 {
            singleButtons[i].setTitle(answers[i].text, for: .normal) // singleButtons[i] 번쨰에 타이틀을 Answer[i]번째 를 가져오고 for는 무언가 눌러지거나 건들지 않았을때의 상태
        }
    }
    func updateMultipleStack(using answers:[Answer]) {
        multipleStackView.isHidden = false
        for i in 0...3 {
            multiSwitches[i].isOn = false // 바로 여기다
            multiLabels[i].text = answers[i].text
        }
    }
    
    func updateRangedStack(using answers:[Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false) //바로 여기다
        rangedLabels[0].text = answers.first?.text
        rangedLabels[1].text = answers.last?.text
        // 여기의 ? 는 왜 인가?
    }
    
    //Action
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        
        switch sender {
        case singleButtons[0]:
            answersChosen.append(currentAnswer[0])
        case singleButtons[1]:
            answersChosen.append(currentAnswer[1])
        case singleButtons[2]:
            answersChosen.append(currentAnswer[2])
        case singleButtons[3]:
            answersChosen.append(currentAnswer[3])
        default:
            break
        }
        nextQuestion()
    }
    
    
    @IBAction func multipleAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        //nextQuestion() 가 켜지면
        if multiSwitches[0].isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitches[1].isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitches[2].isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitches[3].isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
        
    }
    
    func nextQuestion() {
        // Index 를 1 증가 시키고
        // 문제가 남았으면  UpdateUI 를 호출
        // 문제가 끝났으면 ResultSegue 를 실행
        
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        }else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
        // 이걸 하고 나면 멀티플 과 레인지드 에서 이전 답변이 남아 있는걸 볼 수 있다. 그걸 해결하기 위해 updateRangedStack 을 할거다
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ResultSegue" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.responses = answersChosen
            
        }
    }
    

}

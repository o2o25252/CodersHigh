//
//  ViewController.swift
//  SimpleCenter
//
//  Created by 임희찬 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    let elemnetList = ["Carbon","Gold","Chlorine","Sodium"]
    var currentElementIndex = 0
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateElement()
    }
    
    func updateElement() {
        answerLabel.text = "?"
        let elementName = elemnetList[currentElementIndex]
        
        let image = UIImage(named: elementName)
        imgView.image = image
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = elemnetList[currentElementIndex]
    }
    
    @IBAction func gotoNextElement(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex >= elemnetList.count {
            currentElementIndex = 0
        }
        updateElement()
    }
}


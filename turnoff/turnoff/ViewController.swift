//
//  ViewController.swift
//  turnoff
//
//  Created by ėíŽė°Ž on 2021/05/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lightButton: UIButton!
    
    var lightOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        updateUI()
    }


    @IBAction func buttonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }
    func updateUI() {
        if lightOn {
            view.backgroundColor = .white
            lightButton.setTitle("ð", for: .normal)
        }else{
            view.backgroundColor = . black
            lightButton.setTitle("ð", for: .normal)
        }
    }
}


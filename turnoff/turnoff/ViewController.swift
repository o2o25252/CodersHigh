//
//  ViewController.swift
//  turnoff
//
//  Created by 임희찬 on 2021/05/03.
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
            lightButton.setTitle("🌝", for: .normal)
        }else{
            view.backgroundColor = . black
            lightButton.setTitle("🌚", for: .normal)
        }
    }
}


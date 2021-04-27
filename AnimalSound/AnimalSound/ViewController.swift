//
//  ViewController.swift
//  AnimalSound
//
//  Created by 임희찬 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animals: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func cat(_ sender: Any) {
        animals.text = "meow!"
        let sound = SimpleSound(named: "meow")
        sound.play()
    }
    @IBAction func dog(_ sender: Any) {
        animals.text = "woof!"
        let sound = SimpleSound(named: "woof")
        sound.play()
    }
    @IBAction func cow(_ sender: Any) {
        animals.text = "moo!"
        let sound = SimpleSound(named: "moo")
        sound.play()
    }
}


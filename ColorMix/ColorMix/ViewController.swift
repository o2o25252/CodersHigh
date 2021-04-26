//
//  ViewController.swift
//  ColorMix
//
//  Created by 임희찬 on 2021/04/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var clorView: UIView!
    //속성은 UIView 타입
    //@IBOutlet 인터페이스 빌더
    override func viewDidLoad() {
        super.viewDidLoad()
        clorView.layer.cornerRadius = 20
        clorView.layer.borderWidth = 3
        clorView.layer.borderColor = UIColor.black.cgColor
        
        updateColor()
        //clorView 의 영역의 배경을 블랙으로 설정
        
        
        
    }
    @IBAction func sliderChange(_ sender: Any) {
        updateColor()
    }
    
    //sender 란? switchChanged 함수에서 호출한 UI 오브젝트 를 가르킨다
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    
    @IBAction func reset(_ sender: Any) {
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        redSlider.value = 1.0
        greenSlider.value = 1.0
        blueSlider.value = 1.0
        updateColor()
        updateControls()
    }
    func updateColor() {
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        let color = UIColor (red: red, green: green, blue: blue, alpha: 1)
        
        clorView.backgroundColor = color
    }
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
}


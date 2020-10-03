//
//  ViewController.swift
//  UIButtonExtensionExample
//
//  Created by Arman Zoghi on 9/28/20.
//

import UIKit
import UIButtonExtension

class ViewController: UIViewController {
    let radioButton1 = UIRadioButton()
    let radioButton2 = UIRadioButton()
    let radioButton3 = UIRadioButton()

    var radioButtons: [UIRadioButton] = [] {
        didSet {
            
        }
    }
    let checkboxModern1 = UICheckboxModern()
    let checkboxModern2 = UICheckboxModern()
    let checkboxClassic = UICheckboxClassic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configTest()
    }
    
    func configTest() {
        for _ in 0..<4 {
            let button = UIRadioButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(button)
            self.radioButtons.append(button)
        }

//        view.addSubview(checkboxModern1)
        view.addSubview(radioButton1)
        view.addSubview(radioButton2)
        view.addSubview(radioButton3)
        view.addSubview(checkboxModern2)
        view.addSubview(checkboxClassic)

//        checkboxModern1.translatesAutoresizingMaskIntoConstraints = false
        radioButton1.translatesAutoresizingMaskIntoConstraints = false
        radioButton2.translatesAutoresizingMaskIntoConstraints = false
        radioButton3.translatesAutoresizingMaskIntoConstraints = false
        checkboxModern2.translatesAutoresizingMaskIntoConstraints = false
        checkboxClassic.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: radioButtons[0], attribute: .centerY, relatedBy: .equal, toItem: self.view,        attribute: .centerY, multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[0], attribute: .centerX, relatedBy: .equal, toItem: self.view,        attribute: .centerX, multiplier: 1,   constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[0], attribute: .width,   relatedBy: .equal, toItem: self.view,        attribute: .width,   multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[0], attribute: .height,  relatedBy: .equal, toItem: self.radioButtons[0], attribute: .width,   multiplier: 1,   constant: 0).isActive = true
        
//        radioButton.selectedSize = 0.6
//        radioButton.borderWidth  = 10
        
        NSLayoutConstraint(item: radioButtons[1], attribute: .centerY, relatedBy: .equal, toItem: self.view,            attribute: .centerY, multiplier: 0.75, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[1], attribute: .centerX, relatedBy: .equal, toItem: self.view,            attribute: .centerX, multiplier: 1,    constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[1], attribute: .width,   relatedBy: .equal, toItem: self.view,            attribute: .width,   multiplier: 0.3,  constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[1], attribute: .height,  relatedBy: .equal, toItem: self.radioButtons[1], attribute: .width,   multiplier: 1,    constant: 0).isActive = true
        
//        NSLayoutConstraint(item: checkboxModern1, attribute: .centerY, relatedBy: .equal, toItem: self.view,            attribute: .centerY, multiplier: 0.75, constant: 0).isActive = true
//        NSLayoutConstraint(item: checkboxModern1, attribute: .centerX, relatedBy: .equal, toItem: self.view,            attribute: .centerX, multiplier: 1,    constant: 0).isActive = true
//        NSLayoutConstraint(item: checkboxModern1, attribute: .width,   relatedBy: .equal, toItem: self.view,            attribute: .width,    multiplier: 0.3,  constant: 0).isActive = true
//        NSLayoutConstraint(item: checkboxModern1, attribute: .height,  relatedBy: .equal, toItem: self.checkboxModern1, attribute: .width,   multiplier: 1,    constant: 0).isActive = true
//
//        checkboxModern1.cornerRadius = 55
        
        NSLayoutConstraint(item: radioButtons[2], attribute: .centerY, relatedBy: .equal, toItem: self.view,            attribute: .bottom,  multiplier: 0.6, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[2], attribute: .centerX, relatedBy: .equal, toItem: self.view,            attribute: .centerX, multiplier: 1,   constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[2], attribute: .width,   relatedBy: .equal, toItem: self.view,            attribute: .width,   multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[2], attribute: .height,  relatedBy: .equal, toItem: self.radioButtons[2], attribute: .width,   multiplier: 1,   constant: 0).isActive = true
        
        NSLayoutConstraint(item: radioButtons[3], attribute: .centerY, relatedBy: .equal, toItem: self.view,            attribute: .bottom,  multiplier: 0.85, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[3], attribute: .centerX, relatedBy: .equal, toItem: self.view,            attribute: .centerX, multiplier: 1,    constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[3], attribute: .width,   relatedBy: .equal, toItem: self.view,            attribute: .width,   multiplier: 0.3,  constant: 0).isActive = true
        NSLayoutConstraint(item: radioButtons[3], attribute: .height,  relatedBy: .equal, toItem: self.radioButtons[3], attribute: .width,   multiplier: 1,    constant: 0).isActive = true
        
        radioButtons[0].relate(otherUIRadioButtons: radioButtons)
        radioButtons[1].relate(otherUIRadioButtons: radioButtons)
        radioButtons[2].relate(otherUIRadioButtons: radioButtons)
        radioButtons[3].relate(otherUIRadioButtons: radioButtons)
        
        NSLayoutConstraint(item: radioButton1, attribute: .centerY, relatedBy: .equal, toItem: self.view,        attribute: .centerY, multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton1, attribute: .centerX, relatedBy: .equal, toItem: self.view,        attribute: .centerX, multiplier: 0.35,   constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton1, attribute: .width,   relatedBy: .equal, toItem: self.view,        attribute: .width,   multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton1, attribute: .height,  relatedBy: .equal, toItem: self.radioButton1, attribute: .width,   multiplier: 1,   constant: 0).isActive = true
        
        NSLayoutConstraint(item: radioButton2, attribute: .centerY, relatedBy: .equal, toItem: self.view,            attribute: .centerY, multiplier: 0.75, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton2, attribute: .centerX, relatedBy: .equal, toItem: self.view,            attribute: .centerX, multiplier: 0.35,    constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton2, attribute: .width,   relatedBy: .equal, toItem: self.view,            attribute: .width,   multiplier: 0.3,  constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton2, attribute: .height,  relatedBy: .equal, toItem: self.radioButton2, attribute: .width,   multiplier: 1,    constant: 0).isActive = true
        
        NSLayoutConstraint(item: radioButton3, attribute: .centerY, relatedBy: .equal, toItem: self.view,            attribute: .bottom,  multiplier: 0.6, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton3, attribute: .centerX, relatedBy: .equal, toItem: self.view,            attribute: .centerX, multiplier: 0.35,   constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton3, attribute: .width,   relatedBy: .equal, toItem: self.view,            attribute: .width,   multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton3, attribute: .height,  relatedBy: .equal, toItem: self.radioButton3, attribute: .width,   multiplier: 1,   constant: 0).isActive = true
        
        radioButton1.relate(otherUIRadioButtons: [radioButton2, radioButton1])
        radioButton2.relate(otherUIRadioButtons: [radioButton1, radioButton2])
//        radioButton3.relate(otherUIRadioButtons: [radioButton1, radioButton2])
        
    }

}


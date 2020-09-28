//
//  ViewController.swift
//  UIButtonExtensionExample
//
//  Created by Arman Zoghi on 9/28/20.
//

import UIKit
import UIButtonExtension

class ViewController: UIViewController {
    let radioButton = UIRadioButton()
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
        view.addSubview(radioButton)
        view.addSubview(checkboxModern1)
        view.addSubview(checkboxModern2)
        view.addSubview(checkboxClassic)
        radioButton.translatesAutoresizingMaskIntoConstraints     = false
        checkboxModern1.translatesAutoresizingMaskIntoConstraints = false
        checkboxModern2.translatesAutoresizingMaskIntoConstraints = false
        checkboxClassic.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: radioButton, attribute: .centerY, relatedBy: .equal, toItem: self.view,        attribute: .centerY, multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton, attribute: .centerX, relatedBy: .equal, toItem: self.view,        attribute: .centerX, multiplier: 1,   constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton, attribute: .width,   relatedBy: .equal, toItem: self.view,        attribute: .width,   multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: radioButton, attribute: .height,  relatedBy: .equal, toItem: self.radioButton, attribute: .width,   multiplier: 1,   constant: 0).isActive = true
        
        radioButton.selectedSize = 0.6
        radioButton.borderWidth  = 10
        
        NSLayoutConstraint(item: checkboxModern1, attribute: .centerY, relatedBy: .equal, toItem: self.view,            attribute: .centerY, multiplier: 0.75, constant: 0).isActive = true
        NSLayoutConstraint(item: checkboxModern1, attribute: .centerX, relatedBy: .equal, toItem: self.view,            attribute: .centerX, multiplier: 1,    constant: 0).isActive = true
        NSLayoutConstraint(item: checkboxModern1, attribute: .width,   relatedBy: .equal, toItem: self.view,            attribute: .width,   multiplier: 0.3,  constant: 0).isActive = true
        NSLayoutConstraint(item: checkboxModern1, attribute: .height,  relatedBy: .equal, toItem: self.checkboxModern1, attribute: .width,   multiplier: 1,    constant: 0).isActive = true
        
        checkboxModern1.cornerRadius = 55
        
        NSLayoutConstraint(item: checkboxModern2, attribute: .centerY, relatedBy: .equal, toItem: self.view,            attribute: .bottom,  multiplier: 0.6, constant: 0).isActive = true
        NSLayoutConstraint(item: checkboxModern2, attribute: .centerX, relatedBy: .equal, toItem: self.view,            attribute: .centerX, multiplier: 1,   constant: 0).isActive = true
        NSLayoutConstraint(item: checkboxModern2, attribute: .width,   relatedBy: .equal, toItem: self.view,            attribute: .width,   multiplier: 0.3, constant: 0).isActive = true
        NSLayoutConstraint(item: checkboxModern2, attribute: .height,  relatedBy: .equal, toItem: self.checkboxModern2, attribute: .width,   multiplier: 1,   constant: 0).isActive = true
        
        NSLayoutConstraint(item: checkboxClassic, attribute: .centerY, relatedBy: .equal, toItem: self.view,            attribute: .bottom,  multiplier: 0.85, constant: 0).isActive = true
        NSLayoutConstraint(item: checkboxClassic, attribute: .centerX, relatedBy: .equal, toItem: self.view,            attribute: .centerX, multiplier: 1,    constant: 0).isActive = true
        NSLayoutConstraint(item: checkboxClassic, attribute: .width,   relatedBy: .equal, toItem: self.view,            attribute: .width,   multiplier: 0.3,  constant: 0).isActive = true
        NSLayoutConstraint(item: checkboxClassic, attribute: .height,  relatedBy: .equal, toItem: self.checkboxClassic, attribute: .width,   multiplier: 1,    constant: 0).isActive = true
        
    }

}


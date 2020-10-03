//
//  UIRadioButton.swift
//  UIButtonExtension
//
//  Created by Arman Zoghi on 9/28/20.
//

import Foundation
import UIKit

open class UIRadioButton: UIView {
    
    open var button : UIButton! // the outer circle which shows the Radio button it self. use this to addTarget.
    fileprivate var innerCircle : UIImageView! // the inner circle which filles if selected.
    fileprivate var btnText = UILabel() // text label if needed.
    fileprivate var innerConstraintWidth  : NSLayoutConstraint? //required inner circle width constraints to activate and deactivate at will.
    fileprivate var innerConstraintHeight : NSLayoutConstraint? //required inner circle height constraints to activate and deactivate at will.
    fileprivate var firstPressed = false // indicating if the button has been pressed once since initialized, used for the animation - IGNORE THIS.
    open var borderWidth: CGFloat!  // by default the width for the border is 3.
    open var cornerRadius: CGFloat! // by default, radio button is circle, you can change it if you want
    open var color: UIColor = UIColor.systemBlue // by default the color is system blue.
    open var selectedColor: UIColor = UIColor.systemBlue // the color of the inner circle
    open var fontSize: CGFloat! // text font changes dynamically based on the radio button height.
    open var font: UIFont! // the font for when you need a text next to the button.
    open var textColor: UIColor = .black  // text color is black by default.
    open var selectedSize: CGFloat = 0.5 // change the size of the inner circle
    open var textDistance: CGFloat = 10 // change the distance between the text label and the button
    open var animate = true // allow animation for selecting and de selecting?
    open var id = NSUUID().uuidString  // random ID for each radio button created
    open var family: [UIRadioButton] = [] // radio buttons releated to each other
    
    open var isSelected = false {     // determines wether the Radio button has been selected or not.
        didSet{
            print(isSelected)
            if isSelected == true {
                relativeSelection()
                select()
            } else {
                deselect()
            }
        }
    }

//MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configOuterCircle()
        configOuterCircleConstraints()
        configInnerCircle()
        configInnerCircleConstraints()
        family.append(self)
    }
    
    override open func layoutSubviews() {
        limitFromZeroToOne()
        super.layoutSubviews()
        radioButtonConfig()
        textConfig()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: configuration functions
    fileprivate func radioButtonConfig() {
        //outer circle
        button.clipsToBounds = true
        button.layer.borderColor  = self.color.cgColor
        if borderWidth == nil {
            borderWidth = button.frame.height / 9
        }
        button.layer.borderWidth  = borderWidth
        if cornerRadius == nil {
            cornerRadius = button.bounds.width / 2
        }
        button.layer.cornerRadius = cornerRadius
        //inner circle
        innerCircle.clipsToBounds = true
        innerCircle.backgroundColor = self.selectedColor
        
        innerCircle.layer.cornerRadius = innerCircle.bounds.width / 2
    }
    
    //outer circle:
    fileprivate func configOuterCircle() {
        button = UIButton(frame: CGRect.zero)
        self.addSubview(button)
        button.addTarget(self, action: #selector(radioButtonClicked(_:)), for: .touchUpInside)
    }
    fileprivate func configOuterCircleConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.button!, attribute: .centerY, relatedBy: .equal, toItem: self,             attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.button!, attribute: .centerX, relatedBy: .equal, toItem: self,             attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.button!, attribute: .height,  relatedBy: .equal, toItem: self,             attribute: .height,  multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.button!, attribute: .width,   relatedBy: .equal, toItem: self.button,      attribute: .height,  multiplier: 1, constant: 0).isActive = true
    }
    
    //inner circle:
    fileprivate func configInnerCircle(){
        innerCircle = UIImageView(frame: CGRect.zero)
        self.addSubview(innerCircle)
    }
    fileprivate func configInnerCircleConstraints() {
        innerCircle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.innerCircle!, attribute: .centerY, relatedBy: .equal, toItem: self.button, attribute: .centerY, multiplier: 1,   constant: 0).isActive = true
        NSLayoutConstraint(item: self.innerCircle!, attribute: .centerX, relatedBy: .equal, toItem: self.button, attribute: .centerX, multiplier: 1,   constant: 0).isActive = true
    }
    fileprivate func selectedConstraint() {
        if firstPressed == true {
            NSLayoutConstraint.deactivate([innerConstraintWidth!, innerConstraintHeight!]) //deactivates the secondary constraints only if it's not the first time
        }
        innerConstraintWidth  = NSLayoutConstraint(item: self.innerCircle!, attribute: .width,  relatedBy: .equal, toItem: self.button,      attribute: .width,   multiplier: selectedSize, constant: 0)
        innerConstraintHeight = NSLayoutConstraint(item: self.innerCircle!, attribute: .height, relatedBy: .equal, toItem: self.innerCircle, attribute: .width,   multiplier: 1,            constant: 0)
        NSLayoutConstraint.activate([innerConstraintWidth!, innerConstraintHeight!])
        firstPressed = true // this code has ran through for the first time
    }
    fileprivate func deselectConstraint() {
        NSLayoutConstraint.deactivate([innerConstraintWidth!, innerConstraintHeight!])
        innerConstraintWidth  = NSLayoutConstraint(item: self.innerCircle!, attribute: .width,  relatedBy: .equal, toItem: self,             attribute: .width,  multiplier: 0.001, constant: 0)
        innerConstraintHeight = NSLayoutConstraint(item: self.innerCircle!, attribute: .height, relatedBy: .equal, toItem: self.innerCircle, attribute: .width,  multiplier: 1,     constant: 0)
        NSLayoutConstraint.activate([innerConstraintWidth!, innerConstraintHeight!])
    }
    
    //size limit
    func limitFromZeroToOne() {
        if selectedSize > 1 {
            selectedSize = 1
        }
        if selectedSize < 0 {
            selectedSize = 0.1
        }
    }
//MARK: - relationship functions
    //relate buttons
    open func relate(otherUIRadioButtons: [UIRadioButton]) {
        family.append(contentsOf: otherUIRadioButtons)
        if otherUIRadioButtons.contains(self) {
            family = family.filter{$0 != self}
        }
        print(family)
    }
    
    fileprivate func relativeSelection() {
        var x = 0
        if family.contains(self) {
            x = 1
        }
        let limit = family.count
        while x != limit {
            if family[x].isSelected == true {
                family[x].isSelected = false
            }
            x += 1
        }
    }
//MARK: Text
    //text configs:
    open func leftText(_ text: String) {
        btnText.text = text
        self.addSubview(btnText)
        leftModeConstraints()
    }
    
    open func rightText(_ text: String) {
        btnText.text = text
        self.addSubview(btnText)
        rightModeConstraints()
       }
    
    open func topText(_ text: String) {
        btnText.text = text
        self.addSubview(btnText)
        topModeConstraints()
       }
    
    open func bottomText(_ text: String) {
        btnText.text = text
        self.addSubview(btnText)
        bottomModeConstraints()
       }
    
    fileprivate func textConfig(){
        fontSize = button.frame.height / 1.5
        btnText.font = font
        btnText.font = .systemFont(ofSize: self.fontSize)
        btnText.textColor = self.textColor
    }
    
    //text constraints
    fileprivate func leftModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .top,    relatedBy: .equal, toItem: button, attribute: .top,    multiplier: 1, constant: 0).isActive             = true
        NSLayoutConstraint(item: btnText, attribute: .bottom, relatedBy: .equal, toItem: button, attribute: .bottom, multiplier: 1, constant: 0).isActive             = true
        NSLayoutConstraint(item: btnText, attribute: .right,  relatedBy: .equal, toItem: button, attribute: .left,   multiplier: 1, constant: -textDistance).isActive = true
    }
    
    fileprivate func rightModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .top,    relatedBy: .equal, toItem: button, attribute: .top,    multiplier: 1, constant: 0).isActive            = true
        NSLayoutConstraint(item: btnText, attribute: .bottom, relatedBy: .equal, toItem: button, attribute: .bottom, multiplier: 1, constant: 0).isActive            = true
        NSLayoutConstraint(item: btnText, attribute: .left,   relatedBy: .equal, toItem: button, attribute: .right,  multiplier: 1, constant: textDistance).isActive = true
    }
    
    fileprivate func topModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .bottom,  relatedBy: .equal, toItem: button, attribute: .top,     multiplier: 1, constant: -textDistance).isActive = true
        NSLayoutConstraint(item: btnText, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1, constant: 0).isActive             = true
    }
    
    fileprivate func bottomModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .top,     relatedBy: .equal, toItem: button, attribute: .bottom,  multiplier: 1, constant: textDistance).isActive = true
        NSLayoutConstraint(item: btnText, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1, constant: 0).isActive            = true
    }
    
//MARK: - Animations
    //select function and it's animation
    fileprivate func select() {
        self.innerCircle.isHidden = false
        selectedConstraint()
        if animate == true {
            selectAnimate()
        }
    }
    
    fileprivate func selectAnimate() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 45, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    //deselect function and it's animation
    fileprivate func deselect() {
        deselectConstraint()
        if animate == true {
            deselectAnimate()
        } else {
            self.innerCircle.isHidden = true
        }
    }
    
    fileprivate func deselectAnimate() {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3, options: .curveEaseIn, animations: {
            self.layoutIfNeeded()
        }, completion: {
            finished in
            self.innerCircle.isHidden = true
        })
    }
    
//MARK: objc
    // method for when the radio button is clicked:
    @objc func radioButtonClicked(_ sender: UIButton) {
        if isSelected == false {
            isSelected = true
        }
        
        print("button with ID:  \(id) is selected? \(isSelected)")
    }
    
}

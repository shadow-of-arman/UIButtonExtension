//
//  UICheckboxModern.swift
//  UIButtonExtension
//
//  Created by Arman Zoghi on 9/28/20.
//

import Foundation
import UIKit

open class UICheckboxModern: UIView {
    
    open var button : UIButton! // the outer box. use this to addTarget
    fileprivate var checkmark : UIImageView! // the check view
    fileprivate var btnText = UILabel() // text label if needed.
    fileprivate var innerConstraintWidth  : NSLayoutConstraint? //required checkmark width constraints to activate and deactivate at will.
    fileprivate var innerConstraintHeight : NSLayoutConstraint? //required checkmark height constraints to activate and deactivate at will.
    fileprivate var firstPressed = false // indicating if the button has been pressed once since initialized, used for the animation - IGNORE THIS.
    fileprivate var checkmarkImage = UIImage() // the image used for the checkmark
    open private(set) var isSelected = false // determines wether the checkbox has been checked or not.
    open var borderWidth: CGFloat! // by default the width for the border is 3.
    open var color: UIColor = UIColor.darkGray // by default the color is system blue.
    open var selectedColor: UIColor = UIColor.systemBlue // the color of the inner check mark
    open var fontSize: CGFloat! // text font changes dynamically based on the checkbox button height.
    open var font: UIFont! // the font for when you need a text next to the button.
    open var textColor: UIColor = .black // text color is black by default.
    open var id = NSUUID().uuidString // random ID for each radio button created
    open var animate = true // allow animation for selecting and de-selecting?
    open var checkedImage = "check1"
    open var cornerRadius: CGFloat = 5 // the cornerRadius for the box
    open var textDistance: CGFloat = 10

    
//MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBox()
        configBoxConstraints()
        configCheckmark()
        configCheckmarkConstraints()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        checkboxConfig()
        textConfig()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: configuration functions
    fileprivate func checkboxConfig() {
        button.clipsToBounds = true
        button.layer.borderColor  = self.color.cgColor
        borderWidth = button.frame.height / 9
        button.layer.borderWidth  = borderWidth
        button.layer.cornerRadius = cornerRadius
        
        checkmark.clipsToBounds = true
        checkmark.backgroundColor = self.selectedColor
        checkmark.layer.cornerRadius = cornerRadius
    }
    
    //box:
    fileprivate func configBox() {
        button = UIButton(frame: CGRect.zero)
        self.addSubview(button)
        button.addTarget(self, action: #selector(radioButtonClicked(_:)), for: .touchUpInside)
    }
    fileprivate func configBoxConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.button!, attribute: .centerY, relatedBy: .equal, toItem: self,             attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.button!, attribute: .centerX, relatedBy: .equal, toItem: self,             attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.button!, attribute: .height,  relatedBy: .equal, toItem: self,             attribute: .height,  multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.button!, attribute: .width,   relatedBy: .equal, toItem: self.button, attribute: .height,  multiplier: 1, constant: 0).isActive = true
    }
    
    //checkmark:
    fileprivate func configCheckmark(){
        checkmarkImage = UIImage(named: checkedImage, in: Bundle(for: type(of: self)), compatibleWith: nil)!
        checkmark = UIImageView(frame: CGRect.zero)
        self.addSubview(checkmark)
    }
    fileprivate func configCheckmarkConstraints() {
        checkmark.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.checkmark!, attribute: .centerY, relatedBy: .equal, toItem: self.button, attribute: .centerY, multiplier: 1,   constant: 0).isActive = true
        NSLayoutConstraint(item: self.checkmark!, attribute: .centerX, relatedBy: .equal, toItem: self.button, attribute: .centerX, multiplier: 1,   constant: 0).isActive = true
    }
    fileprivate func selectedConstraint() {
        if firstPressed == true {
            NSLayoutConstraint.deactivate([innerConstraintWidth!, innerConstraintHeight!]) //deactivates the secondary constraints only if it's not the first time
        }
        innerConstraintWidth  = NSLayoutConstraint(item: self.checkmark!, attribute: .height, relatedBy: .equal, toItem: self,           attribute: .height, multiplier: 1, constant: 0)
        innerConstraintHeight = NSLayoutConstraint(item: self.checkmark!, attribute: .width,  relatedBy: .equal, toItem: self.checkmark, attribute: .height, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([innerConstraintWidth!, innerConstraintHeight!])
        firstPressed = true // this code has ran through for the first time
    }
    fileprivate func deselectConstraint() {
        NSLayoutConstraint.deactivate([innerConstraintWidth!, innerConstraintHeight!])
        innerConstraintWidth  = NSLayoutConstraint(item: self.checkmark!, attribute: .width,  relatedBy: .equal, toItem: self,           attribute: .width,  multiplier: 0.001, constant: 0)
        innerConstraintHeight = NSLayoutConstraint(item: self.checkmark!, attribute: .height, relatedBy: .equal, toItem: self.checkmark, attribute: .width,  multiplier: 1,     constant: 0)
        NSLayoutConstraint.activate([innerConstraintWidth!, innerConstraintHeight!])
    }
    
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
        fontSize = button.frame.height * 1.2
        btnText.font = font
        btnText.font = .systemFont(ofSize: self.fontSize)
        btnText.textColor = self.textColor
    }
    
    //text constraints
    fileprivate func leftModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .centerY, relatedBy: .equal, toItem: button, attribute: .centerY, multiplier: 0.9, constant: 0).isActive             = true
        NSLayoutConstraint(item: btnText, attribute: .height,  relatedBy: .equal, toItem: button, attribute: .height,  multiplier: 1,   constant: 0).isActive             = true
        NSLayoutConstraint(item: btnText, attribute: .right,   relatedBy: .equal, toItem: button, attribute: .left,    multiplier: 1,   constant: -textDistance).isActive = true
    }
    
    fileprivate func rightModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .centerY, relatedBy: .equal, toItem: button, attribute: .centerY, multiplier: 0.9, constant: 0).isActive            = true
        NSLayoutConstraint(item: btnText, attribute: .height,  relatedBy: .equal, toItem: button, attribute: .height,  multiplier: 1,   constant: 0).isActive            = true
        NSLayoutConstraint(item: btnText, attribute: .left,    relatedBy: .equal, toItem: button, attribute: .right,   multiplier: 1,   constant: textDistance).isActive = true
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
    //select function and it's animation
    open func select() {
        self.checkmark.isHidden = false
        checkmark.image = checkmarkImage
        selectedConstraint()
        if animate == true {
            selectAnimate()
        }
        isSelected = true
    }
    
    fileprivate func selectAnimate() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 45, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    //deselect function and it's animation
    open func deselect() {
        deselectConstraint()
        if animate == true {
            deselectAnimate()
        } else {
            self.checkmark.isHidden = true
        }
        isSelected = false
    }
    
    fileprivate func deselectAnimate() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3, options: .curveEaseIn, animations: {
            self.layoutIfNeeded()
        }, completion: {
            finished in
            self.checkmark.isHidden = true
        })
    }
    
//MARK: objc
    // method for when the checkbox is clicked:
    @objc func radioButtonClicked(_ sender: UIButton) {
        if isSelected == false {
            select()
        } else {
            deselect()
        }
        print("button with ID:  \(id) is selected? \(isSelected)")
    }
    
}

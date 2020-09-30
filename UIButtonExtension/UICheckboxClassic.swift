//
//  UICheckboxClassic.swift
//  UIButtonExtension
//
//  Created by Arman Zoghi on 9/28/20.
//

import Foundation
import UIKit

open class UICheckboxClassic: UIView {
    
    fileprivate var box : UIButton! // the outer box
    fileprivate var checkmark : UIImageView! // the check view
    fileprivate var btnText = UILabel() // text label if needed.
    private(set) var isSelected = false // determines wether the checkbox has been checked or not.
    fileprivate var innerConstraintWidth  : NSLayoutConstraint? //required checkmark width constraints to activate and deactivate at will.
    fileprivate var innerConstraintHeight : NSLayoutConstraint? //required checkmark height constraints to activate and deactivate at will.
    fileprivate var firstPressed = false // indicating if the button has been pressed once since initialized, used for the animation - IGNORE THIS.
    fileprivate var checkmarkImage = UIImage() // the image used for the checkmark
    open var borderWidth: CGFloat! // by default the width for the border is 3.
    open var color: UIColor = UIColor.darkGray // by default the color is system blue.
    open var fontSize: CGFloat! // text font changes dynamically based on the checkbox button height.
    open var font: UIFont!
    open var textColor: UIColor = .black // text color is black by default.
    open var id = NSUUID().uuidString
    open var animate = true // allow animation for selecting and de-selecting?
    open var checkedImage = "check2"
    open var cornerRadius: CGFloat = 5 // the cornerRadius for the box

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
        box.clipsToBounds = true
        box.layer.borderColor  = self.color.cgColor
        borderWidth = box.frame.height / 8
        box.layer.borderWidth  = borderWidth
        box.layer.cornerRadius = cornerRadius

        checkmark.clipsToBounds = true
        checkmark.layer.cornerRadius = cornerRadius
    }
    
    //box:
    fileprivate func configBox() {
        box = UIButton(frame: CGRect.zero)
        self.addSubview(box)
        box.addTarget(self, action: #selector(radioButtonClicked(_:)), for: .touchUpInside)
    }
    fileprivate func configBoxConstraints() {
        box.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.box!, attribute: .centerY, relatedBy: .equal, toItem: self,     attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.box!, attribute: .centerX, relatedBy: .equal, toItem: self,     attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.box!, attribute: .height,  relatedBy: .equal, toItem: self,     attribute: .height,  multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.box!, attribute: .width,   relatedBy: .equal, toItem: self.box, attribute: .height,  multiplier: 1, constant: 0).isActive = true
    }
    
    //checkmark:
    fileprivate func configCheckmark(){
        checkmarkImage = UIImage(named: checkedImage, in: Bundle(for: type(of: self)), compatibleWith: nil)!
        checkmark = UIImageView(frame: CGRect.zero)
        self.addSubview(checkmark)
    }
    fileprivate func configCheckmarkConstraints() {
        checkmark.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: self.checkmark!, attribute: .centerY, relatedBy: .equal, toItem: self.box, attribute: .centerY, multiplier: 0.7,   constant: 0).isActive = true
        NSLayoutConstraint(item: self.checkmark!, attribute: .centerX, relatedBy: .equal, toItem: self.box, attribute: .centerX, multiplier: 1.4,   constant: 0).isActive = true
    }
    fileprivate func selectedConstraint() {
        if firstPressed == true {
            NSLayoutConstraint.deactivate([innerConstraintWidth!, innerConstraintHeight!]) //deactivates the secondary constraints only if it's not the first time
        }
        innerConstraintWidth  = NSLayoutConstraint(item: self.checkmark!, attribute: .height, relatedBy: .equal, toItem: self,           attribute: .height,   multiplier: 1, constant: 0)
        innerConstraintHeight = NSLayoutConstraint(item: self.checkmark!, attribute: .width,  relatedBy: .equal, toItem: self.checkmark, attribute: .height,   multiplier: 1, constant: 0)
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
        fontSize = box.frame.height * 1.2
        btnText.font = font
        btnText.font = .systemFont(ofSize: self.fontSize)
        btnText.textColor = self.textColor
    }
    
    //text constraints
    fileprivate func leftModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .centerY, relatedBy: .equal, toItem: box, attribute: .centerY, multiplier: 0.9, constant: 0).isActive   = true
        NSLayoutConstraint(item: btnText, attribute: .height,  relatedBy: .equal, toItem: box, attribute: .height,  multiplier: 1,   constant: 0).isActive   = true
        NSLayoutConstraint(item: btnText, attribute: .right,   relatedBy: .equal, toItem: box, attribute: .left,    multiplier: 1,   constant: -10).isActive = true
    }
    
    fileprivate func rightModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .centerY, relatedBy: .equal, toItem: box, attribute: .centerY, multiplier: 0.9, constant: 0).isActive  = true
        NSLayoutConstraint(item: btnText, attribute: .height,  relatedBy: .equal, toItem: box, attribute: .height,  multiplier: 1,   constant: 0).isActive  = true
        NSLayoutConstraint(item: btnText, attribute: .left,    relatedBy: .equal, toItem: box, attribute: .right,   multiplier: 1,   constant: 10).isActive = true
    }
    
    fileprivate func topModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .bottom,  relatedBy: .equal, toItem: box, attribute: .top,     multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: btnText, attribute: .centerX, relatedBy: .equal, toItem: box, attribute: .centerX, multiplier: 1, constant: 0).isActive   = true
    }
    
    fileprivate func bottomModeConstraints() {
        btnText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btnText, attribute: .top,     relatedBy: .equal, toItem: box, attribute: .bottom,  multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: btnText, attribute: .centerX, relatedBy: .equal, toItem: box, attribute: .centerX, multiplier: 1, constant: 0).isActive  = true
    }
    //select function and it's animation
    fileprivate func select() {
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
    fileprivate func deselect() {
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

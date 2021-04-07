//
//  PinViewController.swift
//  Stream Mobile App
//
//  Created by Temitope on 03/04/2021.
//

import UIKit
import OTPFieldView
import Firebase

class PinViewController: UIViewController {
    var otpPin = ""
    
    let db = Firestore.firestore()
    @IBOutlet weak var pinField: OTPFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPinView()
       
    }
    func setupPinView(){
        self.pinField.fieldsCount = 4
        self.pinField.secureEntry = true
        self.pinField.fieldBorderWidth = 0.5
        self.pinField.filledBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.pinField.defaultBorderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.pinField.filledBorderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.pinField.cursorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.pinField.displayType = .underlinedBottom
        self.pinField.fieldSize = 40
        self.pinField.separatorSpace = 8
        self.pinField.shouldAllowIntermediateEditing = false
        self.pinField.delegate = self
        self.pinField.initializeUI()
    }
    
    enum DisplayType: Int {
        case circular
        case roundedCorner
        case square
        case diamond
        case underlinedBottom
    }
    @IBAction func backtoVerification(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pinCreated(_ sender: Any) {
        print(otpPin)
        if let sender = Auth.auth().currentUser?.email {
            db.collection("userPin").addDocument(data: ["pin": otpPin, "sender": sender]) { (error) in
                if let e = error{
                    print(e)
                }else {
                    print("successfull added data")
                }
            }
            
        }
        
    }
}
extension PinViewController: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        otpPin = otpString
        print("OTPString: \(otpString)")
     
        
    }
}

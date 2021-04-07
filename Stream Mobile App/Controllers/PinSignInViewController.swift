//
//  PinSignInViewController.swift
//  Stream Mobile App
//
//  Created by Temitope on 07/04/2021.
//

import UIKit
import Firebase
import OTPFieldView

class PinSignInViewController: UIViewController {
    
    var pin = ""
    var data = ""
    let db = Firestore.firestore()
    

    @IBOutlet weak var loginPinField: OTPFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPinView()
        
    }
    func setupPinView(){
        self.loginPinField.fieldsCount = 4
        self.loginPinField.secureEntry = true
        self.loginPinField.fieldBorderWidth = 0.5
        self.loginPinField.filledBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.loginPinField.defaultBorderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.loginPinField.filledBorderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.loginPinField.cursorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.loginPinField.displayType = .underlinedBottom
        self.loginPinField.fieldSize = 40
        self.loginPinField.separatorSpace = 8
        self.loginPinField.shouldAllowIntermediateEditing = false
        self.loginPinField.delegate = self
        self.loginPinField.initializeUI()
    }
    
    enum DisplayType: Int {
        case circular
        case roundedCorner
        case square
        case diamond
        case underlinedBottom
    }

    
    @IBAction func pinCreated(_ sender: Any) {
                
        Auth.auth().signIn(withEmail: "tope@mail.com", password: "111111") { authResult, error in if let e = error {
            print(e)
        }else{
            print("Succesfully login")
        }

        }

        db.collection("userPin").whereField("sender", isEqualTo: "tope@mail.com")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()["pin"] as? String
                        if data == self.pin {
                            self.performSegue(withIdentifier: "pinLogin", sender:self )
                        }
                    }
                }
        }
        
//        if let sender = Auth.auth().currentUser?.email {
//            db.collection("userPin").addDocument(data: ["pin": otpPin, "sender": sender]) { (error) in
//                if let e = error{
//                    print(e)
//                }else {
//                    print("successfull added data")
//                    self.performSegue(withIdentifier: "pinLogin", sender:self )
//                }
//            }
//
//        }
        
    }
}
extension PinSignInViewController: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        pin = otpString
        print("OTPString: \(otpString)")
     
        
    }
}

   


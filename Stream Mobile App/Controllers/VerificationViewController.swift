//
//  VerificationViewController.swift
//  Stream Mobile App
//
//  Created by Temitope on 02/04/2021.
//

import UIKit
import OTPFieldView

class VerificationViewController: UIViewController {
    
    
    
    @IBOutlet weak var otpTextFieldView: OTPFieldView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupOtpView()
        // Do any additional setup after loading the view.
    }
    func setupOtpView(){
        self.otpTextFieldView.fieldsCount = 6
        self.otpTextFieldView.fieldBorderWidth = 0.5
        self.otpTextFieldView.defaultBorderColor = UIColor.black
        self.otpTextFieldView.filledBorderColor = #colorLiteral(red: 0, green: 0.3607843137, blue: 0.9333333333, alpha: 1)
        self.otpTextFieldView.cursorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.otpTextFieldView.displayType = .underlinedBottom
        self.otpTextFieldView.fieldSize = 40
        self.otpTextFieldView.separatorSpace = 8
        self.otpTextFieldView.shouldAllowIntermediateEditing = false
        self.otpTextFieldView.delegate = self
        self.otpTextFieldView.initializeUI()
    }
    
    enum DisplayType: Int {
        case circular
        case roundedCorner
        case square
        case diamond
        case underlinedBottom
    }
    @IBAction func bactToRegistration(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension VerificationViewController: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
    }
}

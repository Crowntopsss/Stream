//
//  PersonalInfoViewController.swift
//  Stream Mobile App
//
//  Created by Temitope on 02/04/2021.
//

import UIKit
import Firebase

class PersonalInfoViewController: UIViewController {
    
    let db = Firestore.firestore()

    @IBOutlet weak var birthDate: UITextField!
    @IBOutlet weak var genderPick: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var fullName: UITextField!
    
    let datePicker = UIDatePicker()
    let genderPicker = UIPickerView()
    
    let gendertype = ["Male","Female"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createDatePicker()
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        genderPick.inputView = genderPicker
    }
    
    @IBAction func goToPinPage(_ sender: UIButton) {
        if let birthDay = birthDate.text, let gender = genderPick.text, let phoneNo = phoneNumber.text, let fullPersonName = fullName.text, let sender = Auth.auth().currentUser?.email {
            db.collection("PersonalInfo").addDocument(data: ["fullName" : fullPersonName, "phoneNumber":phoneNo, "gender":gender, "birthday": birthDay, "sender": sender]) { (error) in
                if let e = error{
                    print(e)
                }else {
                    print("successfull added data")
                }
            }
            
        }
        
        self.performSegue(withIdentifier: "goToPin", sender:self )

        
    }
    @IBAction func backToVerifiction(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
    }
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        birthDate.inputAccessoryView = toolbar
        
        birthDate.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }


}
extension PersonalInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gendertype.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gendertype[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderPick.text = gendertype[row]
        genderPick.resignFirstResponder()
    }
    
}

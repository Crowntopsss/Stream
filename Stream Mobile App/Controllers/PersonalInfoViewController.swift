//
//  PersonalInfoViewController.swift
//  Stream Mobile App
//
//  Created by Temitope on 02/04/2021.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    @IBOutlet weak var birthDate: UITextField!
    @IBOutlet weak var genderPick: UITextField!
    
    let datePicker = UIDatePicker()
    let genderPicker = UIPickerView()
    
    let gender = ["Male","Female"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createDatePicker()
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        genderPick.inputView = genderPicker
    }
    
    @IBAction func goToPinPage(_ sender: UIButton) {
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
        return gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderPick.text = gender[row]
        genderPick.resignFirstResponder()
    }
    
}

//
//  PersonalInfoViewController.swift
//  Stream Mobile App
//
//  Created by Temitope on 02/04/2021.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    @IBOutlet weak var birthDate: UITextField!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createDatePicker()
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

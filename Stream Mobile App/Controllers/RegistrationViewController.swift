//
//  RegistrationViewController.swift
//  Stream Mobile App
//
//  Created by Temitope on 02/04/2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func SendVerification(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToVerification", sender:self )
    }
    
    @IBAction func backToStart(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

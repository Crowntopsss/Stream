//
//  ViewController.swift
//  Stream Mobile App
//
//  Created by Temitope on 31/03/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showRegPage()
        // Do any additional setup after loading the view.
    }
    
    func showRegPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func loginToPin(_ sender: UIButton) {
        performSegue(withIdentifier: "loginFromHome", sender:self )

    }
    
}


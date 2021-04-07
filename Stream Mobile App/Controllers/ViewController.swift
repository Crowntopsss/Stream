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
        // Do any additional setup after loading the view.
    }

    @IBAction func loginToPin(_ sender: UIButton) {
        performSegue(withIdentifier: "loginFromHome", sender:self )

    }
    
}


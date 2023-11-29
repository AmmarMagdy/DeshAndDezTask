//
//  CreateAdViewController.swift
//  DeshAndDezTask
//
//  Created by Ammar.M on 29/11/2023.
//

import UIKit

class CreateAdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func createAd(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

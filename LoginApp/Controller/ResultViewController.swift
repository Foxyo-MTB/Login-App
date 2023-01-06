//
//  ResultViewController.swift
//  LoginApp
//
//  Created by Vladimir Beliakov on 05.09.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    
    var welcomeResult = ResultModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Welcome, \(welcomeResult.name ?? "No login added")"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}

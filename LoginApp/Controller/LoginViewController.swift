//
//  ViewController.swift
//  LoginApp
//
//  Created by Vladimir Beliakov on 05.09.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    let loginModel = LoginModel()
    var loginManager = LoginManager()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loginField.delegate = self
        passwordField.delegate = self
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Login is \(loginModel.login)", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func passwordButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Password is \(loginModel.password)", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        performLoginAction()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            let data = ResultModel(name: loginModel.login)
            destinationVC.welcomeResult = data
        }
    }
    
    func performLoginAction() {
        
        guard loginManager.loginApproval(login: loginField.text!, password: passwordField.text!) else {
            
            let alert = UIAlertController(title: "Wrong Login or Password", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            passwordField.text?.removeAll()
            return
        }
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginField {
            loginField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        } else {
            performLoginAction()
        }
        return true
    }
    
    
}

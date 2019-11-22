//
//  ViewController.swift
//  Exercise
//
//  Created by Álvaro Ávalos Hernández on 21/11/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: Propiertes
    let dbManager = DBManager()
    
    let containerFormView = CustomUIView()
    let nameTextField = CustomTextField(with: "Name")
    let lastTextField = CustomTextField(with: "Last Name")
    let motherOfLastTextField = CustomTextField(with: "Mother's Last Name")
    let emailTextField = CustomTextField(with: "Email")
    let telephoneTextField = CustomTextField(with: "Telephone")
    let registerButton = CustomButton(with: "Register")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        registerButton.addTarget(self, action: #selector(loginForm), for: .touchUpInside)
        setupView()
    }
    
    //MARK: Login Form
    
    /// Validate the data depending on whether you are a new user, if it already exists or if there is an error in some type of data.
    @objc func loginForm() {
        //Validate fields
        let response = Validation.shared.validate(values:
            (ValidationType.stringWithFirstLetterCaps, (nameTextField.text)!),
            (ValidationType.stringWithFirstLetterCaps, (lastTextField.text)!),
            (ValidationType.stringWithFirstLetterCaps, (motherOfLastTextField.text)!),
            (ValidationType.email, (emailTextField.text)!),
            (ValidationType.phoneNo, (telephoneTextField.text)!))
        
        switch response {
        case .success:
            if dbManager.loadUser(name: nameTextField.text!, last: lastTextField.text!, motherOfLast: motherOfLastTextField.text!, email: emailTextField.text!, telephone: telephoneTextField.text!) {
                showAlert(title: "Error", message: "It already exists")
            } else {
                dbManager.saveUser(name: nameTextField.text!, last: lastTextField.text!, motherOfLast: motherOfLastTextField.text!, email: emailTextField.text!, telephone: telephoneTextField.text!)
                clearTextFields()
                showAlert(title: "Success", message: "")
            }
            break
        case .failure(_, let message):
            showAlert(title: "Failure", message: message.localized())
            break
        }
        
    }
    
    //MARK: Show Alert
    
    /// It shows the alert according to the validity of the data.
    /// - Parameter title: Alert title
    /// - Parameter message: Message according to the type of alert.
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(actionOk)
        present(alertController, animated: true)
    }
 
}


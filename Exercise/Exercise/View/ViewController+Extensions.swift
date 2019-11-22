//
//  ViewController+Extensions.swift
//  Exercise
//
//  Created by Álvaro Ávalos Hernández on 21/11/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit

extension ViewController {
    //MARK: AutoLayout Anchors
    
    /// Displays on-screen view objects with their corresponding constraints.
    func setupView() {
        //Background
        view.backgroundColor = UIColor(red: 34/255, green: 102/255, blue: 102/255, alpha: 1)
        
        //Container
        view.addSubview(containerFormView)
        NSLayoutConstraint.activate([
            containerFormView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerFormView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerFormView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            containerFormView.heightAnchor.constraint(equalToConstant: 300)])
        
        //TextFields
        view.addSubview(nameTextField)
        view.addSubview(lastTextField)
        view.addSubview(motherOfLastTextField)
        view.addSubview(emailTextField)
        view.addSubview(telephoneTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.trailingAnchor.constraint(equalTo: containerFormView.trailingAnchor),
            nameTextField.topAnchor.constraint(equalTo: containerFormView.topAnchor),
            nameTextField.widthAnchor.constraint(equalTo: containerFormView.widthAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 60)])
        
        NSLayoutConstraint.activate([
            lastTextField.trailingAnchor.constraint(equalTo: containerFormView.trailingAnchor),
            lastTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            lastTextField.widthAnchor.constraint(equalTo: containerFormView.widthAnchor),
            lastTextField.heightAnchor.constraint(equalToConstant: 60)])
        
        NSLayoutConstraint.activate([
            motherOfLastTextField.trailingAnchor.constraint(equalTo: containerFormView.trailingAnchor),
            motherOfLastTextField.topAnchor.constraint(equalTo: lastTextField.bottomAnchor),
            motherOfLastTextField.widthAnchor.constraint(equalTo: containerFormView.widthAnchor),
            motherOfLastTextField.heightAnchor.constraint(equalToConstant: 60)])
        
        NSLayoutConstraint.activate([
            emailTextField.trailingAnchor.constraint(equalTo: containerFormView.trailingAnchor),
            emailTextField.topAnchor.constraint(equalTo: motherOfLastTextField.bottomAnchor),
            emailTextField.widthAnchor.constraint(equalTo: containerFormView.widthAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 60)])
        
        NSLayoutConstraint.activate([
            telephoneTextField.trailingAnchor.constraint(equalTo: containerFormView.trailingAnchor),
            telephoneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            telephoneTextField.widthAnchor.constraint(equalTo: containerFormView.widthAnchor),
            telephoneTextField.heightAnchor.constraint(equalToConstant: 60)])
        
        //Button
        view.addSubview(registerButton)
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: containerFormView.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: containerFormView.bottomAnchor, constant: 20),
            registerButton.widthAnchor.constraint(equalTo: containerFormView.widthAnchor, constant: 0.5),
            registerButton.heightAnchor.constraint(equalToConstant: 50)])
        
    }
    
    //MARK: Clear TextFields
    
    /// Clean the textfields after adding a new user.
    func clearTextFields() {
        nameTextField.text = ""
        lastTextField.text = ""
        motherOfLastTextField.text = ""
        emailTextField.text = ""
        telephoneTextField.text = ""
    }
    
    //MARK: Convert to lower case
    
    /// Convert any type of text to runtime in lowercase.
    @objc func textFieldDidChange() {
            if let text: String = emailTextField.text {
                DispatchQueue.main.async {
                    self.emailTextField.text = text.lowercased()
                }
            }
    }
}

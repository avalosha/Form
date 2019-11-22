//
//  CustomTextField.swift
//  Exercise
//
//  Created by Álvaro Ávalos Hernández on 21/11/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit

final class CustomTextField: UITextField {

    init(with placeholder: String) {
        super.init(frame: CGRect())
        self.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.attributedPlaceholder = NSAttributedString(string: placeholder,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

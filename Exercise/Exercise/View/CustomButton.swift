//
//  CustomButton.swift
//  Exercise
//
//  Created by Álvaro Ávalos Hernández on 21/11/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit

final class CustomButton: UIButton {

    init(with title: String) {
        super.init(frame: CGRect())
        self.backgroundColor = UIColor(red: 0/255, green: 51/255, blue: 51/255, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        let colorTitle = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.setTitleColor(colorTitle, for: .normal)
        self.setTitle(title, for: .normal)
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

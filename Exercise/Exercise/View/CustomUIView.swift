//
//  CustomUIView.swift
//  Exercise
//
//  Created by Álvaro Ávalos Hernández on 21/11/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit

final class CustomUIView: UIView {
    
    init() {
        super.init(frame: CGRect())
        self.backgroundColor = UIColor(red: 13/255, green: 77/255, blue: 77/255, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

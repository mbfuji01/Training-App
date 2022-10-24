//
//  UILabel + Extensions.swift
//  TrainingApp
//
//  Created by demasek on 23.10.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "") {
        self.init()
        
        self.text = text
        self.font = .robotoMedium14()
        self.textColor = .specialLightBrown
        self.translatesAutoresizingMaskIntoConstraints = false 
    }
}

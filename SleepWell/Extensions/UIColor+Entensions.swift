//
//  UIColor+Entensions.swift
//  SleepWell
//
//  Created by Muhammad Yusuf on 25/10/23.
//

import SwiftUI


extension UIColor {
    static var navyBlue: UIColor {
        return UIColor(red: 0.41, green: 0.56, blue: 0.108, alpha: 1.0)
    }
    
    static var taupe: UIColor {
        return UIColor(red: 0.56, green: 0.47, blue: 0.35, alpha: 1.0)
    }
    
    static func fromSwiftUIColor(_ color: Color) -> UIColor {
        return UIColor(color)
    }
}
